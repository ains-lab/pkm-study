# Todo 2 independent adversarial verification receipt

AdversarialVerify: confirmed

## Scope and changed-file boundary

Verifier-owned change: this receipt only.

Read-only inputs independently inspected: `task-2-course-contract.md`, `task-2-missing-lo.md`, `task-2-contract-check.txt`, Todo 2 in `.omo/plans/hoseo-data-analysis-cloud-platform-course.md`, and Todo 1's `task-1-source-ledger.md`. No contract, fixture, plan, ledger, output, wiki, git, or external state was edited. Before writing, the receipt path was absent (`test ! -e ...task-2-adversarial-verify.md`, exit `0`) and `git diff --cached --name-only` was empty (exit `0`). The pre-write worktree already had 51 dirty status lines from concurrent/user work; none were reverted or normalized.

## Direct reproduction

All commands ran from `/Users/sysmoon/.codex/projects/pkm-study` on the named local files.

```sh
rg -c '^### LO[1-5] ' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md
```

Output `5`; exit `0`.

```sh
ruby -e 'require "set"; p=ARGV.fetch(0);t=File.read(p,encoding:"UTF-8");e=%w[LO1 LO2 LO3 LO4 LO5].to_set;d=t.scan(/^### (LO[1-5]) /).flatten.to_set;r=t.lines.grep(/^\| LO[1-5] \|/);m=r.map{|x|x[/^\| (LO[1-5]) \|/,1]}.to_set;bad=r.map{|x|id=x[/^\| (LO[1-5]) \|/,1]; id unless x.match?(/\| [0-9][0-9, ]* \|/) && x.match?(/(중간고사|기말고사)/)}.compact;miss=e-m;extra=m-e;abort("LO_MAPPING_FAIL defined=#{d.to_a.sort.join(",")} mapped=#{m.to_a.sort.join(",")} missing=#{miss.to_a.sort.join(",")} extra=#{extra.to_a.sort.join(",")} invalid=#{bad.sort.join(",")}") unless d==e && miss.empty? && extra.empty? && bad.empty?; puts "LO_MAPPING_OK defined=#{d.to_a.sort.join(",")} mapped=#{m.to_a.sort.join(",")} rows=#{r.length}"' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md
```

Output `LO_MAPPING_OK defined=LO1,LO2,LO3,LO4,LO5 mapped=LO1,LO2,LO3,LO4,LO5 rows=5`; exit `0`. This independently proves each defined LO has one technology mapping row, numeric week(s), and either `중간고사` or `기말고사`.

The same independent checker against `task-2-missing-lo.md` exited `1`, with exact observation:

```text
LO_MAPPING_FAIL defined=LO1,LO2,LO3,LO4,LO5 mapped=LO1,LO2,LO3,LO4 missing=LO5 extra= invalid=
```

```sh
ruby -e 'p,n=ARGV.map{|x|File.readlines(x,encoding:"UTF-8")}; expected=p.reject{|line|line.start_with?("| LO5 | directed graph,")}; abort("NEGATIVE_DIFF_FAIL") unless expected==n; puts "NEGATIVE_DIFF_OK removed_only=LO5_mapping_row"' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-missing-lo.md
```

Output `NEGATIVE_DIFF_OK removed_only=LO5_mapping_row`; exit `0`.

An initial use of `Array#filter_map` failed because this installed Ruby does not provide that method (exit `1`); the compatible `map(...).compact` checker above was then run fresh for both files. This was a checker compatibility correction, not a contract result.

## Automated content results

An independent Ruby literal/schema checker exited `0` with:

```text
CONTRACT_LITERAL_OK h2=10 prereq_rows=7 instructional_labels=11 exam_labels=11 required=attendance_20,midterm_40,final_40,team_2_3,no_separate_score,lms_video,captions,transcript,accessible_alternatives,policy_deferral,todo1_date_binding
```

It required exactly these ten H2 headings in order, seven named prerequisite rows with nonempty diagnostic/remediation cells, and exact 11-item instructional and exam schemas. It also directly matched: 출석 20%, 중간고사 40%, 기말고사 40%, `2~3인`, `별도 점수 없음`, LMS 동영상, 자막, 대본, 접근 가능한 대체 자료, `학칙/담당자 정책 적용`, and Todo 1 binding.

