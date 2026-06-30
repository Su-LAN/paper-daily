# 📚 每日论文速递 - 2026-06-30

**研究方向**: LLM reasoning
**筛选条件**: arXiv 最新 (含顶会预印本 / workshop)
**论文数量**: 3

---

## 1. Process Advantage Signal Shaping: A Paradigm-Agnostic Middleware for Process-Supervised RL in LLM Reasoners

**基本信息**
- 作者: Chao Wang, Hongtao Tian, Tao Yang, Yunsheng Shi, Ting Yao, Wenbo Ding
- 发布: 2026-06-28
- 会议/期刊: arXiv preprint
- 引用数: 0 (新发布)
- arXiv: [2606.29296](https://arxiv.org/abs/2606.29296)

**主要贡献**
针对 GRPO 在引入过程监督信号时暴露的三类结构性病理——通道污染（channel contamination）、分辨率失配（resolution mismatch）和累积陷阱（cumulative traps）——提出 PASS 中间件，作为一个范式无关的信号整形层。

**方法**
PASS 由三个独立组件构成：Advantage Fusion（融合多路 advantage 信号）、Chunk-by-Value（按价值分块以缓解分辨率失配）、Divide-Length（按长度归一化避免累积陷阱）。整体即插即用，与底层奖励模型/KL 信号无关。

**实验**
在数学推理和多跳问答两类典型推理任务上验证，分别使用学习到的过程奖励模型 (PRM) 与 on-policy KL 信号作为过程监督来源；PASS 改善了 credit assignment 并稳定了训练。

**结论**
GRPO 训练 LLM reasoner 时直接叠加过程监督会引入隐性偏差；通过对 advantage 信号做显式整形可在不改变 RL 范式的前提下获得稳定增益。

---

## 2. The Complexity Ceiling Benchmark: A Multi-Domain Evaluation of Sequential Reasoning Under Depth Scaling

**基本信息**
- 作者: Shubh Chapra, Dhruv Kumar, Murari Mandal, Yash Sinha
- 发布: 2026-06-28
- 会议/期刊: CTB Workshop @ ICML 2026
- 引用数: 0 (新发布)
- arXiv: [2606.29278](https://arxiv.org/abs/2606.29278)

**主要贡献**
提出 Complexity Ceiling Benchmark，受控研究 LLM 在推理深度（步数）增加时的性能衰减形态，跨 5 个模型 × 6000 次试验 × 3 个推理域。

**方法**
保持语义内容一致，仅改变任务深度（5→50 步）：空间状态追踪、符号指针操作、关系推理三个域；提出几何衰减模型刻画每步性能下降，以及 divergence point 度量。

**实验**
前两域 50 步时仍维持 >92% 准确率；第三域在第 5 步就崩溃。14.5% 的正确答案是通过错误的中间推理得到的；冗长的状态追踪并未带来增益。

**结论**
"推理深度"不是单一维度——结构敏感性远大于步数本身；divergence point 比参数量更能预测准确率，挑战了"更大模型更稳健推理"的简单叙事。

---

## 3. ThinkProbe: Beyond Accuracy — Structural Profiling of Open-Ended LLM Reasoning Traces via Non-Generative Thought Graphs

**基本信息**
- 作者: Mohamed Amine Kerkouri, Simon D. Hernandez, Marouane Tliba, Yann Dauxais, Maha Ben-Fares, Pierre Holat
- 发布: 2026-06-27
- 会议/期刊: EMNLP 2026 (under review)
- 引用数: 0 (新发布)
- arXiv: [2606.29067](https://arxiv.org/abs/2606.29067)

**主要贡献**
提出 ThinkProbe 框架，将 LLM 的开放式推理轨迹转化为 Thought Graph（8 类节点 + 6 类边），再由非生成式分析得到一个 5 维 × 19 指标的"认知画像"。

**方法**
通过规则分段 + 语义链接构造 Thought Graph，避免再次调用 LLM 进行打分；在 4200 条来自 7 个推理模型的轨迹上抽取认知指标。

**实验**
模型间方差在大多数认知维度上显著大于域间方差——即"推理结构"主要是模型层级的属性而非任务属性；这些差异是 accuracy 单一指标看不到的。

**结论**
应把"推理风格/结构"作为模型评估的一等公民，单一准确率指标掩盖了模型间真实的认知差异。

---

**数据维护**
- 已写入 `~/paper-daily/data/papers.json`（73 篇）
- 引用数将由后续 `--update` 模式自动追踪
