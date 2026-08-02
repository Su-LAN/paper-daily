# 📚 每日论文速递 - 2026-08-03

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. Reasoning Consensus: Structural Ensembling of LLM Reasoning via Weighted DAG Aggregation

**基本信息**
- 作者: Amruta Parulekar, Jinu Lee, Dilek Hakkani-Tür, Hari Sundaram
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.27783](https://arxiv.org/abs/2607.27783)

**主要贡献**
提出对多个 LLM 的"推理结构"而非仅答案做集成的框架：从各推理链中抽取 DAG 并做加权合并，按多少条独立轨迹佐证某一步骤来加权，输出可检视的 "Consensus Reasoning" 共识推理图，解决 chain-of-thought 探索埋没在非结构化文本中、用户无法判断哪些步骤有依据的问题。

**方法**
从多模型（或单模型多采样）的推理链中抽取推理步骤 DAG，对齐后做加权合并：每个节点/步骤的权重等于独立佐证它的轨迹数；在合并图上选取共识子图与最终结论，同时保留被认真考虑过但被放弃的替代路径，用于分析多样化推理视角。

**实验**
覆盖法条解释、研究生级科学、叙事多跳推理、一阶逻辑等六个基准：同预算下一致优于 majority-vote 基线（MuSR-MM 上最高 +3.1% 准确率）；单模型设置下与 self-consistency 持平或更优，且额外产出可检视的共识推理图。集成权重与 LLM-judge 的推理质量排序相关（Spearman ρ = 0.30–0.51）；五个数据集上共识子图在 54.4–65.4% 的对比中优于通向 majority-vote 答案的替代子图。

**结论**
结构级集成是 answer-level 投票的可解释替代：在不增加轨迹预算的前提下提升准确率，并给出哪些推理步骤被独立佐证的显式证据。

---

## 2. Beyond the Best Teacher: Expanding and Compressing the Reasoning Solution Manifold

**基本信息**
- 作者: Songshuo Lu, Zhi Chen, Yaohua Tang
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.27770](https://arxiv.org/abs/2607.27770)

**主要贡献**
指出单次 RL 训练产出的强推理模型是"不完整的 teacher"——往往只放大了有效解法模式的一个子集，应把 RL 策略视为多盆地推理解流形的局部探针而非全局可靠的监督者；据此提出 expand-then-compress 框架，将 teacher 构造与多 teacher 策略蒸馏耦合。

**方法**
扩张阶段：Residual Group Relative Policy Optimization (RGRPO) 从同一初始化训练一系列 teacher，每一轮定向覆盖已积累 teacher 联合尚未覆盖的样本。压缩阶段：reliability-gated Teacher-Union On-policy Distillation (TU-OPD) 让 student 从自己的响应前缀学习，逐样本只让可靠 teacher 参与监督，并按 per-example 质量加权其 sampled-token OPD 损失；另提出 Consensus-Residual Decomposition，保留 winner teacher 相对可靠同伴的超额 token 偏好，防止聚合时压制专家行为。

**实验**
数学推理、代码生成、指令跟随三个域上，蒸馏得到的 Qwen3-1.7B student 一致超过最强单个 teacher，相对提升分别为 2.0%、8.3%、6.9%，且保持单模型推理开销。

**结论**
更强的 student 不来自挑选单个更好的 teacher，而来自有意构造互补的 teacher 联合并将其压缩——为 reasoning RL + 蒸馏管线提供了简单而通用的原则。

---

## 3. Would You Walk to the Car Wash? Revealing the Salience Bias of Large Language Models in Commonsense Reasoning

**基本信息**
- 作者: Zheng Wu, Chenhao Xue, Shijie Zheng, Yijie Lu, Cheng Yang, Zhuosheng Zhang
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.28478](https://arxiv.org/abs/2607.28478)

**主要贡献**
提出并命名 Salience Bias：LLM 在日常常识推理中易被无用的显式干扰项（如数值）劫持，忽略任务隐含的物理/常识前提；构建覆盖四类陷阱维度的 SaliTrap 基准，并回答该失败是常识缺失还是常识被压制这一关键问题。

**方法**
构建高质量 SaliTrap 数据集（四个 trap 维度）；评测 12 个 SOTA LLM，分析偏差严重度随干扰项密度的变化，以及"检测到陷阱"与"实际避开陷阱"的解耦；再以剥离任务框架的 context-free knowledge probe 重新诱导同一批模型，区分知识缺失与知识压制；最后测试轻量推理时提示干预。

**实验**
所有主流模型都显著受 salience bias 影响，严重度随干扰项密度上升，且识别陷阱与避开陷阱经常脱节。Context-free 知识探针可恢复超过 90% 的迎合式失败案例，表明所需常识本已存在、只是被显著干扰项挤出，诱导模型做出过度顺从的不必要计算。无需再训练，仅靠轻量推理时提示即可大幅缩小差距。

**结论**
常识推理失败的瓶颈主要在"诱导"（elicitation）而非模型能力：知识在但被压制。SaliTrap 已开源（github.com/Wuzheng02/SaliTrap），可作为这一盲点的测试床。

---

**去重说明**: 本日速递已排除 papers.json 中已记录的 157 篇论文；三篇入选论文均为 2026-07-30 v1 新提交（无 held submissions），/abs Comments 均为空，按预印本记录。
