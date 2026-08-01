#!/usr/bin/env ruby

require 'open3'
require 'tmpdir'

root = File.expand_path('../../..', __dir__)
target = File.join(root, 'output/hoseo-data-analysis-cloud-platform-15-week-syllabus.md')
checker = File.join(__dir__, 'syllabus_check.rb')
source = File.binread(target).force_encoding(Encoding::UTF_8)

def replace_line(text, prefix)
  text.sub(/^#{Regexp.escape(prefix)}.*$/) { |line| yield line }
end

def require_mutation(name, source, body)
  raise "#{name} is a no-op" if body == source
  body
end

def run_case(name, expected, body, checker, directory)
  path = File.join(directory, "#{name}.md")
  File.binwrite(path, body)
  stdout, stderr, status = Open3.capture3('ruby', checker, path)
  accepted = status.exitstatus == 0 && stdout.match?(/\APASS [^\n]+\n\z/) && stderr.empty?
  rejected = status.exitstatus != 0 && stdout.empty? && !stderr.empty? && stderr.lines.all? { |line| line.start_with?('FAIL: ') } && !stderr.match?(/(?:Traceback|Error:|from )/)
  passed = expected == :accept ? accepted : rejected
  puts "#{name} expected=#{expected} exit=#{status.exitstatus} stdout=#{stdout.bytesize} stderr=#{stderr.bytesize} #{passed ? 'PASS' : 'FAIL'}"
  passed
end

mutants = {}
add_reject = lambda do |name, body|
  raise "duplicate case name: #{name}" if mutants.key?(name)
  mutants[name] = require_mutation(name, source, body)
end

add_reject.call('active-raw-script', source.sub('## 교과목 개요', "<script>alert(1)</script>\n## 교과목 개요"))
add_reject.call('active-entity-javascript', source.sub('## 교과목 개요', "<a href=\"java&#x73;cript:alert(1)\">x</a>\n## 교과목 개요"))
add_reject.call('active-entity-data-html', source.sub('## 교과목 개요', "<a href=\"data:text&#x2f;html,&lt;script&gt;1&lt;/script&gt;\">x</a>\n## 교과목 개요"))
add_reject.call('active-iframe-srcdoc', source.sub('## 교과목 개요', "<iframe srcdoc=\"&lt;script&gt;alert(1)&lt;/script&gt;\"></iframe>\n## 교과목 개요"))
active_entity = '&lt;a href="java&#x73;cript:alert(1)"&gt;x&lt;/a&gt;'
encode_entity = lambda do |depth|
  value = active_entity
  depth.times { value = value.gsub('&', '&amp;') }
  value
end
add_reject.call('active-entity-five-layer', source.sub('## 교과목 개요', "#{encode_entity.call(5)}\n## 교과목 개요"))
add_reject.call('active-entity-deep-layer', source.sub('## 교과목 개요', "#{encode_entity.call(65)}\n## 교과목 개요"))
add_reject.call('active-numeric-tab-javascript', source.sub('## 교과목 개요', "<a href=\"java&#9;script:1\">x</a>\n## 교과목 개요"))
add_reject.call('active-numeric-lf-javascript', source.sub('## 교과목 개요', "<a href=\"java&#10;script:1\">x</a>\n## 교과목 개요"))
add_reject.call('active-numeric-cr-javascript', source.sub('## 교과목 개요', "<a href=\"java&#13;script:1\">x</a>\n## 교과목 개요"))
add_reject.call('active-html5-tab-javascript', source.sub('## 교과목 개요', "<a href=\"java&Tab;script:1\">x</a>\n## 교과목 개요"))
add_reject.call('active-html5-newline-data', source.sub('## 교과목 개요', "<a href=\"data&NewLine;:text/html,x\">x</a>\n## 교과목 개요"))
add_reject.call('active-inword-control-data', source.sub('## 교과목 개요', "<a href=\"da&#x09;ta:text/html,x\">x</a>\n## 교과목 개요"))
add_reject.call('encoded-raw-oversize', source + ('&amp;' * 200_001) + "\n")
add_reject.call('contract-duplicate-heading', source.sub('### 자동 검증 계약', "### 자동 검증 계약\n\n### 자동 검증 계약"))
add_reject.call('contract-duplicate-yaml-fence', source.sub('```yaml', "```yaml\n# duplicate fence is malformed\n```yaml"))
add_reject.call('contract-heading-outside-safety', source + "\n### 자동 검증 계약\n\n외부 중복\n")
add_reject.call('contract-yml-outside-safety', source + "\n```yml\nextra: true\n```\n")
add_reject.call('contract-uppercase-yaml-outside-safety', source + "\n```YAML\nextra: true\n```\n")
add_reject.call('contract-tilde-yaml-outside-safety', source + "\n~~~yml\nextra: true\n~~~\n")
add_reject.call('contract-indented-yaml-outside-safety', source + "\n   ```yml\nextra: true\n   ```\n")
add_reject.call('contract-second-document', source.sub("contract_version: \"1.0\"", "contract_version: \"1.0\"\n---\ncontract_version: \"1.0\""))
add_reject.call('contract-duplicate-root-key', source.sub("contract_version: \"1.0\"", "contract_version: \"1.0\"\ncontract_version: \"1.0\""))
add_reject.call('contract-duplicate-nested-key', source.sub('    accept: false', "    accept: false\n    accept: false"))
add_reject.call('contract-numeric-key', source.sub("contract_version: \"1.0\"", "contract_version: \"1.0\"\n1: rogue"))
add_reject.call('contract-collection-key', source.sub("contract_version: \"1.0\"", "contract_version: \"1.0\"\n? [bad]\n: rogue"))
add_reject.call('contract-hermes-install-mode', source.sub('  install_mode: headless', '  install_mode: gui'))
add_reject.call('contract-hermes-doctor', source.sub('  doctor_required: true', '  doctor_required: false'))
add_reject.call('contract-hermes-timezone', source.sub('  timezone: Asia/Seoul', '  timezone: UTC'))
add_reject.call('contract-hermes-cron', source.sub('  cron_mode: deny', '  cron_mode: allow'))
add_reject.call('contract-hermes-observations', source.sub('  observation_states: [changed, no_change, semantic_failure]', '  observation_states: [changed, no_change]'))
add_reject.call('contract-hermes-last-good', source.sub("  preserve_last_good: true\nnvd:\n", "  preserve_last_good: false\nnvd:\n"))
add_reject.call('assessment-header-duplicate', source.sub('| 평가 범주 | 비중 | 학습성과 및 증거 |', "| 평가 범주 | 비중 | 학습성과 및 증거 |\n| 평가 범주 | 비중 | 학습성과 및 증거 |"))
add_reject.call('milestone-header-duplicate', source.sub('| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |', "| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |\n| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |"))
add_reject.call('fallback-header-duplicate', source.sub('| 트랙 | live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |', "| 트랙 | live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |\n| 트랙 | live evidence | instructor fixture | manifest/hash | preserved competency | lost competency | allowed claim |"))
assessment_header = '| 평가 범주 | 비중 | 학습성과 및 증거 |'
milestone_header = '| 마일스톤 | Happy | Fail | Artifact | Machine | Fallback | Safety | Assess |'
order_marker = '| HEADER-ORDER-SWAP |'
header_order_swap = source.sub(assessment_header, order_marker).sub(milestone_header, assessment_header).sub(order_marker, milestone_header)
add_reject.call('table-header-order-swap', header_order_swap)
add_reject.call('fallback-ncp-lost-claim-swap', source.sub('`F-NCP-LOST` 실제 provisioning·public 연결·alert·release | `F-NCP-CLAIM` fixture 기반 NCP 설계·검증만 주장', '`F-NCP-CLAIM` fixture 기반 NCP 설계·검증만 주장 | `F-NCP-LOST` 실제 provisioning·public 연결·alert·release'))
add_reject.call('fallback-ncp-live-id-swap', source.sub('`F-NCP-LIVE`', '`F-NCP-FIXTURE`'))
add_reject.call('duplicate-week', replace_line(source, '| 2 |') { |line| line.sub('| 2 |', '| 1 |') })
add_reject.call('extra-weight', source.sub('| 기말고사 | 40% |', "| 기말고사 | 40% |\n| 과제 | 10% | 별도 가중치 |"))
add_reject.call('milestone-role-id-swap', replace_line(source, '| M1 ') { |line| line.sub('`M1-HAPPY`', '`M1-FAIL`') })
add_reject.call('schema-vulnerability-description', replace_line(source, '| `vulnerability` |') { |line| line.sub('`description`, ', '') })
add_reject.call('raw-manifest-request-url', source.sub('`request_url`, ', ''))

positives = {}
add_accept = lambda do |name, body|
  raise "duplicate case name: #{name}" if mutants.key?(name) || positives.key?(name)
  positives[name] = require_mutation(name, source, body)
end

add_accept.call('safe-week4-korean-headless', replace_line(source, '| 4 |') { |line| line.sub('non-root headless 설치 또는 health fixture 판독', 'GUI 없이 비특권 계정으로 설치하거나 health fixture를 판독') })
add_accept.call('safe-week7-translated-states', replace_line(source, '| 7 |') { |line| line.sub('changed/no-change/semantic-failure', '변경됨/변경 없음/의미 검증 실패') })
add_accept.call('safe-ua-korean-paraphrase', source.sub('partial/stale/duplicate/dangling 거절, validator nonzero', '부분·오래된·중복·dangling 결과는 검증 실패로 처리하고 검증기는 실패 상태를 반환'))
add_accept.call('safe-graph-korean-relation', source.sub('모델 또는 그래프가 제안한 relation은 원문 검증 전 가설이다.', '모델 또는 그래프가 제안한 관계는 원문 검증 전에는 검토 후보일 뿐이다.'))
add_accept.call('safe-m1-korean-rephrase', replace_line(source, '| M1 ') { |line| line.sub(/`M1-HAPPY`[^|]*/, '`M1-HAPPY` fixture ID와 hash로 다섯 진단 결과를 확인') })
add_accept.call('safe-accessibility-korean-rephrase', source.sub('자막과 대본을 **제공한다**', '자막과 대본을 학습자에게 함께 전달한다'))
add_accept.call('safe-nvd-korean-rephrase', source.sub('성공으로 표시하지 않는다.', '완료로 간주하지 않고 격리 기록으로 남긴다.'))
add_accept.call('safe-offensive-korean-rephrase', source.sub('**명시적으로 금지**하며', '교육 활동에서 하지 않으며'))
add_accept.call('safe-benign-entity-text', source.sub('## 교과목 개요', "&#169; course note\n## 교과목 개요"))
add_accept.call('safe-course-prose-rewrite', replace_line(source, '| 1 |') { |line| line.sub('60분 비동기 동영상 + 120분 대면 실습', '사전 영상과 대면 실습으로 운영') })
add_accept.call('safe-team-prose-rewrite', source.sub('2~3인 팀 활동', '소규모 협력 활동'))
add_accept.call('safe-docker-prose-rewrite', source.sub('Hermes gateway persistence는 `fixture-only`', 'Hermes 지속성은 fixture로만 다룬다'))
add_accept.call('safe-manifest-prose-rewrite', source.sub('CTI raw manifest 필드는', 'CTI 원본 manifest의 기계 필드는'))
add_accept.call('safe-value-state-prose-rewrite', source.sub('absent/null/unknown', '값 상태 세 범주'))

all_bodies = mutants.merge(positives)
raise 'duplicate mutation bodies' unless all_bodies.values.uniq.length == all_bodies.length

passed = true
Dir.mktmpdir('t8-regression') do |directory|
  passed = run_case('valid', :accept, source, checker, directory) && passed
  mutants.each { |name, body| passed = run_case(name, :reject, body, checker, directory) && passed }
  positives.each { |name, body| passed = run_case(name, :accept, body, checker, directory) && passed }
end
puts "COUNTS total=#{1 + all_bodies.length} expected_accept=#{1 + positives.length} expected_reject=#{mutants.length} distinct=#{1 + all_bodies.values.uniq.length}"
exit(passed ? 0 : 1)
