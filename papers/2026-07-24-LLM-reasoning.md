# 📚 每日论文速递 - 2026-07-24

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. EvoThink: Evolving Thinking in Large Reasoning Models via Self-Pruning and Aha-Moment Preference Optimization

**基本信息**
- 作者: Xinbang Dai, Zheyu Xin, Huikang Hu, Lin Ren, Rihui Jin, Guohui Xiao, Guilin Qi, Kuicai Dong, Zhaocheng Du, Yuyang Zhang
- 发布: 2026-07-22
- 会议/期刊: IJCAI 2026 (CCF-A)（/abs 页 Comments 原文 "accepted by IJCAI 2026"）
- 引用数: 0 📈
- arXiv: [2607.19962](https://arxiv.org/abs/2607.19962)

**主要贡献**
针对大型推理模型（LRM）"过度思考"（冗余验证步骤堆积）的问题，提出 EvoThink 框架，在降低推理 token 消耗的同时提升推理能力，而非像现有快慢思考切换 / 轨迹压缩方法那样以牺牲推理质量为代价。

**方法**
两个组件：(1) Self-Pruning Training (SPT)——无监督地迭代剔除冗余推理步骤，并在简化后的轨迹上重训练；(2) Aha-Moment Preference Optimization (AMPO)——识别有价值的失败尝试，构造"由错到对"的偏好数据，让模型内化这种顿悟式推理模式。

**实验**
在数学推理与代码生成任务上验证：EvoThink 显著减少推理 token 数，同时提升 LRM 的推理能力（效率与质量双收益）。

**结论**
细粒度区分"有用步骤 vs 冗余步骤"比整体压缩或模式切换更有效；从失败尝试中提炼顿悟时刻可作为偏好优化的有效信号。

---

## 2. Reasoning Error from Known Fact: Step-Level Self-Consistency Group Relative Policy Optimization for LLM

**基本信息**
- 作者: Xiaomeng Hu, Jiaqi Hu, Hao Chen, Qi Zhang, Zhanming Shen, Wentao Ye, Junbo Zhao
- 发布: 2026-07-21
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.18915](https://arxiv.org/abs/2607.18915)

**主要贡献**
细粒度分析 LLM 长推理链中的幻觉，发现推理轨迹尤其容易出现"上下文敏感事实幻觉"——模型明明掌握相关知识，却因推理过程中的上下文干扰而犯事实错误；据此提出步骤级奖励的 RL 方法 SSC-GRPO。

**方法**
Step-level Self-Consistency GRPO：对多次 rollout 中的各个推理步骤计算自一致性得分，将其作为步骤级奖励分配给推理轨迹，替代仅看最终答案的粗粒度奖励。

**实验**
在数学推理基准和幻觉排行榜上均达到 SOTA，优于先前的 GRPO 类方法。

**结论**
"知而犯错"的上下文敏感事实幻觉是长推理的重要失败模式；步骤级自一致性信号为检测和缓解推理过程幻觉提供了新视角。

---

## 3. When Reasoning Narrows the Move: Diversity Collapse in LLM Game Play

**基本信息**
- 作者: Junyi Sha, Renfei Tan, David Simchi-Levi
- 发布: 2026-07-21
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.19523](https://arxiv.org/abs/2607.19523)

**主要贡献**
在最优动作可精确计算的确定性棋类环境（tic-tac-toe 变体）中，系统研究 SFT 与推理模式生成对 LLM 序贯决策行为多样性的影响，指出"窄支撑模仿"是策略坍缩的来源。

**方法**
构建可控的确定性棋局测试套件，从状态级评估、对弈竞技场、训练轨迹三个层面直接度量动作多样性；提出动作增强（对每个状态用全部最优动作而非单一示范动作训练）作为缓解手段。

**实验**
推理模式生成经常压制动作多样性但并未一致地提高动作准确率；标准 SFT 提升准确率的同时诱发超出准确率-多样性权衡所需的过早多样性坍缩；动作增强可部分缓解该效应。

**结论**
SFT 中保持动作支撑集对维持探索行为很重要；推理并非总是"免费"的——它可能以行为多样性为代价。

---

## 📈 引用数更新说明

- 本次同步补录了昨日 429 未取回的 4 篇论文的引用数（均与 07-22 基线持平）: 2606.17803 (1), 2606.25832 (1), 2606.24391 (0), 2607.01071 (0)。
- 全量引用刷新由每日 Citation update 任务单独执行。
