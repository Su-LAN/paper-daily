# 📚 每日论文速递 - 2026-07-03

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. Message Passing Enables Efficient Reasoning

**基本信息**
- 作者: Xuecheng Liu, Daman Arora, Gokul Swamy, Andrea Zanette
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (Semantic Scholar 已确认)
- arXiv: [2607.01077](https://arxiv.org/abs/2607.01077)

**主要贡献**
提出 Message Passing Language Models (MPLMs)：一种全新的 LLM 推理框架，让并行推理线程之间通过轻量级的 send/receive 原语直接通信，突破了串行 CoT 和传统 fork-join 并行方案的瓶颈。

**方法**
不同于串行 chain-of-thought（上下文随推理长度线性增长）或 fork-join（父线程需收集所有子线程结果），MPLM 允许线程在推理过程中点对点交换信息、基于部分信息提前终止。通信成本显著降低，且各线程的上下文可保持渐近更小的规模。

**实验**
- Sudoku 数独：MPLM 所需上下文渐近小于串行 CoT 和 fork-join；微调后可解 25×25 数独（标准 CoT 和其他前沿推理模型仍难以完成）
- 3-SAT：基于部分信息的选择性提前终止提升了求解表现
- 长上下文 QA：预训练模型无需微调即可遵循 MPLM 协议，与现有 fork-join 方法相比具有竞争力

**结论**
线程间消息传递是比 fork-join 更高效的并行推理范式，为推理时扩展 (inference-time scaling) 提供了计算上更经济的路径，尤其适合具有可分解结构的推理任务。

---

## 2. REVES: REvision and VErification-Augmented Training for Test-Time Scaling

**基本信息**
- 作者: Yuanxin Liu, Ruida Zhou, Xinyan Zhao, Amr Sharaf, Hongzhou Lin, Arijit Biswas, Mohammad Ghavamzadeh, Zhaoran Wang, Mingyi Hong
- 发布: 2026-06-17
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (Semantic Scholar 已确认)
- arXiv: [2606.18910](https://arxiv.org/abs/2606.18910)

**主要贡献**
指出标准后训练（单次生成目标优化）与多步测试时推理之间存在目标错位，提出 REVES 两阶段迭代训练框架，把"修订"和"验证"能力显式注入模型，提升 test-time scaling 效果。

**方法**
交替进行在线数据/提示增强与策略优化：将成功轨迹中的中间步骤转化为解耦的 revision（答案改写）和 verification（错误识别）提示，使训练集中在有效的答案变换与错误定位上。相比常规多轮 RL，离策略数据生成效率更高。

**实验**
- LiveCodeBench：比 RL 基线提升 +6.5 分，比标准多轮训练提升 +4.0 分
- Circle packing：用更小的 4B 基座模型、更少的 rollout 追平此前 SOTA
- 泛化到约束满足类谜题任务

**结论**
显式训练修订与验证能力比单纯堆叠多轮 RL 更有效地释放测试时计算的价值，且对小模型尤为友好。

---

## 3. Shattering the Autoregressive Curse: Dynamic Epistemic Entropy Orchestrated Erasable Reinforcement Learning for LLMs

**基本信息**
- 作者: Ziliang Wang, Kang An, Faqiang Qian, Jialu Cai, Cijun Ouyang, Yuhang Wang, Qibing Ren, Yichao Wu
- 发布: 2026-06-16
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (Semantic Scholar 已确认)
- arXiv: [2606.17735](https://arxiv.org/abs/2606.17735)

**主要贡献**
针对自回归生成的"不可逆性诅咒"——早期的微小认知扰动会不可逆地传播并引发级联推理失败——提出 E³RL（Erasable RL），让模型在 RL 训练中学会擦除有缺陷的推理片段并自我修正。

**方法**
利用模型自身的自回归交叉熵作为认知不确定性度量，动态检测推理链中的高熵（可疑）片段；触发擦除机制移除有缺陷的推理段落，同时保留 KV 缓存中的有效计算，实现低开销的回退-重推理。

**实验**
- 训练数据: DeepMath-103k
- 数学基准（含 AIME）上显著提升：4B 和 8B 小模型超越此前最优结果约 5–6.5%

**结论**
赋予模型"可擦除"的推理能力能有效缓解自回归误差累积，是对不可逆逐 token 生成范式的一个实用修正，小模型收益尤为明显。

---

## 📌 备注

- 三篇论文引用数均经 Semantic Scholar 确认为 0（新发布），将由每日 `--update` 任务持续追踪。
- 三篇均为高质量预印本（config 中 `include_preprints: true`），暂无顶会接收标注。
