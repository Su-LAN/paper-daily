# 📚 每日论文速递 - 2026-07-27

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高质量预印本
**论文数量**: 3

> 注：arXiv 周末不发布新论文（07-25/26 为周六/周日），本期论文均为 2026-07-22/23 公布、此前未收录的最新工作。

---

## 1. PoTRE: Test-Time Reasoning inspired by Cognitive Heterogeneity

**基本信息**
- 作者: Anmol Kankariya, Sercan Ö. Arık
- 发布: 2026-07-22
- 会议/期刊: TMLR 2026（/abs 页 Comments 确认 "Accepted at Transactions on Machine Learning Research"）
- 引用数: 0 📈（新发布）
- arXiv: [2607.20268](https://arxiv.org/abs/2607.20268)

**主要贡献**
提出 PoTRE（Poly-Topological Reasoning Ensembles），一种异构测试时推理框架：不再依赖单流 prompting 或同构的重复采样，而是将推理解耦为四个拓扑结构不同的智能体，并用任务自适应聚合层动态融合，在 Humanity's Last Exam 上取得 49.92% 的 SOTA 准确率。

**方法**
四个异构推理智能体并行工作：(1) 对抗精炼智能体（自我攻击修正）、(2) 分层战略规划智能体（长程规划）、(3) 谱系搜索智能体（多假设探索）、(4) 直接链式智能体（快速直觉）。最终由任务自适应聚合层在候选选择、语义合成、神经符号验证三种模式间动态选择，产出全局解。

**实验**
在 ARC-AGI-2、Humanity's Last Exam (HLE)、PRBench Finance 三个前沿基准上评测。HLE 达到 49.92%，超过此前最好官方成绩；且相比重度扩展的同构 baseline（如大规模 self-consistency），达到更高推理性能的同时消耗相近或更少的推理 token。

**结论**
推理时集成的"架构异构性"本身是性能来源——不同认知拓扑的智能体互补覆盖不同错误模式，比单纯堆算力的同构扩展更高效，为 test-time compute 的结构化配置提供了新方向。

---

## 2. FlowEdit: Information-Theoretic Control of LLM Reasoning Flows for Ill-posed Problems Involving Conflicts

**基本信息**
- 作者: Sizhe Tang, Guangyu Jiang, Yu Li, Rongqian Chen, Ioannis G. Kevrekidis, Tian Lan
- 发布: 2026-06-20 提交，2026-07 下旬公布
- 会议/期刊: arXiv preprint
- 引用数: 0 📈（新发布）
- arXiv: [2607.20500](https://arxiv.org/abs/2607.20500)

**主要贡献**
针对"不适定问题"（条件矛盾、要求互斥、无唯一有效答案）的 LLM 推理提出 FlowEdit：用信息论原理量化并调控模型内部推理流，使模型能显式暴露隐藏冲突、维持多条竞争假设分支，并在单次生成中给出全套备选答案。

**方法**
将分支感知推理形式化为两个对偶的信息论目标：最大化"所选假设 → 分支结论"的信息流，同时最小化兄弟分支间的重叠与条件依赖。在边界 embedding 满足 ε-充分性的条件下，通过可计算的变分界优化推理过程中的条件互信息，直接干预模型内部表征。

**实验**
在冲突/不适定问题基准上，exact-set-match 准确率相比领先闭源模型提升 68%，答案信息量提升 24%。进一步发现流调控在 token 流上表现为 next-token 熵的重新分布：分支内部熵集中、流边界处熵放大，且随问题所需分支数扩展。

**结论**
next-token 预测机制天然不擅长维持多假设推理；对内部推理表征做信息论层面的显式调控，可以让 LLM 在一次前向生成中系统性覆盖所有有效假设，为开放世界中的冲突感知推理提供了原理性框架。

---

## 3. Token Budget Saturation and Mechanistic Early Detection of Reasoning Non-Convergence in Chain-of-Thought Models

**基本信息**
- 作者: Renuka Oladri, Niveda Jawahar, Abdirisak Mohamed
- 发布: 2026-07-23
- 会议/期刊: arXiv preprint
- 引用数: 0 📈（新发布）
- arXiv: [2607.21433](https://arxiv.org/abs/2607.21433)

**主要贡献**
系统刻画推理模型的"双峰收敛"现象：生成要么在 token 预算内收敛（AIME 上准确率 90.3%），要么耗尽预算不收敛（准确率仅 6.6%）；并证明收敛与否可以在思维链早期从内部表征中部分预测出来。

**方法**
以 DeepSeek-R1-Distill-Qwen-7B 为对象，在 AIME 1983-2024 上统计收敛率（62.0%）。在思维链第 50-300 个 token 位置的隐状态激活上训练线性探针，与基于 token 熵、重复统计的行为学 baseline 对比。

**实验**
第 20 层、第 150 个 token 处的激活探针达到 AUC 0.608（±0.080，5 折交叉验证），在第 50 个 token 处即显著高于随机水平；激活探针一致优于行为学 baseline。sweep 级置换检验 p=0.063（10 万次置换），信号存在但幅度有限，样本量不足以在常规阈值下确认。

**结论**
推理"收敛命运"在生成结束前很早就部分编码于中间表征中——这为 early-exit 推理和自适应算力分配开辟了路径：检测到大概率不收敛时可提前终止或切换策略，避免浪费整个 token 预算。结果统计上偏弱（p=0.063），需更大样本验证。

---

## 📎 备注

- 三篇论文均为一周内新发布，Semantic Scholar 引用数均为 0，已加入引用追踪，后续 `--update` 会持续刷新。
- PoTRE 的 TMLR 2026 接收信息经 arXiv /abs 页 Comments 字段逐字核实。
