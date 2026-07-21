# 📚 每日论文速递 - 2026-07-22

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高相关预印本
**论文数量**: 3

---

## 1. Uncovering Latent Reasoning Strategies in Language Models

**基本信息**
- 作者: Awni Altabaa, John Lafferty
- 发布: 2026-07-20
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.17674](https://arxiv.org/abs/2607.17674)

**主要贡献**
提出一种无监督方法，把推理模型的响应分布分解为多个隐式"策略"成分，揭示语言模型在推理任务中实际混合使用的潜在策略。

**方法**
学习一个 router + generator 的因子分解：router 将输入分配到离散的潜在策略码，generator 在给定策略码的条件下生成输出。为防止后验坍缩，引入以"相对基础模型的信息增益"为度量的变分目标，并优先重建 surprising tokens。

**实验**
在多策略算法任务上，该方法能恢复出与真实不同解题策略一一对应的策略码，同时保持原模型的响应分布不被破坏。

**结论**
推理模型的输出可以被显式分解为可解释的策略混合，为理解和控制模型"用哪种思路解题"提供了新工具。

---

## 2. Can We Break LLMs Out of Self-Loops? Fine-Grained Reasoning Control with Activation Steering

**基本信息**
- 作者: Sheldon Yu, Tong Yu, Xunyi Jiang, Rohan Surana, Gagan Mundada, Sungchul Kim, Lina Yao, Julian McAuley, Junda Wu
- 发布: 2026-07-20
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.18100](https://arxiv.org/abs/2607.18100)

**主要贡献**
指出长推理模型的一类典型失败模式——陷入自循环（self-loop）反复咀嚼同一状态直到耗尽 token 预算，并提出 SOPHIA 框架在推理时对其进行细粒度干预。

**方法**
将推理轨迹建模为潜在状态序列；用按"状态对"索引的 activation steering 向量在推理时干预：先将当前前缀分类到潜在状态，在线检测自循环，一旦检测到即注入对应的转移向量把模型"推"出循环。

**实验**
在推理基准上同时提升任务准确率和 token 效率，展示了对推理过程的细粒度可控性。

**结论**
推理轨迹的失败模式可以在激活空间被在线检测和纠正，activation steering 是控制长推理行为的一条轻量级路径。

---

## 3. Debate-on-Graph: Reliable and Adaptive Reasoning of Large Language Model on Uncertain Knowledge Graph

**基本信息**
- 作者: Peiji Yu, Xin Chen, Tianxing Wu
- 发布: 2026-07-19
- 会议/期刊: ECML-PKDD 2026 (CORE-A)
- 引用数: 0 📈
- arXiv: [2607.17266](https://arxiv.org/abs/2607.17266)

**主要贡献**
提出 Debate-on-Graph 框架，让 LLM 与不确定知识图谱（UKG）自适应协作，以缓解 QA 中的幻觉与知识盲区。（venue 已按 playbook 经 /abs 页 comments "Accepted by ECML-PKDD 2026" 确认）

**方法**
结合启发式搜索算法在不确定知识图谱上检索候选证据路径，再用多智能体辩论机制对不确定证据进行可靠性仲裁，使 LLM 按需决定信任内部知识还是图谱证据。

**实验**
在四个 QA 基准上验证，性能超越现有 KG 增强推理方法。

**结论**
显式建模知识图谱的不确定性并用辩论机制仲裁，能让 LLM 在不完美外部知识下实现更可靠的推理。

---

## 📊 今日统计

| # | 论文 | venue | 引用 |
|---|------|-------|-----|
| 1 | Uncovering Latent Reasoning Strategies | arXiv (preprint) | 0 |
| 2 | SOPHIA: Self-Loop Activation Steering | arXiv (preprint) | 0 |
| 3 | Debate-on-Graph | ECML-PKDD 2026 (CORE-A) | 0 |

**引用追踪**: 今日同时补录昨夜 429 未取回的 4 篇存量论文引用数（2607.07674 / 2607.12490 / 2607.07976 / 2607.09600，均为 0，标记日期 2026-07-22），全库 133 篇论文的 2026-07-22 引用记录齐整。
