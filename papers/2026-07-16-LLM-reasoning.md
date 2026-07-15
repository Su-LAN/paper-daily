# 📚 每日论文速递 - 2026-07-16

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高相关预印本
**论文数量**: 3

---

## 1. LLMs Can See the Smoke but not the Fire: Evaluating Abductive Reasoning with Elenchos

**基本信息**
- 作者: Julius Steiglechner, Lucas Mahler, Gabriele Lohmann
- 发布: 2026-07-14
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.12733](https://arxiv.org/abs/2607.12733)

**主要贡献**
提出 Elenchos 评测框架，系统性测量 LLM 的溯因推理（abductive reasoning）能力——即从观察到的行为反推隐藏解释的能力。核心发现被概括为"看得见烟，看不见火"：模型往往能察觉系统被改动了，却难以定位造成偏差的潜在变异。

**方法**
以 lambda 演算等形式系统为载体，对系统规则注入受控的故意变异（mutation），然后要求模型完成两级任务：(1) 检测系统是否被改动；(2) 识别导致观察差异的具体规则变化。形式系统的可控性保证了变异真值明确、可自动判分。

**实验**
模型在"检测有无改动"上表现尚可，但在"识别具体变异"上显著吃力；当多个变异相互作用时性能大幅下降；增加推理计算资源（更多测试时算力）只带来边际提升。

**结论**
当前 LLM 的溯因推理存在系统性短板：能感知异常却难以归因。多变异交互场景暴露了模型缺乏真正的假设生成与检验能力，仅靠扩大测试时算力无法弥补。

---

## 2. When is LLM-Based Program Reasoning Correct? A Completion Semantics for LLM-Based Code Inference

**基本信息**
- 作者: Zhiyuan Liu, Yihe Li, Trevor E. Carlson, Huiyan Wang, Ruijie Meng, Gregory J. Duck
- 发布: 2026-07-14
- 会议/期刊: arXiv 2026 (preprint, 28 pages)
- 引用数: 0 📈
- arXiv: [2607.12490](https://arxiv.org/abs/2607.12490)

**主要贡献**
首次为"LLM 对不完整代码片段的推理"给出形式化正确性标准——补全语义（completion semantics）：把不完整程序视为其所有可能补全（refinement）的集合，当且仅当存在一个补全能见证（witness）所推断的 bug 时，该推理才算正确。

**方法**
LLM 受 token 和认知约束，分析代码时必然对缺失上下文做隐式假设。补全语义将这些假设显式化：不完整程序 denote 一族可能的程序补全。作者进一步构建了见证生成（witness-generation）工作流，自动构造可执行的程序补全，用运行结果验证 LLM 的推理是否有补全支撑。

**实验**
在真实世界 bug 报告上评估，该方法能有效区分"合理的推断"（存在现实补全见证）与"依赖不切实际假设的推断"，为 LLM 代码分析结果提供了可执行的可信度过滤。

**结论**
补全语义为 LLM 程序推理提供了严格的语义基础，使"LLM 说这里有 bug"从主观判断变为可验证命题，对基于 LLM 的静态分析与自动化代码审查具有基础性意义。

---

## 3. TreeThink: A Modular Tree Search Library for Mathematical Reasoning with LLMs

**基本信息**
- 作者: Burak S. Akbudak, Zeynel A. Uluşan, Can S. Erer, Gözde Gül Şahin
- 发布: 2026-07-13
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.11258](https://arxiv.org/abs/2607.11258)

**主要贡献**
发布 TreeThink——一个模块化 Python 开源库（MIT 协议），将树搜索方法、vLLM 推理与多种评估技术组合，用于神经定理证明与数学推理中证明空间的系统性探索。

**方法**
库设计强调模块化：搜索策略、推理后端与评估器解耦，可自由组合。同时支持 Lean 4、Rocq、Isabelle/HOL 三种形式验证系统（通过 REPL 服务器对接）以及自然语言推理；异步执行架构使搜索与 LLM 推理流水线化。

**实验**
在 miniF2F 与 MATH500 数据集上验证，异步执行相比同步基线取得最高 6.3 倍的 wall-clock 加速；展示了跨形式系统与自然语言场景的通用性。

**结论**
TreeThink 为"树搜索 + LLM"这一测试时扩展主流范式提供了可复用的开源基础设施，降低了形式化数学推理研究的工程门槛。

---
