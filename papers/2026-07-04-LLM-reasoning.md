# 📚 每日论文速递 - 2026-07-04

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含预印本
**论文数量**: 3

---

## 1. ReContext: Recursive Evidence Replay as LLM Harness for Long-Context Reasoning

**基本信息**
- 作者: Yanjun Zhao, Ruizhong Qiu, Tianxin Wei, Yuanchen Bei, Zhining Liu, Lingjie Chen, Ismini Lourentzou, Hanghang Tong, Jingrui He
- 发布: 2026-07-02
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.02509](https://arxiv.org/abs/2607.02509)

**主要贡献**
提出 ReContext——一种免训练（training-free）的推理方法，解决 LLM 虽然支持超长上下文窗口、却经常无法有效利用输入中已有相关证据的问题。方法完全依赖模型内部信号，不需要外部检索系统或参数更新。

**方法**
将上下文视为可检索的记忆、问题视为检索线索、注意力机制视为联想痕迹（associative traces）。利用模型内部的相关性信号构建 query-specific 证据池，通过递归选择（recursive selection）将证据组织与答案生成分离，同时保留完整原始上下文。理论上以联想记忆（associative memory）框架进行了分析。

**实验**
在 8 个长上下文数据集（上下文长度 128K tokens）上，使用 Qwen3-4B、Qwen3-8B、Llama3-8B 三个骨干模型进行评测。

**结论**
ReContext 在所有测试模型上都取得一致提升，平均排名最优。免训练、仅依赖模型内部能力的特性使其无需额外基础设施即可广泛应用。

---

## 2. Testing Frontier Large Language Models' Physics Literacy in Parallel Physical Worlds

**基本信息**
- 作者: Dong Zhang
- 发布: 2026-06-30
- 会议/期刊: arXiv 2026 (preprint, 37 页)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.00276](https://arxiv.org/abs/2607.00276)

**主要贡献**
提出一个可审计（auditable）的四阶段诊断框架——归纳（induction）、形式化（formulation）、预测（prediction）、复查（review）——检验前沿 LLM 能否在**陌生物理框架**内推理，超越传统的基于准确率的基准测试。

**方法**
构建三个"平行物理世界"：反事实世界（F=mv）、亚里士多德力学世界、"衰变世界"（Decay World）。结合锁定的预注册（locked pre-registrations）、双 LLM 评判和人工审计通道，对 Claude Opus 4.7、GPT-5.5、Gemini 3.1 Pro 三个前沿模型进行评测。

**实验**
三个模型的综合 PASS 率分别仅为 6/15、6/15、0/15。模型表现出强的方向性推理能力，但在定量预测中频繁"回退"到标准物理关系式；LLM 评判在不同框架间不可靠；模型自我复查能力弱——至少 2/3 的试次中错误地报告"此前无错误"。

**结论**
前沿 LLM 尚不能在陌生规则体系内进行可靠的定量推理，暴露出对训练分布中标准物理知识的强依赖。该工作为诊断 LLM 推理失败模式提供了严格方法论。

---

## 3. MemSyco-Bench: Benchmarking Sycophancy in Agent Memory

**基本信息**
- 作者: Zhishang Xiang, Zerui Chen, Yunbo Tang, Zhimin Wei, Ruqin Ning, Yujie Lin, Qinggang Zhang, Jinsong Su
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.01071](https://arxiv.org/abs/2607.01071)

**主要贡献**
提出 MemSyco-Bench，首个系统评测**智能体记忆引发的谄媚（sycophancy）**如何损害下游推理的基准。现有记忆基准只关注存储和检索，该工作聚焦被检索记忆对客观推理和事实准确性的影响。

**方法**
设计五个评测任务，检验智能体能否：(1) 拒绝缺乏事实依据的记忆；(2) 遵守记忆的适用范围限制；(3) 在记忆与客观数据冲突时以数据为准；(4) 追踪记忆的修改历史；(5) 利用有效记忆进行个性化。

**实验**
在不同记忆影响场景下构建系统性测试条件，评估智能体在"记忆应该/不应该影响决策"边界上的行为。

**结论**
记忆系统需要防止对齐偏差（alignment bias）的安全机制，才能在保留个性化协作收益的同时避免过度迎合用户、牺牲客观推理。为负责任的智能体记忆部署建立了评测标准。

---

*注: 三篇论文均为最近 1-4 天发布的新预印本，Semantic Scholar 引用数暂记为 0，将在后续 `--update` 中刷新。*
