# 📚 每日论文速递 - 2026-07-26

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. SLPO: Scaling Latent Reasoning via a Surrogate Policy

**基本信息**
- 作者: Runyang You, Zhiyuan Liu, Yongqi Li, Wenjie Li
- 发布: 2026-07-22
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.19691](https://arxiv.org/abs/2607.19691)

**主要贡献**
首次把 outcome-reward RL（RLVR 式训练）引入自回归潜空间推理（latent reasoning）模型：显式 CoT 已经靠 RL 超越模仿学习，而 latent 推理器因缺少逐步似然和自适应停止接口，一直停留在模仿阶段——SLPO 补上了这块拼图。

**方法**
Surrogate Latent Policy Optimization (SLPO)：(1) 在潜向量转移上构造经验代理策略密度（surrogate policy density），使轨迹级 credit assignment 成为可能；(2) 训练一个 correctness 监督的停止头，再由 outcome-reward 优化将其精炼为可变时长（variable-horizon）策略，在固定思考预算下自适应分配潜空间计算。

**实验**
在 continuous thinking 与 soft thinking 两种设定下，SLPO 提升并行采样的 Pass@k，并自发把更长的潜空间计算分配给更难的样本，确定性准确率随之提高。

**结论**
潜空间推理同样可以通过结果奖励 RL 实现 test-time scaling；代理策略密度 + 可学习停止头解决了 latent 轨迹无逐步似然、无停止接口两大障碍，为远短于显式 CoT 的高效推理路线打开 RL 后训练空间。

---

## 2. REFACT: Adaptive Fact Restatement for Compact and Faithful Chain-of-Thought Reasoning

**基本信息**
- 作者: Zhensheng Jin, Xin Dai, Zhenghao Liu, Chaojun Xiao, Huiyuan Xie, Yu Gu, Ge Yu, Maosong Sun
- 发布: 2026-07-23
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.20833](https://arxiv.org/abs/2607.20833)

**主要贡献**
针对长链推理在证据稀疏/噪声/与参数知识冲突时"漂移出上下文"的问题，提出自适应事实复述引用框架 REFACT：让模型学会判断哪一步推理需要上下文接地、以及以什么粒度复述原文事实，把引用变成支撑答案的中间状态，而非事后附加的摆设。

**方法**
两阶段 SFT→RL 训练管线：先 SFT 学习引用格式，再用 citation-utility 奖励做 RL——奖励引用事实的良构性、可溯源性与答案充分性，同时避免无支撑推理与无差别的整段抄写。

**实验**
在 LongBench、LV-Eval、ConFiQA 上，REFACT 同时提升长上下文 QA 与反事实忠实性，并显著降低 token 消耗；分析显示其以更少的复述保留更多含答案证据，推理轨迹"更密而非更长"。

**结论**
自适应粒度的事实复述让 CoT 既紧凑又忠实于上下文；citation-utility 奖励是把"引用质量"转化为可优化信号的有效途径，代码与数据已开源。

---

## 3. PRO-LONG: Programmatic Memory Enables Long-Horizon Reasoning

**基本信息**
- 作者: Alexis Fox, Junlin Wang, Paul Rosu, Bhuwan Dhingra
- 发布: 2026-07-22
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.20064](https://arxiv.org/abs/2607.20064)

**主要贡献**
指出 LLM agent 长时程任务中上下文管理的核心权衡——保留的信息越多，检索相关细节越难；提出极简框架 PRO-LONG，用"程序化记忆"（programmatic memory）化解该权衡：完整保留结构化交互日志，借助 coding agent 的代码能力高效检索历史。

**方法**
维护完整的结构化交互日志（不做有损压缩），让 agent 通过写代码来搜索、聚合自己的历史观测，把上下文管理问题转化为程序化检索问题，无需专用检索器或复杂 harness。

**实验**
在 ARC-AGI-3 公开游戏全集上，PRO-LONG 较基础 coding agent 平均提升 18.0 个百分点（跨多个前沿模型），匹敌或超过 SOTA 专用 harness（最高 76.1% pass@1），token 消耗少 4.2-5.8 倍；配合 Fable 5 达到 97.4% best@2。

**结论**
"完整日志 + 程序化检索"胜过有损的上下文压缩策略；随着 coding agent 能力增强，程序化记忆是长时程探索型任务中简单、通用且省 token 的上下文管理方案。

---

## 📌 其他值得关注（未入选）

- [2607.20448](https://arxiv.org/abs/2607.20448) Domyn-Small: A European 10B Reasoning Language Model — 开源 10B 推理模型，完整 GRPO/RLVR 后训练配方
- [2607.18438](https://arxiv.org/abs/2607.18438) Relay-Bench — 多领域组合推理基准，GPT-5.5 (xHigh) 仅 43.3%
- [2607.21433](https://arxiv.org/abs/2607.21433) CoT 非收敛的机制性早期检测（linear probe on hidden states）
