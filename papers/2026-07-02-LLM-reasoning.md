# 📚 每日论文速递 - 2026-07-02

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + arXiv 预印本
**论文数量**: 3

---

## 1. TARPO: Token-Wise Latent-Explicit Reasoning via Action-Routing Policy Optimization

**基本信息**
- 作者: Liting Zhang, Shiwan Zhao, Xuyang Zhao, Zichen Xu, Jianye Wang, Qicheng Li
- 发布: 2026-06-04
- 会议/期刊: arXiv 预印本 (cs.CL)
- 引用数: 0 📈
- arXiv: [2606.05859](https://arxiv.org/abs/2606.05859)

**主要贡献**
提出 TARPO，一种在每一步 token 级别自适应切换离散显式推理与连续潜在推理的 RL 框架。核心创新是通过轻量路由机制在训练中学习何时用文字思考、何时用隐向量思考，从而兼顾可解释性与效率。

**方法**
- 在标准显式 CoT 生成流程之上叠加一个连续潜变量推理路径
- 引入 Action-Routing Policy：路由器为每个 token 位输出二值动作（explicit / latent），由 PPO 风格的策略优化更新
- 用 KL 正则和熵约束稳定路由训练，避免坍缩到单一模式

**实验**
- 在 Qwen2.5 1.5B/3B/7B 和 Llama-3.1-8B 上评测
- 在 GSM8K、MATH、AIME 等推理基准上均优于纯显式 CoT 与纯隐式基线
- 消融显示 token 级路由显著优于句子级或步骤级路由

**结论**
Token 级别的显/隐推理切换是一条比端到端 latent CoT 更稳、比纯显式 CoT 更省的中间路线；证据表明模型能学到有意义的路由策略（数学推导多显式、常识过渡多隐式）。

---

## 2. ReasoningLens: Hierarchical Visualization and Diagnostic Auditing for Large Reasoning Models

**基本信息**
- 作者: Jun Zhang, Jiasheng Zheng, Boxi Cao, Yaojie Lu, Hongyu Lin, Jia Zheng, Xianpei Han, Le Sun
- 发布: 2026-06-22
- 会议/期刊: arXiv 预印本 (cs.CL, cs.AI)
- 引用数: 0 📈
- arXiv: [2606.23404](https://arxiv.org/abs/2606.23404)

**主要贡献**
面向长 CoT 推理模型的开源可视化与诊断工具。把冗长、扁平的推理链自动结构化为「高层策略—低层执行」的分层树，并用一个 agentic auditor 自动定位错误步骤，最终合成模型级的推理画像。

**方法**
- **Hierarchical Structuring**: 用一个较小的 LLM 把原始推理链切分为策略节点、子目标节点、执行节点，形成可折叠的交互式树
- **Agentic Auditor**: 多角色 agent（逻辑检查、算术检查、语义一致性）沿树遍历，标注错误、冗余、跳步
- **Reasoning Profile**: 聚合数百次审计结果，输出模型级失败模式统计（例如「DeepSeek-R1 在几何题上倾向重复自证」）

**实验**
- 在 GSM8K、MATH、GPQA、AIME 上审计 GPT-o1、DeepSeek-R1、QwQ 等模型
- 与人工标注一致率约 82%，显著优于纯 CoT 自检
- 案例研究揭示了「过度自我怀疑」「策略切换失败」等可复现失败模式

**结论**
把「一大团 CoT」转换成结构化对象后，长推理模型的可解释性和调试性显著提升；agentic auditor 是比 self-critic 更可靠的错误定位方法。

---

## 3. Characterize Then Distill: Mechanistic Reasoning in Large Output Spaces

**基本信息**
- 作者: Deb Roy, Byron C. Wallace, Javed A. Aslam
- 发布: 2026-06-05
- 会议/期刊: arXiv 预印本 (cs.CL, cs.AI, cs.LG)
- 引用数: 0 📈
- arXiv: [2606.06840](https://arxiv.org/abs/2606.06840)

**主要贡献**
针对候选空间巨大的多标签任务（如医学 ICD 编码、法条检索），首次系统刻画大型推理模型的两阶段行为——先粗粒度 shortlist、再细粒度 rerank——并利用这一机制提出比传统蒸馏更强的机制化蒸馏（mechanistic distillation）。

**方法**
- **Phase 1 特征化**: 通过 attention 归因和 chain-of-thought probing 定位「候选生成 phase」与「候选评分 phase」的边界
- **Mechanistic Distillation**: 训练两个专门的小模型分别学习 teacher 的 shortlist 分布与 rerank 分布，替代端到端 KL 蒸馏
- 在推理时以 shortlisting 小模型的输出作为 rerank 小模型的输入，形成 pipeline

**实验**
- 在医学编码（MIMIC-III ICD-10，输出空间约 9k 标签）和法律条款检索基准上评测
- teacher 为 DeepSeek-R1，学生为 Qwen2.5-1.5B
- 机制化蒸馏比 vanilla KD 提升 3–6 个 macro-F1 点，甚至逼近 teacher 表现

**结论**
在大输出空间任务上，推理其实等价于「search + score」两阶段；把这两阶段分开蒸馏比端到端蒸馏更有效——为「small reasoning models」提供了一条实用路径。

---

## 📊 今日观察

- 本期 3 篇论文共同的主题是**「拆开推理」**：TARPO 拆到 token 级切换显式/潜式；ReasoningLens 拆到策略/执行层次；Characterize Then Distill 拆到 shortlist/rerank 两阶段
- 大型推理模型（LRM）的研究重心正从「怎么让模型学会长 CoT」转向「怎么理解、审计、压缩长 CoT」
- 三篇论文均在 6 月上/下旬发布，暂无引用；建议 1–2 周后再看引用趋势
