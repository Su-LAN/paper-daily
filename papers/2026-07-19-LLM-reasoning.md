# 📚 每日论文速递 - 2026-07-19

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高质量预印本
**论文数量**: 3

---

## 1. Answer-Conditioned Chains of Thought Degrade Verifiable-Reasoning Distillation in Large Language Models

**基本信息**
- 作者: Jungseob Lee, Seungyoon Lee, Suhyune Son, Dongyub Jude Lee, Sungbin Han, Sugyeong Eo, Heuiseok Lim
- 发布: 2026-07-16
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.14552](https://arxiv.org/abs/2607.14552)

**主要贡献**
揭示了推理蒸馏流水线中一个隐蔽的数据质量陷阱：当采样失败后向生成器展示标准答案（answer-conditioning）并要求其写出通向该答案的思维链时，即使经过正确性过滤，训练数据仍会被系统性污染——这种损害是正确性过滤完全无法检测的。

**方法**
设计受控实验，固定生成器、题目集和正确性过滤器，仅改变思维链是否在"已见到金标答案"的条件下生成。通过分析链内的"过早给出最终答案"现象作为可测量症状，定位污染机制为从答案向后合理化（rationalize backward）而非正向推导。并用 prompt 消融将损害定位到"向该答案合理化"的指令本身，而非答案的单纯可见性。

**实验**
在强指令微调推理模型上，用其自身的 answer-conditioned 思维链训练会显著降低可验证推理准确率，且损失随难度增大，在最难的竞赛级题目上达到约 27 个百分点。该损害可在微调前从无标注生成中直接读出，在来自 4 个家族的 8 个 thinking 模型上给出一致的损害排序，并可跨教师家族迁移。

**结论**
损害是数据本身的属性而非生成器的属性；实践建议是蒸馏数据必须"answer-blind"生成，因为任何正确性过滤器都看不见这种数据损伤。

---

## 2. OS-Pruner: Pruning Chains-of-Thought of Reasoning Models via Optimal Stopping

**基本信息**
- 作者: Mohammed Ehab, Aymane El Gadarri, Vivek F. Farias, Adam Jozefiak, Ciamac C. Moallemi
- 发布: 2026-07-13
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.11089](https://arxiv.org/abs/2607.11089)

**主要贡献**
首次将思维链剪枝形式化为最优停止（optimal stopping）问题，提出轻量级即插即用框架 OS-Pruner，解决推理模型"计算过度思考"（生成冗余推理步骤徒增延迟与成本）的问题，避免了现有方法依赖静态思考预算、启发式过滤、次优早退分类器或昂贵重训练的缺陷。

**方法**
给定一个推理前缀，OS-Pruner 学习判断继续推理是否值得其 token 成本：优化一个显式效用函数，在最终答案准确率与生成长度之间进行权衡，从而动态评估推理链的充分终止点。框架在训练和推理阶段都保持轻量，并为用户提供推理开销 vs 准确率的细粒度控制旋钮。

**实验**
在多样的推理 benchmark 和多个基座模型上，OS-Pruner 实现 20-60% 的生成长度削减，准确率损失极小。

**结论**
把"何时停止思考"建模为带 token 成本的最优停止问题，是比静态预算和启发式早退更有原则性且实用的推理效率方案。

---

## 3. Valid ≠ Necessary: Diagnosing Latent Inefficiency in Chain-of-Thought

**基本信息**
- 作者: Daeyeop Lee, Hwanjo Yu
- 发布: 2026-07-13
- 会议/期刊: arXiv 预印本（Semantic Scholar 标注 venue 为 ACL，但 arXiv 页面无接收说明，暂按预印本记录）
- 引用数: 0 📈
- arXiv: [2607.11266](https://arxiv.org/abs/2607.11266)

**主要贡献**
指出现有推理步骤评估器的关键盲区：它们能检测逻辑谬误和事实错误，却不惩罚"有效但不必要"的推理步骤——这些步骤徒增 token 消耗而对解题无贡献。提出诊断基准 RIV-GSM8K、免训练度量 CAID 和压缩策略 PACE 来系统性刻画并解决这一问题。

**方法**
RIV-GSM8K 注入 5 类典型低效（如循环推理、过度分解）用于诊断；CAID（Context-Aware Information Density）基于信息论、免训练地识别低效用步骤；PACE 作为事后压缩策略应用 CAID 删除"信息泡沫"步骤。

**实验**
诊断实验显示 SOTA 评估器难以区分低效步骤与必要推理。在 GSM8K、StrategyQA、ARC-Challenge 上，PACE 削减 31-53% token 消耗且保持准确率；对照实验表明其增益无法用平凡剪枝解释——相比随机删步和基于 PRM 的压缩基线，PACE 在明显更高的压缩率下仍保持准确率。

**结论**
"逻辑有效"不等于"推理必要"；用信息密度度量可以在不损害演绎有效性的前提下，从推理链中蒸掉信息泡沫。

---

## 📌 今日观察

三篇论文共同指向 CoT 的"质量与效率"主线：2607.14552 警告蒸馏数据生成方式会隐性污染推理能力（正确性过滤不可见），而 2607.11089 与 2607.11266 分别从最优停止和信息密度两个角度攻击过度思考问题（20-60% 与 31-53% 的 token 削减），显示推理效率已成为独立且快速收敛的研究方向。
