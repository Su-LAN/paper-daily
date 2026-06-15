# 📚 每日论文速递 - 2026-06-15

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. Operadic Consistency: A Label-Free Signal for Compositional Reasoning Failures in LLMs

**基本信息**
- 作者: Nathaniel Bottman, Yinhong Liu, Kyle Richardson
- 发布: 2026-06-11
- 会议/期刊: arXiv (preprint, cs.CL/cs.LG)
- 引用数: 1 📈
- arXiv: [2606.13649](https://arxiv.org/abs/2606.13649)

**主要贡献**
提出 **Operadic Consistency (OC)**——一种无需标签的信号，用于在多跳/组合推理任务中检测 LLM 推理失败。OC 利用 operad 理论：模型对一个组合问题的直接答案，应当与它将"分解 + 重组"得到的答案保持一致；当二者不一致时，即是组合推理失败的明确信号。

**方法**
- 形式化：将组合问题视作 operad，将 LLM 行为视作 operad 之间的（潜在不诚实的）态射；
- 度量：对每个问题构造分解树，比较直接回答与分解-合成回答之间的一致性；
- 实现：分解可由模型自身（CoT/Thinking 模式）给出，也可外部注入。

**实验**
- 12 个 instruction-tuned 模型 × 4 个 multi-hop QA 数据集；
- OC 与准确率的 Pearson 相关系数 0.86–0.94；
- OC 是唯一在所有数据集上 r ≥ 0.85 的信号，在 MuSiQue、StrategyQA 上**超过 CoT self-consistency**；
- 在等价开销预算下，selective prediction 优于调好的基线。

**结论**
组合推理失败可以通过纯结构性的"分解-合成一致性"检测，无需 ground truth。OC 为评测前沿 thinking 模型的内部推理是否真的"合得上"提供了一种廉价、可移植的诊断工具。

---

## 2. The Self-Correction Illusion: LLMs Correct Others but Not Themselves

**基本信息**
- 作者: Kuan-Yen Chen, Fang-Yi Su, Jung-Hsien Chiang
- 发布: 2026-06-04
- 会议/期刊: arXiv (preprint, cs.AI/cs.CL)
- 引用数: 0 📈
- arXiv: [2606.05976](https://arxiv.org/abs/2606.05976)

**主要贡献**
揭示 LLM "自我纠错失败" 的真实成因——不是认知/推理能力的本质缺陷，而是 **chat-template 工件**。仅仅把同样的错误文本换一个"角色标签"，模型就能纠正它。

**方法**
- 保持错误内容完全相同，**只改变角色标签**：将其分别置于 internal thought / user message / tool response / system memory 中；
- 比较模型在这些设置下的纠错率；
- 提出一个**纯 prompt 级的干预**：在不微调模型的前提下，通过结构化提示让模型把"自己之前的想法"当作"外部来源"处理。

**实验**
- 把同一错误声明从 internal thought 改写为外部角色后，纠错率提升 **23–93 个百分点**；
- 干预后无需训练即可显著缓解自我纠错失效。

**结论**
LLM 自我纠错的"无能"很大程度上是对话模板带来的偏置，而非模型推理能力的缺陷。这一发现意味着 self-refine / self-critique 流水线可以用极低成本（仅 prompt 结构改造）获得显著提升。

---

## 3. The Periodic Table of LLM Reasoning: A Structured Survey of Reasoning Paradigms, Methods, and Failure Modes

**基本信息**
- 作者: Avinash Anand, Mahisha Ramesh, Avni Mittal, Ashutosh Kumar, Erik Cambria, Zhengkui Wang, Timothy Liu, Aik Beng Ng, Simon See, Rajiv Ratn Shah
- 发布: 2026-06-09
- 会议/期刊: arXiv (preprint, cs.CL)
- 引用数: 0 📈
- arXiv: [2606.11470](https://arxiv.org/abs/2606.11470)

**主要贡献**
对 300+ 篇近年 LLM 推理论文进行**类似"元素周期表"的结构化分类**：把 9 大推理范式（CoT、数学推理、代码推理、归纳/演绎/abductive、常识、社会推理等）按机制和适用场景组织，形成统一坐标系。

**方法**
- 分类轴：推理范式 × 方法家族（prompting、模型结构、训练目标）× 失败模式；
- 系统化梳理 prompting 方法、模型架构、训练目标之间的趋势与冲突；
- 将幻觉、弱因果抽象、过度自信等失败模式归并到统一谱系。

**实验**
- 综述文章，无新实验，但提供大量横向对比的总结表与趋势分析；
- 指出 meta-reasoning 与多模态推理为下一波研究高地。

**结论**
作为一份"地图式"综述，本文给所有进入 LLM 推理领域的研究者提供了清晰的范式坐标和失败模式索引。**适合作为 related work 检索的起点**，尤其是在涉及多种推理范式融合（CoT × 数学 × 多模态）的工作中。

---

**Source 链接**
- [Operadic Consistency](https://arxiv.org/abs/2606.13649)
- [The Self-Correction Illusion](https://arxiv.org/abs/2606.05976)
- [The Periodic Table of LLM Reasoning](https://arxiv.org/abs/2606.11470)
