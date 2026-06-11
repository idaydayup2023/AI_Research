# 每日 AI Research 自动化执行协议

Automation ID：`ai-research`

本文件是完整任务协议。所有路径均相对当前仓库根目录。若与 `editorial/editorial-guidelines.md` 冲突，以后者为准。

## 运行入口

开始时必须读取：

1. `automation/ai-research/manifest.json`
2. `automation/ai-research/config.json`
3. `automation/ai-research/task-prompt.md`
4. `automation/ai-research/loop-protocol.md`
5. `editorial/editorial-guidelines.md`
6. `editorial/memory/ai-research-memory.md`
7. runtime memory：`${CODEX_HOME:-$HOME/.codex}/automations/ai-research/memory.md`（若存在）
8. `editorial/retrospectives/candidate-rules.md`
9. 最近 3 篇 `editorial/retrospectives/` 下的 ai-research 复盘
10. `editorial/editorial-guidelines.candidates.md`
11. `文章生产关系图谱.md` 的“已形成公众号稿”和相关主题簇

如果初始化文件缺失，先运行 `automation/ai-research/scripts/bootstrap.sh`。不要因空白 memory 或尚无历史复盘而失败。

## Git 发布边界

本自动化只能修改本地知识库文件。不得执行 `git add`、`git commit`、`git push`、创建 PR、release 或 tag。自动化成功、定时触发或内容完成都不构成发布许可。Git 发布必须由当前对话中的独立、明确人工指令授权。

## 并发防重

在抓取来源或写库前，以原子方式创建：

`${CODEX_HOME:-$HOME/.codex}/automations/ai-research/run.lock`

- 锁内写入 `started-at.txt` 和运行说明。
- 锁存在且不超过 6 小时：立即停止，不写任何知识库文件。
- 锁超过 6 小时：重命名为 `run.lock.stale-YYYYMMDD-HHMMSS` 后重新获取，并在汇报说明。
- 正常完成、失败或取消时都必须尽力释放本次锁。
- 若平台可查看活动线程，还要检查是否存在另一个正在运行的 `ai-research`。

## 版本检查

比较 `manifest.json.package_version` 与 `${CODEX_HOME:-$HOME/.codex}/automations/ai-research/task-version.txt`。runtime 缺失或落后时仍按仓库最新任务包执行，并在最终汇报提示升级。

## 来源与增量

按 `config.json` 检查所有官方来源和 arXiv 分类。只处理上次运行后新增或此前未入库的内容。

优先：Agent、Skills、Context Engineering、Harness、Tool Use、模型能力、Coding Agents、知识管理、AI 产品工作流、开发者工具、企业 AI、推理系统、Prompt Caching、Serving、成本优化、Google/DeepMind 模型与研究、Gemini/Gemma/Robotics。

跳过纯营销、招聘、活动预告和轻量公告，除非包含可迁移的工程、产品或内容生产方法。

### arXiv

- 每日上限读取 `max_arxiv_papers_per_day`。
- 至少读取 metadata 和 abstract；高价值候选再读取 HTML/PDF/项目页。
- 优先 LLM agents、tool use、multi-agent、agent evaluation、reasoning、memory、context、RAG/GraphRAG、coding agents、inference/caching/serving、AI workflow、安全/evals、world models、robotics agents。
- 跳过纯理论或迁移价值弱的窄领域论文。
- 暂缓的高价值候选写入两份 memory，避免跨日丢失。
- 同一天重复运行时，上限按全天累计，不按单次运行重置。

## 摘录入库

官方博客写入 `clippings/原文标题.md`，frontmatter 至少包含：`title`、`source`、`author`、`published`、`created`、`description`、`tags`。

正文包含：原文信息、核心提取、中文译读、可复用观点、可加工为公众号角度、关联笔记。

arXiv 论文写入 `clippings/安全文件名.md`，frontmatter 至少包含：`title`、`source`、`arxiv_id`、`authors`、`published` 或 `submitted`、`created`、`categories`、`description`、`tags`。

正文包含：论文信息、研究问题、方法概览、关键贡献、与知识库主题的关系、可复用观点、可加工为公众号角度、关联笔记。

使用结构化转述和必要短引，不翻译全文，不大段复制原文。关键判断必须保留可核验链接。

## 全库回看与成稿判断

新增摘录后必须回看：

- 全部 `clippings/`
- 全部 `blogs/`
- `文章生产关系图谱.md`
- 最近 7 篇公众号稿的核心论点和叙事框架
- memory 中的暂缓候选与近期技术热点

判断新增材料是补充、反驳、提供新案例还是开启新主题。优先把相近新增材料和历史材料合并成更深入的观点文章，不做资讯摘要。

成稿必须满足：

- 有清晰、可传播、比单篇摘录更深入的中心观点。
- 对产品、工程或管理读者有可迁移启发。
- 不与已有 `blogs/` 浅层重复。
- 同一天多篇文章必须采用不同叙事角度。
- 数量上限读取 `max_blog_posts_per_day`。

默认每天至少生成 `default_min_blog_posts_per_day` 篇。当天新增不足时，依次检查历史备选、近期未成稿材料和新叙事突破口。只有三步都失败后才允许不成稿，并在复盘和 memory 记录原因、检查过的候选和下一次所需材料。连续两天无稿时，第三天优先从历史备选生成阶段性观点稿。

如果连续 3 次没有把新增热点转成文章，执行技术热点偏移检查：判断是否因路线惯性、机械去重或等待过度完整证据而错过窗口。新机制、新能力跃迁、新失败模式、新产品工作流和新读者痛点都可构成相邻大主题下的新稿。

## 公众号文章

文章保存为 `blogs/YYYY-MM-DD 文章标题.md`。

