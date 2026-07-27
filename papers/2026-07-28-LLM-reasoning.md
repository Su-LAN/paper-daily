# 📚 每日论文速递 - 2026-07-28

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高质量预印本
**论文数量**: 3

---

## 1. Learning as Reasoning Unfolds: Progressive Rollout Allocation for Efficient Reinforcement Learning

**基本信息**
- 作者: Heyang Jiang, Henry Liu, Baharan Mirzasoleiman
- 发布: 2026-07-24
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2607.22002](https://arxiv.org/abs/2607.22002)

**主要贡献**
提出 VIGOR (VarIance Guided Online Rollout allocation)，针对 RLVR/GRPO 训练中大量 rollout 无信息量、计算昂贵且不稳定的问题，用在线方差引导的渐进式 rollout 分配替代固定的每样本 rollout 预算。

**方法**
每个 batch 先为所有样本生成少量 rollout，随后迭代地把额外 rollout 分配给组内奖励方差最高的样本，直至用满总预算。理论上证明在 RLVR 下奖励方差控制梯度幅值，并推导出 VIGOR 相对 GRPO 的闭式加速比——在 Pareto 分布的奖励方差假设下加速比随细化轮数增长。

**实验**
在数学推理和代码任务上：数学任务达到目标精度所需 rollout 减少至多 2.3×；代码任务以 1.49× 更少的 rollout 达到 GRPO 的最终 full pass rate，平均测试通过率提升 3.4 个百分点。

**结论**
按奖励方差在线分配 rollout 预算是提升 RLVR 训练效率的简单有效途径，兼具理论加速保证和实证收益。

---

## 2. LeAct: Learning to Reason from Expert Actions

**基本信息**
- 作者: Ziran Yang, Chengshuai Shi, Raj Ghugare, Benjamin Eysenbach, Karthik Narasimhan, Chi Jin
- 发布: 2026-07-23
- 会议/期刊: arXiv preprint (27 pages, 3 figures, 11 tables)
- 引用数: 0 📈
- arXiv: [2607.21856](https://arxiv.org/abs/2607.21856)

**主要贡献**
提出把专家系统（博弈引擎、经典规划器、定理证明器）的近最优动作转化为推理监督的新范式：专家只给动作不给思维链，LeAct 把背后的 CoT 视为隐变量并仅从动作中恢复，使专家系统成为基础模型推理教师的全新来源。

**方法**
LeAct 对隐变量 CoT 做优化：学生模型为每个专家动作采样候选思维链，保留那些可度量地提高学生自身复现该动作概率的 CoT，迭代蒸馏成自然语言推理数据。

**实验**
在多规模不完全信息博弈与模拟机器人基准上：小型可枚举博弈中达到求解器数值下限；更大规模下与求解器的差距比最强 expert-iteration 基线缩小 5×；在 Flop Hold'em（约 10^9 信息集）上正面对抗净胜 +60 mbb/g；机器人探针任务上是唯一优于直接模仿的训练方案。

**结论**
无需人工标注或更强 LLM 蒸馏，沉默专家的动作即可恢复出可泛化的自然语言推理监督，为推理数据来源开辟了新类别。

---

## 3. Reasoning Denoiser: Denoising Reasoning Traces for Hallucination Detection in Large Reasoning Models

**基本信息**
- 作者: Junlin Fang, Do Nguyen-Thanh, Xiaogang Xu, Zhen Fang, Sean Du
- 发布: 2026-07-24
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2607.22098](https://arxiv.org/abs/2607.22098)

**主要贡献**
指出大型推理模型 (LRM) 长推理轨迹中两类普遍噪声——无关步骤与重复步骤——会显著削弱基于轨迹的幻觉检测，并提出 REDE 学习框架对推理轨迹去噪后再做检测。

**方法**
REDE 利用最终答案的 attention 作为自动监督信号来塑造步骤级表示空间，得到能可靠区分噪声步骤与信息步骤的精化嵌入；过滤噪声步骤后的轨迹可即插即用地接入多种现有幻觉检测器。现有置信度分数与朴素嵌入过滤均无法可靠完成该分离。

**实验**
在多个推理基准上的大量实验表明，REDE 在各种竞争基线之上一致提升幻觉检测性能。

**结论**
推理轨迹是幻觉检测的有用信号，但必须先去噪；答案 attention 引导的步骤级表示学习提供了通用的去噪方案。

---

## 📊 今日速览

| 论文 | 方向 | 亮点 | 引用 |
|------|------|------|------|
| VIGOR (2607.22002) | RLVR 训练效率 | 方差引导 rollout 分配，数学 2.3× 提速 + 闭式加速比 | 0 |
| LeAct (2607.21856) | 推理数据来源 | 从专家动作恢复隐变量 CoT，Flop Hold'em +60 mbb/g | 0 |
| REDE (2607.22098) | LRM 可靠性 | 答案 attention 监督的轨迹去噪，幻觉检测即插即用增强 | 0 |

> 三篇均为一周内新发布预印本（/abs Comments 均未标注会议接收），Semantic Scholar 引用数为记录当日数值。
