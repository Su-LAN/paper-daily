# 📚 每日论文速递 - 2026-07-31

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. Credit Cards, Confusion, Computation, and Consequences: What Can We Uncover About Language Model Reasoning?

**基本信息**
- 作者: Arnav Hiray, Agam Shah, Caleb Lu, Meghaj Tarte, Harsit Mittal, Sudheer Chava
- 发布: 2026-07-29 (v1)
- 会议/期刊: COLM 2026 (unranked, new venue) — /abs Comments: "Accepted at CoLM 2026"
- 引用数: 0 📈
- arXiv: [2607.26952](https://arxiv.org/abs/2607.26952)

**主要贡献**
提出 CreditCardQA——首个从真实信用卡协议中构建的金融素养数值推理基准，共 1,800 道题目，覆盖费用、利息与还款场景，并包含第一人称消费者咨询形式的变体，用于系统评估语言模型与推理模型在合同条款理解与数值推理上的能力。

**方法**
基于真实信用卡协议构造问答对，比较 Chain-of-Thought (CoT) 与 Program-of-Thought (PoT) 两种提示策略；对模型错误进行细粒度归因分析，将失败划分为金融规则误用、条件遗漏、合同条款误解与纯计算错误等类别。

**实验**
PoT 提示带来一致的性能提升，对基线推理能力较弱的模型增益尤为明显。错误分析显示：失败主要源于金融规则误用、条件遗漏与合同条款误解，而非算术计算错误；比较类、条件逻辑类与金额约束类问题最难；错误集中在滞纳金、小额余额等边界场景。

**结论**
即使配备 CoT/PoT，当前模型在真实金融合同的数值推理上仍系统性受限于"规则应用与条件理解"而非计算本身；CreditCardQA 为面向消费者的金融推理能力提供了可靠的评测基础。

---

## 2. Probing the Origins of Reasoning Performance: Representational Quality for Mathematical Problem-Solving in RL vs. SFT Fine-Tuned Models

**基本信息**
- 作者: Antyabha Rahman, Akshaj Gurugubelli, Omar Ankit, Kevin Zhu, Aishwarya Balwani
- 发布: 2026-07-28 (v1)
- 会议/期刊: AAAI 2026 XAI4Science Workshop (workshop) — /abs Comments: "Second Workshop on XAI4Science, AAAI 2026"
- 引用数: 0 📈
- arXiv: [2607.26119](https://arxiv.org/abs/2607.26119)

**主要贡献**
从内部表征角度解释"为什么 RL 训练的推理模型在数学任务上优于 SFT 模型"：给出两条收敛的机制性证据（线性可分性更强的隐状态表征 + 层级化的深层计算结构），并分析了重复采样下 token 分配的可变性。

**方法**
(1) 在各层隐状态上训练线性探针（linear probes），预测答案正确性以衡量表征的线性可分性；(2) 均值消融（mean ablation）研究各层对性能的重要性分布；(3) 对同一问题重复采样，统计 token 数量的可变性以评估自适应计算分配。

**实验**
线性探针显示 RL 模型对答案正确性的预测准确率高于 SFT 模型，表征更结构化、更线性可分；消融显示 RL 模型形成"越深越关键"的层级架构，而 SFT 模型的层重要性均匀分布。token 分配可变性在部分 RL 模型中更高、在另一些模型中却高度一致，说明计算分配更多取决于整体训练管线而非 RL/SFT 二分。

**结论**
RL 训练从根本上重构了模型表征与处理推理问题的方式；token 分配可变性揭示了 on-policy 推理的合理解空间分布，可区分策略稳定与欠定/不可辨识的模型行为。

---

## 3. Think Short, Defer Smart, Act, and Repeat: Calibrated Reasoning and Uncertainty-Aware Deferral for Edge LLM Agents

**基本信息**
- 作者: Amirmohammad Farzaneh, Osvaldo Simeone
- 发布: 2026-07-29 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.26865](https://arxiv.org/abs/2607.26865)

**主要贡献**
提出 TSDS (Think Short, Defer Smart) 框架，用于边缘部署的 ReAct 型 LLM agent：将"推理提前停止"与"不确定性感知的云端上交（deferral）"联合校准，提供对期望回报与云调用率的有限样本统计保证。

**方法**
两个机制协同：(1) 轻量收敛探针（convergence probe）——一旦本地推理中意图动作已稳定即停止思考；(2) 基于困惑度的 deferral 规则——不确定的动作升级到云端大模型。两者在端到端 episode 轨迹上通过多目标 Learn-Then-Test (LTT) 过程联合校准，同时给出期望 episode 回报与云调用率的 finite-sample 保证。

**实验**
在四个 ReAct 基准上评估：算术推理 (GSM8K)、多跳问答 (HotpotQA)、代码生成 (MBPP)、多步具身规划（家用机器人），对比仅思考校准与仅 deferral 校准的基线。TSDS 在 HotpotQA、MBPP 与机器人任务上将每 episode 思考计算量降低 43%–73%，同时维持认证的回报与云调用率保证。

**结论**
在边缘算力受限场景下，联合校准"何时停止思考"与"何时上交云端"能大幅削减推理开销且保持可证明的可靠性，为 edge LLM agent 的推理预算管理提供了带统计保证的实用方案。

---

**去重说明**: 本日速递已排除 papers.json 中已记录的 151 篇论文；候选中 2607.24794 (ECCV 2026, v1 06-30)、2607.24789 (v1 06-27) 因属旧提交（held submissions）被排除。
