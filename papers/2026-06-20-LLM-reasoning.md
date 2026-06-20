# 📚 每日论文速递 - 2026-06-20

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. Granularity-Regulated Adaptive Computational Efficiency for Optimal Verification in Test-Time Scaling

**基本信息**
- 作者: Ardit Krasniqi, Luan Vejsiu, Elira Dervishi
- 发布: 2026-06-19
- 会议/期刊: arXiv (preprint, cs.CL / cs.LG)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.19354](https://arxiv.org/abs/2606.19354)

**主要贡献**
提出 GRACE 框架，首次从理论上回答了 test-time scaling 中"应当以多细的粒度去做验证"这一开放问题。证明存在**相变现象**：当计算预算大或题目难度高时，细粒度（step-level）验证占优；否则粗粒度（response-level）的 Best-of-N 即可达到帕累托最优。

**方法**
将 Best-of-N、Beam Search、Step-level MCTS 三类主流推理时搜索方法统一到一个帕累托最优框架内，并通过一个动态调度器在推理过程中自适应地切换验证粒度，使每一道题都落到自己的最优工作点上。

**实验**
在 MATH-500、GSM8K 与 AIME 三个数学推理基准上系统对比固定粒度方案。在相同 FLOPs 预算下，自适应策略最多带来 **+3.1% 准确率**提升；同时给出了"难度 × 预算"二维空间中相变边界的实证刻画。

**结论**
"该用多细的链/树/步去搜索"不应是一个固定超参，而应作为一个可学习、可调度的资源分配问题。GRACE 为未来 reasoning model 的推理时算力分配提供了理论与工程上的统一抓手。

---

## 2. Where Does Social Reasoning Come From? Capability Provenance in Language Models

**基本信息**
- 作者: Glenn Matlin, Chandreyi Chakraborty, Saehee Eom, Mika Okamoto, Rayan Castilla, Louis Jaburi, Alvin Deng, Taywon Min, Lucia Quirke, Stella Biderman, Mark Riedl
- 发布: 2026-06-17
- 会议/期刊: COLM 2026 (under review)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.19625](https://arxiv.org/abs/2606.19625)

**主要贡献**
首次系统地从**训练数据归因 (Training Data Attribution)** 角度回答"模型的社会推理能力到底来自预训练语料的哪一部分"，并与 STEM 推理做严格对照。揭示了社会推理与 STEM 推理依赖于**质上不同**的语料区域，且这种差异在 reasoning 层级比知识层级更显著。

**方法**
- 在 OLMo3-7B 上对 Dolma3 语料按 576 个细粒度类别分桶
- 用基于梯度的归因方法 (gradient-based TDA) 估计每个语料桶对单道题的因果贡献
- 在 SocialIQA / MMLU Social Sciences vs. ARC-Challenge / MMLU STEM 四个基准上做对照实验
- 通过**机器遗忘 (machine unlearning)** 实验验证归因结果：删除归因到的语料桶后社会推理性能显著下降

**实验**
社会推理与 STEM 推理的高贡献语料区域几乎不重叠；进一步发现：当评测从知识题转向推理题时，社会与 STEM 的"语料指纹"分离度显著扩大；遗忘归因桶能选择性削弱目标能力，而几乎不损伤另一类。

**结论**
"推理能力是单一的、可通用的"这一默认假设需要被重新审视——至少 social 与 STEM 推理在预训练阶段是被**不同的语料子集**塑造的。这对数据配比、安全卸载、能力可控注入都有直接含义。论文同时开源代码、数据清单和 checkpoint。

---

## 3. Continual Self-Improvement with Lightweight Experiential Latent Memories

**基本信息**
- 作者: Vaggelis Dorovatas, Nancy Kalaj, Rahaf Aljundi
- 发布: 2026-06-16
- 会议/期刊: arXiv (preprint, cs.LG)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.17803](https://arxiv.org/abs/2606.17803)

**主要贡献**
指出当前 reasoning LLM 在 test-time 生成了大量高质量的推理 trace，却在回答完一道题后**全部丢弃**——本质上是"无状态"的。提出将 inference-time compute 蒸馏成一组极轻量的**经验性潜在记忆 (experiential latent memories)**，实现无需外部监督的持续自我改进。

**方法**
- 摒弃"直接检索原始 reasoning trace"这一直观做法（实验证明无法泛化）
- 借鉴无监督强化学习思想，用**自一致性 / majority voting** 作为自生成奖励信号
- 将每一类经验蒸馏为一个 soft prompt 形式的潜在记忆 (~0.001% 模型参数)
- 采用模块化设计，每条记忆独立管理，避免灾难性遗忘

**实验**
在多个数学推理基准上：相比 zero-shot 大幅提升、相比直接回放原始 trace 同样大幅提升；性能可媲美**全参数离线训练**，但参数量仅为后者的万分之一；并展示出跨数据集的迁移能力（在 A 上学到的记忆能帮助解 B）。

**结论**
test-time compute 不应当是一次性消耗品。把每一次推理的"教训"压缩进一组可累加、可组合的小参数池，是把"reasoning model"推向"continually improving reasoning model"的可行路径，对 agent 的长期自我演化场景尤其重要。

---

## 📊 本期速递亮点

- **三篇论文恰好覆盖 reasoning research 的三个关键维度**：
  1. **推理时**怎么花算力 (GRACE, test-time scaling 的粒度调度)
  2. **预训练时**能力从何而来 (Capability Provenance, 数据归因)
  3. **推理之后**怎么把经验留下 (Latent Memories, 持续自我改进)
- 都是刚发布 3-4 天内的最新 preprint，引用数尚未累计，但话题前沿
- COLM 2026 在 social reasoning 的可解释性方向开始升温

## Sources

- [arXiv:2606.19354 — GRACE](https://arxiv.org/abs/2606.19354)
- [arXiv:2606.19625 — Capability Provenance](https://arxiv.org/abs/2606.19625)
- [arXiv:2606.17803 — Experiential Latent Memories](https://arxiv.org/abs/2606.17803)