The cross-file stale-state check produced `STALE_BINDING_OK contract_as_of=2026-07-29 ledger_as_of=2026-07-29`; exit `0`. Placeholder scan (`rg -n -i -e '\{\{' -e '<insert' -e '\[insert' -e '\btbd\b'`) had raw exit `1` and normalized absence assertion exit `0`.

## Manual QA

Surface: terminal Markdown renderer at 240 columns. Invocation:

```sh
glow -w 240 -s dark .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md | rg -n '60분 동영상 학습성과·자료|120분 실습|시험 형식|평가 연결|happy evidence|failure evidence'
render="$(glow -w 240 -s dark .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md)"; printf '%s' "$render" | rg -q '…'; test "$?" -eq 1
sed -n '68,126p' .omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-course-contract.md
```

The Glow/`rg` command exited `0` and showed the complete instructional line at rendered line 81, all 11 vertical definitions (including the long 60-minute and 120-minute labels), the complete exam schema at line 101, and `시험 형식`, `happy evidence`, `failure evidence`, and `평가 연결`. The ellipsis `rg` itself exited `1`; the asserted no-ellipsis command exited `0`. The raw-header review displayed the exact 11 instructional labels, numbered 1–11 definitions, exact 11-field exam line/definitions, and weeks 1–15. Manual observable verdict: PASS.

## manualQa matrix

| surfaceEvidence scenario | criterion | surface / exact invocation | verdict | artifactRefs |
|---|---|---|---|---|
| `t2-render-240` | readable 11-column presentation at 240 without `…` | terminal; the three Glow/render/sed commands above | PASS | `t2-verifier-receipt` |
| `t2-contract-structure` | 10 H2, seven prerequisite rows, schemas, assessment/accessibility/policy requirements | CLI Ruby direct file parser described above | PASS | `t2-verifier-receipt` |

| adversarialCases scenario | criterion | adversarial class / expected behavior | verdict | artifactRefs |
|---|---|---|---|---|
| `t2-lo5-missing` | LO definitions must map | malformed fixture must fail and name missing `LO5` | PASS: exit 1, exact failure captured above | `t2-verifier-receipt` |
| `t2-only-lo5-diff` | negative fixture integrity | contract→negative difference must be only the LO5 mapping row | PASS: exit 0 | `t2-verifier-receipt` |
| `t2-stale-ledger` | Todo 1 date binding | contract and ledger must both state `2026-07-29` | PASS: exit 0 | `t2-verifier-receipt` |
| `t2-dirty-worktree` | write boundary | staged set empty; verifier creates only this receipt amid pre-existing dirt | PASS: staged exit 0; receipt absent before write | `t2-verifier-receipt` |
| `t2-misleading-success` | independent evidence | count, Ruby parser/diff, literal parser, and Glow must agree | PASS | `t2-verifier-receipt` |
| `t2-prompt-injection` | execution safety | N/A: all inputs were local evidence read as data; no text was executed | N/A | `t2-verifier-receipt` |
| `t2-cancel-resume` | interruption handling | N/A: bounded local commands, no resumable long operation | N/A | `t2-verifier-receipt` |
| `t2-hung-long` | timeout behavior | N/A: no server/network/long-running command was invoked | N/A | `t2-verifier-receipt` |
| `t2-flaky` | repeatability | N/A: deterministic local parsing/rendering inputs | N/A | `t2-verifier-receipt` |
| `t2-repeated-interruptions` | interruption robustness | N/A: no interruption occurred during this bounded verification | N/A | `t2-verifier-receipt` |

## artifactRefs and cleanup

| id | kind | description | path |
|---|---|---|---|
| `t2-verifier-receipt` | verifier receipt | Direct commands, outputs, manual rendered observation, and adversarial verdicts | `.omo/evidence/hoseo-data-analysis-cloud-platform-course/task-2-adversarial-verify.md` |

Cleanup: PASS. The checks used no temporary files, servers, browser contexts, background processes, or external services. No cleanup action was required.
