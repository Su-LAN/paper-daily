# 📚 每日论文速递 - 2026-06-28

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. OPID: On-Policy Skill Distillation for Agentic Reinforcement Learning

**基本信息**
- 作者: Shuo Yang, Jinyang Wu, Zhengxi Lu, Yuhao Shen, Fan Zhang, Lang Feng, Shuai Zhang, Haoran Luo, Zheng Lian, Zhengqi Wen, Jianhua Tao
- 发布: 2026-06-25
- 会议/期刊: arXiv (preprint, cs.CL)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.26790](https://arxiv.org/abs/2606.26790)

**主要贡献**
针对 agentic RL 中外部专家轨迹/技能缺失或代价高的现实约束，提出 **OPID** —— 一种直接从智能体自身完成的 on-policy 轨迹中蒸馏「技能监督」的框架，无需依赖额外的教师数据。

**方法**
将一条 trajectory 的后见之明 (hindsight) 编码为两层「技能」：
- **Episode-level skills**：全局工作流、典型成功路径与可复用的「避坑规则」；
- **Step-level skills**：在关键时间步上的局部决策知识。
随后用这些 skill 把上下文做「技能增强」，并把仅有 outcome reward 的稀疏信号转换成 token 级的密集监督，从而在不引入外部专家的情况下提升 credit assignment 质量。

**实验**
在 ALFWorld、WebShop 以及基于搜索的 QA 三类 agentic benchmark 上一致优于纯 outcome-reward RL 与常见 self-imitation / behavior cloning 基线，且对长程任务的稳定性更好。

**结论**
表明「on-policy 自蒸馏 + 分层 skill 抽象」是把稀疏 agent reward 转化为密集监督的可行范式，对依赖人工 demonstration 的 agentic RL 流水线是一种结构性简化。

---

## 2. Information-Aware KV Cache Compression for Long Reasoning

**基本信息**
- 作者: Jushi Kai, Zhuiri Xiao, Alexandra Birch, Zhouhan Lin
- 发布: 2026-06-25
- 会议/期刊: arXiv (preprint, cs.CL)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.26875](https://arxiv.org/abs/2606.26875)

**主要贡献**
针对长链路推理 (long CoT / long-context reasoning) 中 KV cache 急剧膨胀的问题，指出现有以「注意力权重」为唯一信号的压缩方法在多步推理上系统性偏差，提出 **Forward Influence** 这一新的信息量度，并据此设计 **InfoKV** 压缩策略。

**方法**
- **Forward Influence**：度量某个被压缩 token 对后续 token 生成的实际影响，而不仅是当前层注意力强度；
- **InfoKV**：融合 token 级的 *预测不确定性 (entropy)* 与 *跨层表征演化* ，再与 attention score 加权合并，作为最终保留/丢弃决策。
该策略同时作用于 prefill 与 decoding 阶段。

**实验**
在多个 long-context reasoning benchmark（含数学/多跳 QA 类长 CoT）上，使用 Llama 与 DeepSeek-R1 系列做基模型，相同压缩率下持续优于 H2O、SnapKV 等基于注意力的 KV 压缩基线，长输出场景下提升尤为明显。

**结论**
说明在「reasoning model」时代，KV cache 重要性不能再以单步 attention 衡量；前向影响 + 层间表征演化提供了一个更稳健的「信息保真度」视角，对部署 long-CoT 推理模型有直接工程价值。

---

## 3. DiARC: Distinguishing Positive and Negative Samples Helps Improving ARC-like Reasoning Ability of Large Language Models

**基本信息**
- 作者: Yuxuan Yang, Feiyang Li, Yile Wang
- 发布: 2026-06-25
- 会议/期刊: arXiv (preprint, cs.CL)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.26530](https://arxiv.org/abs/2606.26530)

**主要贡献**
观察到当前开源 LLM 在 Abstraction and Reasoning Corpus (ARC) 类任务上显著落后于闭源大模型，而已有工作几乎只在「正样本」上做数据增广。**DiARC** 转而显式构造高质量「负样本」并采用偏好对齐 (preference alignment) 训练，让模型学会区分「近似但错」的解释。

**方法**
提出三种互补的负样本构造方式：
1. **Output-level visual transformations**：在输出网格上做几何/颜色扰动；
2. **DSL-level rule inversion**：在领域 DSL 层面把正确规则反向化；
3. **Task-specific rule editing**：针对每个任务编辑规则，得到与 demo 高度相似的 near-miss。
再以正负对的形式做偏好优化，避免破坏原有 demonstration 监督。

**实验**
在多个 ARC 衍生 benchmark 上一致优于仅做正样本增广的基线，并显著缩小与闭源模型的差距，验证「near-miss 对比信号」对抽象推理学习的价值。

**结论**
为开源 LLM 在 ARC 类「少样本规则归纳」任务上提供了一条数据中心的可复制路径：与其堆更多正例，不如系统化制造高信息量的负例，并用偏好对齐而非纯 SFT。

---

## 📊 今日观察

- 三篇都集中在「**让 reasoning 更便宜或更可监督**」这条主线：OPID 解决 agentic RL 的稀疏 reward，InfoKV 解决 long-CoT 的显存瓶颈，DiARC 解决抽象推理的数据低效。
- 趋势上，*on-policy 自蒸馏*、*前向影响度量*、*近邻负样本* 正在替代「更多专家数据 / 更大注意力 / 更多 SFT」的暴力路径。
- 三篇均为 2026-06-25 提交的全新 preprint，引用计数尚未在 Semantic Scholar 上累计；本仓库后续会持续追踪。
