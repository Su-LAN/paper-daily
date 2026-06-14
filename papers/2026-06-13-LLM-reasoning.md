# 📚 每日论文速递 - 2026-06-13

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. How Does Reasoning Flow? Tracing Attention-Induced Information Flow for Targeted RL in LLMs

**基本信息**
- 作者: Zhichen Dong, Yang Li, Yuhan Sun, Weixun Wang, Yijia Luo, Zinian Peng, Taiheng Ye, Chao Yang, Wenbo Su, Yu Cheng, Bo Zheng, Junchi Yan
- 发布: 2026-06-09
- 会议/期刊: ICML 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2606.10646](https://arxiv.org/abs/2606.10646)

**主要贡献**
提出 FlowTracer 框架，解决 RL 训练 LLM 推理时的 token 级信用分配问题。传统 RLVR 对所有 token 一视同仁，忽略了真正承载推理的关键步骤；FlowTracer 将注意力诱导的信息流建模为有向无环图（token 为节点、注意力权重为边容量），追踪"指向答案的推理流"。

**方法**
在 attention-induced DAG 上重新加权边，以隔离最终到达答案区域的信息影响，同时保持局部流量守恒。由此识别出"高影响枢纽 (high-impact hubs)"与"聚合检查点 (aggregation checkpoints)"，提取连接问题与答案的信息流主干 (backbone)，并按吞吐重要性给 token 打分，将其转化为更精确的 token 级奖励。

**实验**
在多个推理任务上将 FlowTracer 的 token 级奖励接入 RL 训练，相比统一对待全部 token 的基线获得一致提升，学习信号集中于真正向正确答案路由信息的 token。

**结论**
注意力信息流为推理过程提供了可操作的结构化信号；基于流量主干的针对性奖励能显著改善 RL 后训练的信用分配，是 RLVR 精细化的有效路径。

---

## 2. Using Probabilistic Programs to Train Inductive Reasoning in Large Language Models

**基本信息**
- 作者: Liyi Zhang, Akshay K. Jagadish, Brenden M. Lake, Thomas L. Griffiths
- 发布: 2026-05-26
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2606.09856](https://arxiv.org/abs/2606.09856)

**主要贡献**
提出 Program-based Posterior Training (PPT)：用概率程序生成训练目标来微调 LLM 的归纳推理能力——即从有限、模糊的观测中推断不确定信念的能力。来自 Griffiths（Princeton）与 Lake（NYU）团队的认知科学视角工作。

**方法**
先用 LLM 生成多样化的开放世界情境并表示为概率程序，再通过概率推断计算后验分布，作为分布式软标签（而非硬标签）微调模型，使其输出对齐贝叶斯后验。

**实验**
基于 10,000 个程序化生成的情境训练，在留出任务变体、人工标注评测和外部基准上评估：PPT 显著提高归纳估计准确性，更贴合人类判断，并能迁移到外部基准；校准提升在温度缩放之外依然存在。

**结论**
概率程序提供了可规模化的归纳推理监督信号；校准改善源于模型对不确定性的深层内化，而非输出层面的表面重缩放。

---

## 3. ReasonAlloc: Hierarchical Decoding-Time KV Cache Budget Allocation for Reasoning Models

**基本信息**
- 作者: Wenhao Liu, Hao Shi, Yunhe Li, Weizhi Fei, Xiangyuan Wang, Mengzhe Ruan, Hanxu Hou, Peisong Wang, Linqi Song, Shuang Qiu
- 发布: 2026-06-09
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2606.11164](https://arxiv.org/abs/2606.11164)

**主要贡献**
针对长 CoT 推理模型解码时 KV cache 急剧膨胀的瓶颈，提出免训练框架 ReasonAlloc，将解码期 KV 压缩重构为层级化预算分配问题，并发现了跨层需求的"Reasoning Wave"模式。

**方法**
两级层级策略：(1) 离线 layer-wise 分配——按各层在推理中的需求模式（Reasoning Wave）非均匀分配预算；(2) 在线 head-wise 重分配——解码过程中基于实时信息效用，动态将预算重新分给高价值注意力头。

**实验**
在 MATH-500、AIME 2024 等数学推理基准上，用 DeepSeek-R1-Distill-Llama-8B、DeepSeek-R1-Distill-Qwen-14B、AceReason-14B 三个模型验证，在低 token 预算下明显优于均匀预算及其他压缩基线。

**结论**
非均匀的层级预算分配能在严格内存约束下保住推理精度，且与现有压缩方法兼容、推理开销极小，为推理模型的高效部署提供了实用方案。

---

## 📊 今日统计

| 论文 | venue | 引用 | 方向标签 |
|------|-------|------|---------|
| FlowTracer | ICML 2026 | 0 | RL 信用分配 / 注意力信息流 |
| PPT | arXiv | 0 | 归纳推理 / 概率程序 / 校准 |
| ReasonAlloc | arXiv | 0 | 高效推理 / KV cache / 系统 |

> 注: Semantic Scholar API 当日限流，2606.09856 引用数按 0 记录（发布不足 3 周）。