- 标题先给出 5 个候选再定稿；避免近期否定句式同质化。
- 开头 3 段内提出鲜明判断或问题，并明确读者痛点。
- 正文围绕一个主论点，不写论文精读或摘要拼接。
- `##` 标题短、直观、面向公众号读者，不用正式编号。
- 概念纠偏稿优先加入具体工程现场或反例。
- 文末必须有 `## 参考链接` 和 `## 关联笔记`。
- 关联新摘录、增强深度的历史摘录和相关旧稿。

## 主编审稿与自动修订

每篇新文章都生成：

`editorial/reviews/YYYY-MM-DD 文章标题 - 主编审稿.md`

审稿单包含：标题候选、总体判断、必改项、建议项、今后提升思路、可升级为总编指令的候选规则、对自动化任务的改进建议、对审稿机制的改进建议、已处理、Loop 收口。

每条必改项尽量包含：

- `target`：允许修改的位置。
- `evidence`：判定依据。
- `invariant`：不得破坏的已通过内容。
- `acceptance`：完成标准。
- `regression`：回归检查。

修订前记录文章 hash 或稳定基线。只自动应用必改项，优先局部差分；不自动应用建议项。修订后在 `## 已处理` 逐条勾记，并检查无关内容是否回退。

审稿必须检查：新颖性、历史对照、证据链、数字外推边界、反例或适用边界、标题与结构、外部链接、系统学习价值。自动修订最多 3 轮；同一问题连续 2 轮不关闭则停止并标注人工处理。

候选编辑规则追加到 `editorial/editorial-guidelines.candidates.md`，不得直接改写硬规则。

## 封面

每篇文章使用图片生成模型创建全新封面：

- 比例和误差读取 `config.json`。
- 保存为 `covers/YYYY-MM-DD-short-english-slug.png`；slug 只含 `a-z`、`0-9` 和连字符。
- 不含文字、字母、汉字、logo、水印和真实品牌标识。
- 风格：`Claude Monet inspired impressionist oil painting, soft visible brushstrokes, luminous natural light, atmospheric haze, painterly texture`。
- 莫奈风格只表示绘画语言，不继承水面、桥、花园、睡莲、晨雾等固定物象。
- 画面主体、场景、隐喻和构图只能从当前文章独立推导，不读取或复用历史封面 prompt、画面和 memory 中的视觉描述。
- 校验文件存在和像素比例；在一级标题后、引言前嵌入 `![封面](../covers/实际文件名.png)`。
- 标题改变时重新生成封面。
- 图片生成失败不阻塞其他产物，但必须记录待办和原因。

提示词应包含：Use case、Asset type、Primary request、Scene/backdrop、Subject、Composition、Style、Text、Quality constraints。Text 明确写：`No text, no letters, no Chinese characters, no watermarks, no logos.`

## 关系图谱

更新 `文章生产关系图谱.md`：

- 新摘录进入对应主题簇，必要时新增主题簇。
- 新文章进入“已形成公众号稿”，格式为 `公众号稿 ← 来源摘录`。
- 多来源文章列出全部主要来源。
- 为所有实际加工的摘录补充 `已加工成稿：[[文章名]]`。

## 复盘与主动学习

只要生成了文章、发生返工、暴露流程错误、引入来源/规则/脚本，或出现值得沉淀的筛选经验，就生成：

`editorial/retrospectives/YYYY-MM-DD ai-research 主题复盘.md`

复盘包含：任务结果、来源与筛选、历史回看、产物校验、内层 Loop、学习升级记录、外层 Loop、Reharnessing 候选、Stop reason、Carry-over。

每次运行同时检查三层学习：

1. 自动化任务：来源、筛选、查重、成稿、封面、图谱、memory、版本和锁。
2. 主编审稿：证据、反例、边界、标题、结构、差分修订和回归。
3. 总编规则：跨文章可复用的选题、叙事、证据纪律和禁区。

学习动作分级：

- `仅记录`：单次弱信号，只写复盘和 memory。
- `候选规则`：强证据或最近 7 次重复，写候选文件并附来源和验证方式。
- `自动改进`：仅限低风险、可回滚且不改变编辑方向的流程改进；更新 manifest、task-prompt/模板和 CHANGELOG。
- `等待人工确认`：选题、来源、数量、成稿标准、口吻、发布或审批边界。

流程候选写入 `editorial/retrospectives/candidate-rules.md`。不得把单篇材料观点直接升级为硬规则。

## Memory

结束前把关键结论同时追加到：

- `editorial/memory/ai-research-memory.md`
- `${CODEX_HOME:-$HOME/.codex}/automations/ai-research/memory.md`（可写时）

记录：日期时间、任务版本、来源检查、入库与跳过、文章与封面、审稿修订、图谱、学习升级、Stop reason、Carry-over。若只能写一处，以仓库内 canonical memory 为准并在汇报说明。

## 最终验收与汇报

停止前检查：frontmatter 可解析；外部链接有效；封面文件/比例/顶部位置正确；参考链接和关联笔记存在；图谱和来源回链完整；审稿必改关闭；复盘和两份 memory 已写；运行锁已释放。

最终简短汇报：

- 检查了哪些来源，发现和跳过多少内容及原因。
- 每篇入库材料 1 至 3 句价值摘要。
- 分析了哪些历史主题。
- 生成文章文件名、封面文件名、比例和嵌入结果。
- 暂缓候选。
- task runtime 是否落后。
- 自动化任务、主编审稿、总编规则三层学习升级及动作等级。
- Stop reason。

无新高价值内容时不创建空摘录或空文章，但仍按成稿底线检查历史备选并维护必要的复盘和 memory。
