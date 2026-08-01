#!/usr/bin/env ruby

require 'cgi'
require 'yaml'

path = ARGV[0]
unless path && File.file?(path)
  warn 'FAIL: syllabus path is missing or unreadable'
  exit 1
end

begin
  size = File.size(path)
rescue Errno::ENOENT, Errno::EACCES
  warn 'FAIL: syllabus path is missing or unreadable'
  exit 1
end
if size > 1_000_000
  warn 'FAIL: syllabus exceeds safe file-size bound'
  exit 1
end

begin
  text = File.binread(path).force_encoding(Encoding::UTF_8)
rescue Errno::ENOENT, Errno::EACCES
  warn 'FAIL: syllabus path is missing or unreadable'
  exit 1
end
unless text.valid_encoding?
  warn 'FAIL: syllabus is not valid UTF-8'
  exit 1
end
if text.bytesize > 1_000_000
  warn 'FAIL: syllabus exceeds safe file-size bound'
  exit 1
end

errors = []
check = ->(condition, message) { errors << message unless condition }
section = ->(heading) { text[/^## #{Regexp.escape(heading)}\n(.*?)(?=^## |\z)/m] || '' }
cells = ->(line) { line.split('|').map(&:strip) }

decode_entities = lambda do |value|
  CGI.unescapeHTML(value).gsub(/&Tab;/i, "\t").gsub(/&NewLine;/i, "\n").gsub(/&colon;/i, ':')
end
decoded = text
decode_rounds = 0
decode_limit = 64
decode_size_limit = 1_000_000
loop do
  next_decoded = decode_entities.call(decoded)
  break if next_decoded == decoded
  decode_rounds += 1
  if decode_rounds > decode_limit || next_decoded.bytesize > decode_size_limit
    errors << 'encoded content exceeds safe decoding bound'
    decoded = ''
    break
  end
  decoded = next_decoded
end

headings = [
  '교과목 개요', '운영 전제 및 선수지식', '학습성과 및 평가 정렬', '평가 방법',
  '15주 수업 일정', '실습 마일스톤 및 제출 증거', '운영 환경 및 대체 실습 매트릭스',
  '안전·윤리·비용·개인정보·접근성 정책', '교수자 사전 준비 및 장애 복구', '최신성·출처 기준'
]
actual_headings = text.lines.grep(/^## /).map { |line| line.sub(/^## /, '').strip }
check.call(!text.include?("\r") && text.end_with?("\n"), 'invalid line endings or missing final newline')
check.call(actual_headings == headings, 'required headings must be exact, unique, and ordered')
check.call(!text.match?(/\b(TODO|TBD|PLACEHOLDER)\b|\{\{|<insert|\[insert/i), 'placeholder or unfinished marker found')
normalized_uri = decoded.gsub(/[\x00-\x20\x7f]/, '')
check.call(!decoded.match?(/<\s*\/?\s*[a-z][^>]*>/i) && !normalized_uri.match?(/javascript:|vbscript:|data:text\/html/i), 'active script or executable URI is forbidden')

schedule = section.call('15주 수업 일정')
week_rows = schedule.lines.grep(/^\|\s*\d+\s*\|/).map { |line| cells.call(line) }
week_ids = week_rows.map { |row| row[1].to_i }
check.call(week_ids == (1..15).to_a, 'weeks must be the exact ordered multiplicity set 1..15')
check.call(week_ids.include?(8) && week_ids.include?(15), 'missing week 8 or week 15 exam')
topic_slugs = %w[
  W01-orientation-diagnostic-provenance W02-cloud-ncp-networking W03-ncp-vm-approved-fallback
  W04-hermes-safe-install-operation W05-cti-source-manual-provenance W06-cti-normalize-idempotent-collector
  W07-hermes-scheduling-recovery-rehearsal W08-midterm-individual-practical W09-llm-wiki-architecture
  W10-cti-canonical-wiki-lint W11-ua-generation-structural-validation W12-graph-data-model-metrics
  W13-reproducible-analysis-source-verification W14-end-to-end-recovery-final-rehearsal-teardown W15-final-individual-practical
]
row_topics = week_rows.map { |row| row[2][/topic_id:\s*([A-Za-z0-9-]+)/, 1] }
check.call(row_topics == topic_slugs && topic_slugs.all? { |slug| text.scan(/topic_id:\s*#{Regexp.escape(slug)}\b/).length == 1 }, 'weekly topic IDs must be exact W01-W15 slugs once each')

outcomes = section.call('학습성과 및 평가 정렬')
assessment = section.call('평가 방법')
%w[LO1 LO2 LO3 LO4 LO5].each do |lo|
  check.call(outcomes.match?(/\*\*#{lo}:\*\*/), "missing observable outcome #{lo}")
  check.call(schedule.include?(lo) && assessment.include?(lo), "#{lo} missing from schedule or assessment")
end

assessment_header = '| 평가 범주 | 비중 | 학습성과 및 증거 |'
check.call(text.lines.count { |line| line.strip == assessment_header } == 1, 'assessment header must be exact and unique')
grade_table = assessment[/\A(.*?)(?=^### |\z)/m] || ''
grade_rows = grade_table.lines.grep(/^\|/).map do |line|
  name = line[/^\|\s*([^|]+?)\s*\|/, 1]
  weight = line[/\|\s*(\d+)%\s*\|/, 1]
  weight && [name, weight.to_i]
end.compact
check.call(grade_rows == [['출석', 20], ['중간고사', 40], ['기말고사', 40]], 'grading mismatch: rows must have exact unique identities and weights')
rubric = lambda do |heading|
  table = assessment[/^### #{Regexp.escape(heading)}\n(.*?)(?=^### |^## |\z)/m] || ''
  table.lines.grep(/^\|/).map { |line| line[/\|\s*(?:\*\*)?(\d+)(?:\*\*)?\s*\|\s*$/, 1] }.compact.map(&:to_i)
end
midterm = rubric.call('중간고사 개인 실기 rubric')
final = rubric.call('기말고사 개인 실기 rubric')
check.call(midterm == [10, 10, 12, 8, 40] && midterm.first(4).sum == midterm.last, 'midterm rubric mismatch: must be 10+10+12+8=40')
check.call(final == [10, 10, 10, 10, 40] && final.first(4).sum == final.last, 'final rubric mismatch: must be 10+10+10+10=40')

safety = section.call('안전·윤리·비용·개인정보·접근성 정책')
contract_heading = '### 자동 검증 계약'
check.call(text.lines.count { |line| line.strip == contract_heading } == 1, 'machine contract heading must be exact and unique')
contract_section = safety[/^### 자동 검증 계약\n(.*?)(?=^### |\z)/m] || ''
fence_pattern = /^ {0,3}(`{3,}|~{3,})(?:yaml|yml)\s*\n(.*?)^ {0,3}\1\s*$/mi
document_yaml_bodies = text.scan(fence_pattern).map { |match| match[1] }
check.call(document_yaml_bodies.length == 1, 'machine contract must have exactly one YAML/YML fence')
contract_body = contract_section[fence_pattern, 2]
check.call(contract_body && document_yaml_bodies == [contract_body], 'machine contract YAML must be located under the safety heading')
contract = nil
begin
  stream = Psych.parse_stream(contract_body) if contract_body
  ast_errors = []
  inspect_node = nil
  inspect_node = lambda do |node|
    ast_errors << 'YAML aliases or custom tags are forbidden' if node.is_a?(Psych::Nodes::Alias) || (node.respond_to?(:tag) && node.tag)
    if node.is_a?(Psych::Nodes::Mapping)
      keys = []
      node.children.each_slice(2) do |key, value|
        ast_errors << 'YAML mapping keys must be scalar strings' unless key.is_a?(Psych::Nodes::Scalar) && key.tag.nil?
        keys << key.value if key.is_a?(Psych::Nodes::Scalar)
        inspect_node.call(value)
      end
      ast_errors << 'YAML mapping contains duplicate keys' unless keys.uniq.length == keys.length
    elsif node.respond_to?(:children) && node.children
      node.children.each { |child| inspect_node.call(child) }
    end
  end
  if stream && stream.children.length == 1
    inspect_node.call(stream.children.first)
  else
    ast_errors << 'YAML must contain exactly one document'
  end
  errors.concat(ast_errors.uniq)
  contract = YAML.safe_load(contract_body, permitted_classes: [], permitted_symbols: [], aliases: false) if ast_errors.empty?
rescue Psych::Exception => error
  errors << 'machine contract YAML parse error'
end
check.call(contract.is_a?(Hash), 'machine contract must be a YAML mapping')

contract_spec = {
  'contract_version' => '1.0',
  'course' => { 'instructional_weeks' => [1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14], 'instructional_delivery' => { 'async_video_minutes' => 60, 'in_person_lab_minutes' => 120 }, 'exam_weeks' => [8, 15], 'exam_duration_minutes' => 180, 'exam_new_lecture' => false },
  'team' => { 'min_size' => 2, 'max_size' => 3, 'separately_weighted' => false },
  'platform' => { 'docker' => { 'hermes_gateway_persistence' => 'fixture-only' } },
  'cti' => { 'raw_manifest_fields' => %w[source request_url retrieved_at_utc sha256 etag last_modified http_status content_type], 'value_states' => ['absent', 'null', 'unknown'] },
  'ua' => { 'partial_stale' => { 'accept' => false, 'exit' => 'nonzero' } },
  'graph' => { 'inferred_relation' => { 'fact' => false } },
  'accessibility' => { 'captions' => true, 'transcripts' => true, 'alternative_material' => true },
  'offensive' => { 'malware_execution' => false, 'exploit_poc' => false, 'active_scanning' => false, 'automatic_response' => false },
  'untrusted_external' => { 'execution' => false },
  'credentials' => { 'prompt' => false, 'log' => false, 'history' => false },
  'hermes' => {
    'messaging_browser' => { 'requires_separate_approval' => true }, 'workspace_tool_allowlist' => true,
    'gateway_count' => 1, 'delivery' => 'local-only', 'gate_outputs' => %w[wakeAgent reason changedPaths],
    'install_mode' => 'headless', 'doctor_required' => true, 'timezone' => 'Asia/Seoul', 'cron_mode' => 'deny',
    'observation_states' => %w[changed no_change semantic_failure], 'preserve_last_good' => true
  },
  'nvd' => { 'pagination' => %w[resultsPerPage startIndex], 'min_interval_seconds' => 6, 'max_retries' => 3, 'failure_state' => 'deferred_rate_limited', 'preserve_last_good' => true },
  'milestones' => { 'roles' => %w[HAPPY FAIL ARTIFACT MACHINE FALLBACK SAFETY ASSESS] },
  'fallback' => { 'columns' => %w[live_evidence instructor_fixture manifest_hash preserved_competency lost_competency allowed_claim], 'tracks' => %w[NCP Hermes CTI_API LLM_enrichment UA_generation graph_analysis] }
}
assert_contract = nil
assert_contract = lambda do |actual, expected, name|
  if expected.is_a?(Hash)
    check.call(actual.is_a?(Hash), "contract #{name} must be a mapping")
    if actual.is_a?(Hash)
      check.call(actual.keys.sort == expected.keys.sort, "contract #{name} keys mismatch")
      expected.each { |key, value| assert_contract.call(actual[key], value, "#{name}.#{key}") }
    end
  else
    check.call(actual == expected, "contract #{name} value/type mismatch")
  end
end
assert_contract.call(contract, contract_spec, 'root') if contract.is_a?(Hash)
course = contract_spec['course']
check.call((week_ids - course['exam_weeks']) == course['instructional_weeks'] && week_ids & course['exam_weeks'] == course['exam_weeks'], 'course week identity contract mismatch')

roles = contract_spec['milestones']['roles']
milestones = section.call('실습 마일스톤 및 제출 증거')
milestone_header = '| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |'
check.call(text.lines.count { |line| line.strip == milestone_header } == 1, 'milestone header must be exact and unique')
milestone_rows = milestones.lines.grep(/^\| M[1-7] /).map { |line| cells.call(line) }
milestone_ids = milestone_rows.map { |row| row[1][/^M([1-7])\b/, 1] }
check.call(milestone_ids == %w[1 2 3 4 5 6 7], 'milestones must have exact unique M1-M7 identities')
milestone_rows.each do |row|
  number = row[1][/^M([1-7])\b/, 1]
  check.call(row.length == 10 && row[2..-2].all? { |cell| !cell.empty? }, "M#{number} milestone cells are incomplete")
  roles.each_with_index do |role, index|
    marker = "`M#{number}-#{role}`"
    cell = row[index + 2] || ''
    check.call(cell.scan(/`M[1-7]-(?:HAPPY|FAIL|ARTIFACT|MACHINE|FALLBACK|SAFETY|ASSESS)`/) == [marker] && text.scan(/#{Regexp.escape(marker)}/).length == 1, "M#{number}-#{role} stable ID placement/multiplicity mismatch")
  end
end

matrix = section.call('운영 환경 및 대체 실습 매트릭스')
fallback_header = '| 트랙 | live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |'
check.call(text.lines.count { |line| line.strip == fallback_header } == 1, 'fallback header must be exact and unique')
header_positions = [assessment_header, milestone_header, fallback_header].map { |header| text.index(header) }
check.call(header_positions.all? && header_positions == header_positions.sort, 'assessment, milestone, and fallback headers must be ordered')
tracks = contract_spec['fallback']['tracks']
track_labels = tracks.map { |track| track.tr('_', ' ') }
fallback_roles = %w[LIVE FIXTURE MANIFEST PRESERVED LOST CLAIM]
fallback_rows = matrix.lines.grep(/^\| (NCP|Hermes|CTI API|LLM enrichment|UA generation|graph analysis) \|/).map { |line| cells.call(line) }
check.call(fallback_rows.map { |row| row[1] } == track_labels, 'fallback tracks must be exact, unique, and ordered')
fallback_rows.each_with_index do |row, row_index|
  track = tracks[row_index]
  check.call(row.length == 9 && row[2..-2].all? { |cell| !cell.empty? }, "fallback #{row[1]} has incomplete contract columns")
  fallback_roles.each_with_index do |role, index|
    marker = "`F-#{track.upcase}-#{role}`"
    cell = row[index + 2] || ''
    check.call(cell.scan(/`F-(?:NCP|HERMES|CTI_API|LLM_ENRICHMENT|UA_GENERATION|GRAPH_ANALYSIS)-(?:LIVE|FIXTURE|MANIFEST|PRESERVED|LOST|CLAIM)`/) == [marker] && text.scan(/#{Regexp.escape(marker)}/).length == 1, "#{track}-#{role} fallback ID placement/multiplicity mismatch")
  end
end
schema_rows = text.lines.grep(/^\| `(vulnerability|signal|attack)` \|/)
schema_contracts = {
  'vulnerability' => %w[source native_id cve_id published_at last_modified_at description kev_date_added kev_due_date raw_sha256 source_version_or_raw_sha256 retrieved_at_utc value_state state_reason],
  'signal' => %w[source native_id cve_id signal_type score percentile signal_date raw_sha256 source_version_or_raw_sha256 retrieved_at_utc value_state state_reason],
  'attack' => %w[source native_id stix_id object_type name stix_version modified revoked deprecated fixture_release fixture_sha256 as_of value_state state_reason]
}
schema_contracts.each do |record, fields|
  row = schema_rows.find { |line| line.start_with?("| `#{record}` |") } || ''
  check.call(fields.all? { |field| row.include?("`#{field}`") }, "#{record} normalized schema carry-through missing")
end

ledger = section.call('최신성·출처 기준')
ledger_terms = ['as_of: 2026-07-29', '0f64557c06f3e878fd9ec5170b9bca7f20e2778e', 'catalogVersion', 'API `2.0`', 'v19.1', 'official_latest']
check.call(ledger_terms.all? { |term| ledger.include?(term) }, 'source ledger field missing')

if errors.empty?
  puts 'PASS headings=10 weeks=15 topic_ids=15 milestones=7 evidence_ids=49 fallbacks=6 weights=20/40/40 rubrics=40/40 machine_contract=PASS prose_semantics=REVIEWED_EXTERNALLY'
  exit 0
end
errors.uniq.each { |error| warn "FAIL: #{error}" }
exit 1
