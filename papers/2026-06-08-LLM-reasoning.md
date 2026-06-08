# 📚 每日论文速递 - 2026-06-08

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. Re²: Unlocking LLM Reasoning via Reinforcement Learning with Re-solving

**基本信息**
- 作者: Pinzheng Wang, Shuli Xu, Juntao Li, Yu Luo, Dong Li, Jianye Hao, Min Zhang
- 发布: 2026-03-07
- 会议/期刊: ICLR 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2603.07197](https://arxiv.org/abs/2603.07197)

**主要贡献**
- 指出经过 RLVR 训练的推理模型仍倾向于生成大量低质量、冗余的中间步骤，导致计算浪费且影响最终答案质量。
- 提出 Re²（Reinforcement Learning with Re-solving）训练范式，让模型在意识到当前推理路径走不通时主动「放弃-重启」，无需依赖前置 SFT 阶段。
- 在多项数学/推理基准上把模型 "redo" 行为占比从 0.5% 拉高到 30%+，在同等 token 预算下显著提升性能。

**方法**
Re² 在强化学习目标中显式奖励「主动重启」这一控制动作：当模型发现自己进入死胡同（如循环、错算、约束违背）时，可以输出一个重启 token 并基于已有问题重新开始解题。reward shaping 同时惩罚冗余且鼓励高质量结束，从而把「再解一遍」变成 RL 策略可学习的高层操作，而不是被外部脚本触发的硬流程。整套训练在纯 RL 范式下完成，避免了 SFT 引入的行为偏差。

**实验**
- 在 MATH、AIME、Olympiad-level reasoning benchmark 上对比 RLVR、GRPO 等基线，Re² 在同等 / 更低 token 预算下取得稳定增益。
- "redo" 行为频率从 0.5% → 30%+，且与正确率正相关，说明重启不是退化为乱码，而是被模型策略性使用。
- Ablation 表明：去掉重启奖励 → 退化为标准 RLVR；只奖励重启而不惩罚冗余 → 模型滥用重启反而变差。

**结论**
Re² 把「自我纠错-重启」从工程级技巧抬升为可由 RL 直接学习的策略动作，为长链推理中的「无效计算」问题提供了一条干净的训练侧解决方案，对未来的 reasoning model 训练管线有直接借鉴价值。

---

## 2. Breaking the Reward Barrier: Accelerating Tree-of-Thought Reasoning via Speculative Exploration

**基本信息**
- 作者: Shuzhang Zhong, Haochen Huang, Shengxuan Qiu, Pengfei Zuo, Runsheng Wang, Meng Li
- 发布: 2026-05-11
- 会议/期刊: OSDI 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2605.10195](https://arxiv.org/abs/2605.10195)

**主要贡献**
- 指出 Tree-of-Thought (ToT) 推理在系统层面的瓶颈是「reward synchronization barrier」——必须等当前批次的 reward 全部到位才能展开下一层分支，GPU 大量空闲。
- 提出 SPEX：把推理路径的探索做成 speculative execution，在 reward 没回来之前先「猜」下一步走哪条分支。
- 在多种 ToT 算法上稳定取得 1.2×–3× 端到端加速，结合 token-level speculative decoding 后总加速达 4.1×。

**方法**
SPEX 包含三个互相耦合的机制：(1) intra-query speculative path selection —— 在 reward 尚未返回时，用轻量预测器先选出最可能被保留的若干路径并提前展开；(2) inter-query budget allocation —— 在多个并发推理 query 之间动态分配 GPU 算力，把闲置 slot 让给最有收益的 speculative branch；(3) adaptive early termination —— 一旦 reward 到达且与 speculative 结果不符，立即回滚未提交的算力，避免错误猜测继续消耗资源。整套设计把 ToT 从串行的 BFS 改造为推理-奖励解耦的流水线。

**实验**
- 在多种 ToT 变体（standard ToT、GoT、ReST-style）和 7B–70B 模型上测试，1.2×–3× 加速覆盖所有配置。
- 与 token 级 speculative decoding 叠加后取得 4.1× 累积加速，无精度损失。
- 系统侧分析显示 GPU 利用率从 ~40% 提升到 70%+，确认 reward barrier 是 ToT 的真正瓶颈。

**结论**
该工作把 LLM reasoning 的优化从模型/算法层下沉到系统/调度层，为「长链 + 多分支」推理范式提供了通用的服务侧加速框架，是把 reasoning model 真正推上生产的关键拼图之一。

---

## 3. Unlocking the Working Memory of Large Language Models for Latent Reasoning

**基本信息**
- 作者: Lukas Aichberger, Sepp Hochreiter
- 发布: 2026-05-28
- 会议/期刊: arXiv (preprint, Hochreiter 组)
- 引用数: 0 📈
- arXiv: [2605.30343](https://arxiv.org/abs/2605.30343)

**主要贡献**
- 提出 Reasoning in Memory (RiM)，用固定长度的「memory blocks」取代外显的 chain-of-thought tokens，实现计算高效的潜在推理。
- 通过两阶段训练：先用显式 CoT 监督把 memory blocks 锚定到可解释的推理状态，再撤掉监督让模型在一次前向中迭代刷新答案。
- 在多种模型族 / 尺寸上匹配或超过现有 latent reasoning 方法（Coconut、CoT-decoding 等），同时把推理 token 数显著降低。

**方法**
RiM 在 LLM 中保留一段固定位置的「memory blocks」token 序列：(1) Grounding 阶段：用显式 CoT 步骤监督这些 blocks，让它们承载与可读推理对齐的潜在状态；(2) Latent refinement 阶段：去掉文本监督，模型通过对 memory blocks 的多轮 in-place 更新继续推理，每轮都对最终答案做一次重写。整个过程是 single-forward-pass 的（不展开 token 级 CoT），但模型内部相当于做了多步推理。Hochreiter 组的设计思路明显借鉴了 LSTM/Working-Memory 的归纳偏置。

**实验**
- 在 GSM8K、MATH、ARC-Challenge 等推理基准上，RiM 与 explicit CoT 持平或更优，同时推理 token 数减少 ~30%–60%。
- 跨 1B–7B 模型族稳定有效，说明 memory-block 机制不是单点 hack。
- 与 Coconut 等先前 latent reasoning 方法相比，RiM 的两阶段训练让 memory blocks 仍保有一定可解释性，缓解了「latent reasoning = 完全黑盒」的批评。

**结论**
RiM 把 working memory 这一经典认知概念落到 transformer 推理上：用固定槽位 + 两阶段训练换来「快、隐式、又可锚定」的推理形式，是把 latent reasoning 从概念验证推向实用的代表性工作之一，与近期 [2604.15726] "LLM Reasoning Is Latent, Not the Chain of Thought" 的立场互为印证。

---

## 📊 今日观察

- **训练侧（Re²）+ 系统侧（SPEX）+ 表示侧（RiM）** 三篇分别从不同层面攻击同一个问题：长 CoT 太贵、太冗、太慢。
- 与 6 月之前观察到的「latent reasoning」浪潮一致 —— 今天的 RiM 几乎可以看作上周 [2604.15726] 立场论文的方法论实现。
- OSDI 2026 收录 SPEX，说明 reasoning 已从纯 ML/NLP 议题外溢到系统社区，未来 reasoning serving stack 会是新的竞争点。
