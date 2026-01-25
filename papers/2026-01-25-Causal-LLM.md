# 📚 每日论文速递 - 2026-01-25

**研究方向**: Causal LLM
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)
**论文数量**: 3

---

## 1. Unveiling Causal Reasoning in Large Language Models: Reality or Mirage?

**基本信息**
- 作者: Haoang Chi, He Li, Wenjing Yang, Feng Liu, Long Lan, Xiaoguang Ren, Tongliang Liu, Bo Han
- 发布: 2025-06-26
- 会议/期刊: NeurIPS 2025 (CCF-A)
- 引用数: 54 📈
- arXiv: [2506.21215](https://arxiv.org/abs/2506.21215)

**主要贡献**
本文深入研究了LLM是否具备真正的因果推理能力。作者提出LLM目前仅能执行"浅层(level-1)因果推理"，主要依赖参数中的因果知识，而非真正的人类级别推理能力。

**方法**
- 分析了transformer自回归机制与因果推理的关系
- 提出CausalProbe-2024基准测试，使用全新数据避免数据泄露
- 开发G²-Reasoner方法，整合通用知识和目标导向指导

**实验**
通过多个基准测试验证，发现当前LLM在因果推理任务上表现有限，主要依赖训练数据中的因果模式而非真正理解因果关系。

**结论**
LLM的因果推理能力仍停留在浅层水平，需要新的方法（如G²-Reasoner）来推动LLM向真正的因果推理发展。

---

## 2. Large Language Models and Causal Inference in Collaboration: A Survey

**基本信息**
- 作者: Xiaoyu Liu, Paiheng Xu, Junda Wu, Jiaxin Yuan, Yifan Yang, Yuhang Zhou, Fuxiao Liu, Tianrui Guan, Haoliang Wang, Tong Yu, Julian J. McAuley, Wei Ai, Furong Huang
- 发布: 2024-03-14
- 会议/期刊: arXiv (综合性Survey)
- 引用数: 28 📈
- arXiv: [2403.09606](https://arxiv.org/abs/2403.09606)

**主要贡献**
本综述从因果视角全面审视LLM，探讨因果推理如何增强NLP模型的预测准确性、公平性、鲁棒性和可解释性。

**方法**
从四个维度分析LLM与因果推理的交叉：
1. 理解和提升LLM推理能力
2. 解决LLM的公平性和安全问题
3. 为LLM补充解释性
4. 处理多模态场景

**实验**
综述了大量相关工作，分析了LLM在因果发现和因果效应估计中的应用。

**结论**
LLM的推理能力可以支持因果发现和效应估计，两个领域的协同发展有助于构建更复杂的AI系统。

---

## 3. Causal Inference with Large Language Model: A Survey

**基本信息**
- 作者: Jing Ma
- 发布: 2024-09-15
- 会议/期刊: NAACL (CCF-A)
- 引用数: 23 📈
- arXiv: [2409.09822](https://arxiv.org/abs/2409.09822)

**主要贡献**
本综述探讨如何将LLM应用于医学、经济学等多个领域的因果推理任务，总结了NLP技术在传统因果任务中的机遇。

**方法**
- 梳理因果推理的关键问题
- 分析LLM在因果推理中的应用方法
- 评估现有方法的效果

**实验**
汇总了多个领域的评估结果，展示LLM在不同因果任务上的表现。

**结论**
LLM为因果推理带来新的可能性，但仍需要更多研究来完善LLM与因果方法论的结合。

---

## 其他值得关注的论文

| 论文 | 会议 | 引用 | 特点 |
|------|------|------|------|
| [Large Language Models for Causal Discovery](https://arxiv.org/abs/2402.11068) | IJCAI 2024 | 14 | 因果发现三维度分析 |
| [Failure Modes of LLMs for Causal Reasoning](https://arxiv.org/abs/2410.23884) | arXiv | 8 | 揭示LLM因果推理的失败模式 |
| [Counterfactual Causal Inference in NL](https://arxiv.org/abs/2410.06392) | arXiv | 7 | 反事实推理方法 |
| [Causal Reflection with Language Models](https://arxiv.org/abs/2508.04495) | arXiv | 1 | 动态因果建模框架 |

---

*生成时间: 2026-01-25*
