# 📚 每日论文速递 - 2026-06-21

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 / arXiv 预印本（推理方向高相关）
**论文数量**: 3

---

## 1. VibeThinker-3B: Exploring the Frontier of Verifiable Reasoning in Small Language Models

**基本信息**
- 作者: Sen Xu, Shixi Liu, Wei Wang, Jixin Min, Yingwei Dai, Zhibin Yin, Yirong Chen, Xin Zhou, Junlin Zhang
- 发布: 2026-06-15
- 会议/期刊: arXiv preprint (cs.AI)
- 引用数: 0 📈
- arXiv: [2606.16140](https://arxiv.org/abs/2606.16140)

**主要贡献**
提出 VibeThinker-3B，一个 3B 参数规模的小模型，在可验证推理（verifiable reasoning）任务上对标甚至超越远大体量的前沿系统；首次系统性地提出"参数压缩-覆盖假设"（Parametric Compression-Coverage Hypothesis），主张可验证推理能力可被压缩进紧凑的"推理核心"中，而广覆盖知识则仍需大参数体量。

**方法**
- 三阶段后训练流水线：课程式监督微调（curriculum-based SFT）→ 多领域强化学习（multi-domain RL）→ 离线自蒸馏（offline self-distillation）。
- RL 阶段覆盖数学、代码、逻辑等多个可验证奖励域，结合可验证奖励信号塑造稳定的推理行为。
- 自蒸馏阶段将训练中表现最稳的轨迹反哺回基础模型，进一步稳定 3B 小模型的推理风格。

**实验**
- AIME26 上取得 94.3 分，LiveCodeBench v6 Pass@1 80.2，与体量大数倍的前沿推理模型相当或更优。
- 多基准上验证了"小模型 + 可验证奖励"路径并非简单的效率替代，而是与大模型互补的另一条扩展方向。

**结论**
可验证推理可在 3B 量级被压缩与高度专一化，凸显出"压缩 vs 覆盖"是未来推理 LLM 设计的关键权衡：以小模型加专门化训练在可验证任务上达到前沿水平是可行的。

---

## 2. Context-Aware RL for Agentic and Multimodal LLMs

**基本信息**
- 作者: Peiyang Xu, Bangzheng Li, Sijia Liu, Karthik R. Narasimhan, Pramod Viswanath, Prateek Mittal, Xingyu Fu
- 发布: 2026-06-15
- 会议/期刊: arXiv preprint (cs.CL, cs.CV)
- 引用数: 0 📈
- arXiv: [2606.17053](https://arxiv.org/abs/2606.17053)

**主要贡献**
提出 ContextRL，一种"上下文区分"型的强化学习目标，用于增强 LLM 与多模态 LLM 在 agentic 与推理任务上的上下文敏感度，避免模型在长上下文下退化为忽略证据的捷径推理。

**方法**
- 训练时给模型一个查询、一个答案，以及两个高度相似但仅一者真正支持答案的上下文。
- 模型必须从这两个干扰极强的上下文中"挑出真正能支撑答案"的那个，并据此推理，正确选择被赋予奖励。
- 这种隐式奖励间接迫使模型学会"读上下文再推理"，无需显式细粒度的步级监督。

**实验**
- 在代码任务上相对基线提升约 2.2%，在视觉任务上提升约 1.8%。
- 跨纯文本 agent、代码 agent 与多模态 VQA 基准均观察到一致提升，显示该 RL 目标具有较强通用性。

**结论**
通过精心设计的"对比上下文"奖励，可以在不显式标注推理链的情况下提升 LLM 的上下文驱动推理能力，是一种轻量级、可扩展的 agent 与多模态推理增强机制。

---

## 3. LoopCoder-v2: Only Loop Once for Efficient Test-Time Computation Scaling

**基本信息**
- 作者: Jian Yang, Shawn Guo, Wei Zhang, Tianyu Zheng, Yaxin Du, Haau-Sing Li, Jiajun Wu, Yue Song, Yan Xing, Qingsong Cai, Zelong Huang, Chuan Hao, Ran Tao, Xianglong Liu, Wayne Xin Zhao, Mingjie Tang, Weifeng Lv, Ming Zhou, Bryan Dai
- 发布: 2026-06-16
- 会议/期刊: arXiv preprint (cs.LG)
- 引用数: 0 📈
- arXiv: [2606.18023](https://arxiv.org/abs/2606.18023)

**主要贡献**
系统研究"循环 Transformer"（looped Transformer）作为测试时算力扩展的新维度，提出并行循环结构以摊销延迟与显存代价，并训练出 7B 规模的 LoopCoder-v2 系列模型，从实证上回答"循环几次最优"。

**方法**
- 串行循环带来明显的延迟与显存膨胀，作者改用并行循环 Transformer：跨循环位置偏移 + 门控滑动窗口注意力，使多次循环可并行执行。
- 训练 7B 参数家族，包含 1/2/3+ 多种循环深度配置，统一在 18T tokens 上预训练，以公平比较循环深度的影响。
- 评测覆盖代码生成、代码推理、agentic 软件工程与 tool-use 多类基准。

**实验**
- 两循环（2-loop）变体相对无循环基线在全部下游任务上一致提升，agentic 与代码推理基准提升尤为显著。
- 三循环及以上反而下降，提示更深的"潜在迭代"会引入表征噪声、收益边际递减。

**结论**
"循环一次"（即 2-loop）是测试时算力扩展的一个甜点（sweet spot），既保留隐式深度推理收益，又避免延迟与噪声爆炸，为推理 LLM 的架构尺度扩展给出了实用的设计规则。

---

**说明**
- 上述论文均为 2026 年 6 月新发布的 arXiv 预印本，引用数尚未在 Semantic Scholar 索引（API 暂限速），因此首次记录引用计为 0，将在后续 `--update` 中跟踪增长。
- 三篇分别覆盖：可验证推理小模型 RL（VibeThinker-3B）、上下文敏感推理 RL（ContextRL）、循环 Transformer 测试时扩展（LoopCoder-v2），覆盖了当前 LLM 推理研究的三条主线：训练范式、奖励设计、架构扩展。
