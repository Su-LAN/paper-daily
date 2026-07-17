# 📚 每日论文速递 - 2026-07-17

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高相关预印本
**论文数量**: 3

---

## 1. ProgramTab: Boosting Table Reasoning of LLMs via Programmatic Paradigm

**基本信息**
- 作者: Pei Guo, Enjie Liu, Yunzhi Tan, Mochi Gao, Jianxin Zhang, Ruichao Zhong, Juntao Li, Bo Hu, Zang Li
- 发布: 2026-07-13
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.11207](https://arxiv.org/abs/2607.11207)

**主要贡献**
提出 ProgramTab 框架，用"程序化范式"解决 LLM 处理大表格时的性能退化问题。不同于单纯的 text-to-SQL 方法（难以应对非结构化网页表格），ProgramTab 把表格推理拆解为可编程的多阶段流水线，兼顾结构化与非结构化表格数据。

**方法**
基于 in-context learning 的三阶段流程：(1) 生成 Python 代码对表格数据做预处理与规范化；(2) 通过行/列选择抽取与问题相关的关键内容，压缩超长输入；(3) 生成 SQL 查询完成结构化信息抽取与最终推理。程序化中间步骤使每一步可执行、可验证。

**实验**
在多个表格推理基准上评估，ProgramTab 超过所有 LLM-based 基线，尤其在长表格输入与非结构化数据场景下显著缓解了传统方法的性能退化。

**结论**
将编程式预处理与 SQL 结构化操作结合，是让 LLM 稳健处理复杂表格推理的有效路径，为表格问答与数据分析类应用提供了实用框架。

---

## 2. Silent Failures in Quantized LLM Reasoning: A Taxonomy-Based Analysis of Hollow Convergence and Failure Mode Shifts

**基本信息**
- 作者: Renuka Oladri, Mohan Vamsi Varadaraju Priya, Jerry Wu
- 发布: 2026-07-10
- 会议/期刊: arXiv 2026 (preprint, 7 pages)
- 引用数: 0 📈
- arXiv: [2607.09999](https://arxiv.org/abs/2607.09999)

**主要贡献**
揭示量化压缩会在准确率几乎不变的情况下"悄悄"改变 LLM 的推理模式。提出并命名 Hollow Convergence（空心收敛）现象——模型给出正确答案，但推理链不完整或不可验证；并证明表层文本特征无法可靠检测该失败模式（F1 = 0.53）。

**方法**
构建含六类失败模式的人工验证分类体系（Cohen's κ = 0.906），对 5 个指令微调模型（3B–14B）在 FP32 / FP16 / NF4 三种精度、4 个基准上产生的 30,000 条 chain-of-thought 回复做系统性推理级分析，对比精度与规模变化下的失败模式分布。

**实验**
准确率最大仅下降 3.1 个百分点，但 NF4 量化下失败模式分布剧烈迁移：小模型受影响显著，12B+ 模型基本稳定；基准间差异明显——GSM8K 几乎免疫，LogiQA 与 ARC-Challenge 高度敏感。

**结论**
标准准确率指标掩盖了量化引入的推理级退化。部署量化模型前需要超越传统指标的推理链级评估，否则关键失败模式对常规评测完全不可见。

---

## 3. Agora: Enhancing LLM Agent Reasoning Via Auction-Based Task Allocation

**基本信息**
- 作者: Kaiji Zhou, Ales Leonardis, Yue Feng
- 发布: 2026-07-10
- 会议/期刊: arXiv 2026 (preprint, 12 pages)
- 引用数: 0 📈
- arXiv: [2607.09600](https://arxiv.org/abs/2607.09600)

**主要贡献**
提出 Agora 框架，用拍卖机制为 LLM agent 的推理步骤分配专家模型与工具。针对现有框架只按"功能粗匹配"调用 API、忽视同类工具间性能差异与成本效率的问题，引入激励相容的市场化任务分配。

**方法**
将推理步骤视为可交易物品，各专家模型基于真实胜任度（而非表面置信度）出价竞标，确保关键逻辑被路由到最有能力的求解器而非最过度自信的那个。整个成本-质量权衡由单一拍卖参数控制，可灵活调节资源开销。

**实验**
在五个基准上与单模型、路由（routing）和级联（cascade）基线对比，Agora 取得一致的性能提升，同时通过拍卖参数实现可控的成本-质量权衡曲线。

**结论**
拍卖机制为多专家 LLM agent 编排提供了兼顾能力与成本的原则性方案，"按胜任度竞标"比"按功能匹配"更能把对的任务交给对的模型。

---
