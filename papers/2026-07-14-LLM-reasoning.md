# 📚 每日论文速递 - 2026-07-14

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. RL Post-Training Builds Compositional Reasoning Strategies

**基本信息**
- 作者: Azwar Abdulsalam, Nishil Patel, Andrew Saxe
- 发布: 2026-07-08
- 会议/期刊: ICML 2026 Workshop on Compositional Learning (CCF-A workshop)
- 引用数: 0 📈
- arXiv: [2607.07646](https://arxiv.org/abs/2607.07646)

**主要贡献**
回答了 RL 后训练领域的一个核心争议：RL 到底是仅仅"放大"基座模型已有的能力，还是能"构建"全新的高层推理策略。作者证明 RL 能解决基座模型即使加大采样预算也无法解决的问题，并揭示了一个分阶段的组合机制：RL 先强化原语操作，再发现由原语组合而成的高层过程。

**方法**
构建一个完全可审计的重写文法（rewrite-grammar）受控环境：先在原语符号重写任务上预训练 Transformer，再仅用二元奖励信号在基于轨迹的推理任务上做 RL 后训练。与拒绝采样微调（RFT）对比，并对预训练配置做消融，追踪组合策略的涌现条件。

**实验**
实验记录了两类组合的涌现：顺序组合（折叠有序收缩操作）与并行组合（合并独立收缩操作）。消融表明组合能否涌现取决于预训练是否形成了归约过程。关键差异在于"选择性"：RFT 产生大量捷径式且往往无效的重写，而 RL 将探索集中于有效、可复用的结构。

**结论**
RL 后训练不是简单放大，而是把薄弱的过程性组件重组为可靠的高层策略——为理解 RLVR 为何有效提供了机制层面的证据。

---

## 2. HALO: Hybrid Adaptive Latent Reasoning for Language Models

**基本信息**
- 作者: Micah Zhang
- 发布: 2026-05-03 (arXiv 公告 2026-07)
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.08775](https://arxiv.org/abs/2607.08775)

**主要贡献**
提出 HALO，一种在冻结预训练语言模型之上、以极小额外计算增强推理能力的混合自适应隐空间推理（latent reasoning）方法。核心思想是不对所有 token 均匀分配精炼计算，而是自适应地把算力投到最需要的 token 上。

**方法**
两阶段精炼：先做粗粒度精炼（coarse refinement），再通过 token 打分（token scoring）挑选一个 token 子集进行第二阶段的选择性隐空间精炼，并配合单调 token 停机（monotonic token halting）避免不必要的计算。

**实验**
在 MMLU-Pro 与 GPQA-Diamond 上，HALO 取得最强结果，同时控制器计算量低于固定单步/双步精炼两种基线；性能匹配固定两步精炼，但平均施加的精炼步数更少。

**结论**
策略性分配精炼计算优于均匀分配，为冻结 LLM 的低成本隐式推理增强提供了一条可行路径。

---

## 3. Switch-Reasoner: Learn When to Think in Multitask Mixtures via Reinforcement Learning

**基本信息**
- 作者: Yiyang Fang, Pei Fu, Jinjie Li, Jian Liang, Wenke Huang, Ruijie Luo, Shaojie Zhang, Jian Luan, Yi R. Fung, Mang Ye
- 发布: 2026-07-09
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.08572](https://arxiv.org/abs/2607.08572)

**主要贡献**
针对多模态 LLM 在多任务混合场景下对所有输入统一施加固定推理步骤的低效问题，提出 Switch-Reasoner 框架：让模型学会"何时该思考"——简单输入直接作答，困难输入才调用显式推理。

**方法**
双模式推理（直接作答 / 先显式推理再作答），将"思考"视为 GRPO 框架内的虚拟工具调用（tool-based integration），并设计双层调控机制（dual-level regulation）：在整体层面平衡推理使用率，在实例层面提供个体化的思考决策指导，保证训练稳定。

**实验**
在 11 个多模态任务上评测，Switch-Reasoner 在保持强性能的同时显著减少不必要的推理，相比固定推理范式取得更优的精度-效率权衡。

**结论**
自适应推理选择可以在不牺牲任务性能的前提下提升多模态模型的计算效率，是 adaptive thinking 方向的又一实证。

---

## 📊 今日统计

| 论文 | 发布日期 | venue | 引用数 |
|------|---------|-------|-------|
| RL Post-Training Builds Compositional Reasoning Strategies | 2026-07-08 | ICML 2026 Workshop | 0 |
| HALO: Hybrid Adaptive Latent Reasoning | 2026-05-03 | arXiv preprint | 0 |
| Switch-Reasoner: Learn When to Think | 2026-07-09 | arXiv preprint | 0 |

**主题趋势**: 今日三篇论文覆盖了 LLM reasoning 的三个活跃子方向——RL 后训练的机制理解（组合策略涌现）、隐空间推理的自适应计算分配、以及"何时思考"的自适应推理决策。共同主线是**推理计算的按需分配与机制可解释性**。
