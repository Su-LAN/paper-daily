# 📚 每日论文速递 - 2026-07-21

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高相关预印本
**论文数量**: 3

---

## 1. Understanding Reasoning from Pretraining to Post-Training

**基本信息**
- 作者: Jingyan Shen, Ang Li, Salman Rahman, Yifan Sun, Micah Goldblum, Matus Telgarsky, Pavel Izmailov
- 发布: 2026-07-17
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.16097](https://arxiv.org/abs/2607.16097)

**主要贡献**
系统研究预训练决策（模型规模、数据量）如何影响后续 RL 推理训练的效率，给出了预训练与 RL 后训练之间的定量关系。

**方法**
以国际象棋为可控实验环境：在人类棋局上预训练 5M–1B 参数的语言模型，用带推理轨迹的 SFT 微调，再在可验证奖励的棋局谜题上做 RL。系统扫描模型规模与预训练 token 量。

**实验**
RL 后性能与预训练 loss 高度相关；RL 奖励曲线的斜率随预训练 token 量线性提升；RL 在简单谜题与困难谜题上表现出不同的学习动态。结论在 1B 模型的数学域实验中得到复现。

**结论**
RL 推理能力的上限和学习效率在很大程度上由预训练质量决定，"更好的起点带来更好的 RL 终点"，为推理模型的算力分配提供了依据。

---

## 2. Causal-Audit: Explicit and Auditable Graph-based Reasoning via Target-Aware Causal Chain Construction

**基本信息**
- 作者: Su Lan, Xuefei Yin, Yanming Zhu, Alan Wee-Chung Liew
- 发布: 2026-04-22 (arXiv 公告 2026-07)
- 会议/期刊: ACL 2026 (CCF-A)
- 引用数: 0 📈
- arXiv: [2607.15281](https://arxiv.org/abs/2607.15281)

**主要贡献**
提出 Causal-Audit 框架，将 LLM 的隐式因果推理替换为在显式因果图上的结构化、可审计推理，兼顾性能与可解释性。

**方法**
四个模块化阶段完成显式因果图上的结构化推理；核心是 target-aware 因果图构建策略（优先保留与目标相关的变量、抑制噪声变量），并引入 path-level 因果证据聚合机制处理多条因果路径。

**实验**
在三个因果推理基准上超越现有隐式推理方法，同时推理过程可逐步审计。

**结论**
显式图结构 + 目标感知构图使 LLM 因果推理既更准确又可解释，为高风险场景下的可审计推理提供了范式。（venue 已按 playbook 经 /abs 页 journal reference 与 S2 双重确认为 ACL 2026）

---

## 3. Better Starts, Better Ends: Bootstrapped Iterative Self-Reasoning Distillation for Compressed Reasoning

**基本信息**
- 作者: Leichao Dong, Dongxu Zhang, Yiding Sun, Qirui Wang, Yuhan Wang, Lin Chen, Jihua Zhu
- 发布: 2026-07-17
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.15736](https://arxiv.org/abs/2607.15736)

**主要贡献**
提出 BIRD：两阶段自蒸馏方法，在不牺牲（甚至提升）准确率的情况下大幅压缩长链式思维推理的输出长度。

**方法**
阶段一：通过 brevity 指令引导模型生成简洁解答并做轻量微调（bootstrapped 起点）；阶段二：以简洁教师模型进行 on-policy 蒸馏，迭代自我压缩推理链。

**实验**
在 Qwen3-8B 上，MATH-500 准确率从 86.2% 提升到 92.0%，平均响应长度从 3,099 tokens 降至 1,115 tokens（约 64% 压缩）。

**结论**
"更好的起点带来更好的终点"：先自举出简洁推理风格再做 on-policy 蒸馏，可同时改善推理效率与准确率的权衡。

---

## 📊 今日统计

| # | 论文 | venue | 引用 |
|---|------|-------|-----|
| 1 | Understanding Reasoning from Pretraining to Post-Training | arXiv (preprint) | 0 |
| 2 | Causal-Audit | ACL 2026 (CCF-A) | 0 |
| 3 | BIRD: Compressed Reasoning Distillation | arXiv (preprint) | 0 |
