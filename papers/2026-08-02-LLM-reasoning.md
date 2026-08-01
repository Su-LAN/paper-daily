# 📚 每日论文速递 - 2026-08-02

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. Not All Tokens Deserve Equal Credit: Counterfactual Sensitivity Credit Reallocation for Long-CoT Reasoning

**基本信息**
- 作者: Qiangqiang He, Zhongheng Wu, ZiJian Wang
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本 — /abs Comments: "20 pages, 6 figures, 11 tables"
- 引用数: 0 📈
- arXiv: [2607.27888](https://arxiv.org/abs/2607.27888)

**主要贡献**
系统检验 on-policy self-distillation (OPSD) 中"特权 likelihood shift 编码可靠的答案对齐信息"这一隐含假设并证伪；提出 Counterfactual Sensitivity Credit Reallocation (CSCR)——GRPO 的一个简单扩展，按反事实敏感度对 token-level credit 进行重分配，改进 critic-free RLVR 在 long-CoT 推理上的 credit assignment。

**方法**
固定每条采样轨迹，在"断言正确"与"断言错误"两种对立结果条件下重新打分：发现大多数受影响 token 在两种条件下同向移动（少量符号反转、优化信号高度重叠），且大幅 shift 集中在高度可替换的表面形式 token 上，而承载问题相关推理内容的 token 反而不敏感。据此 CSCR 对高敏感 token 降低信用权重，并重新归一化 token-level advantage，同时保持原始信用预算与 verifier 决定的更新方向。

**实验**
在 long-CoT 数学推理基准上，相同 policy update 次数下 CSCR 一致优于 GRPO 基线。定向消融进一步验证诊断：特权诱导的方向不可靠、适度降权效果最佳、过强调制会破坏优化稳定性。

**结论**
特权 shift 的幅度主要反映反事实敏感度而非 token 级学习价值；把这一敏感度信号用于信用重分配，是改进 RLVR token-level credit assignment 的简单有效途径。

---

## 2. ReDiPPO: Reference-Guided Value Calibration and Discrepancy-Aware Token Reweighting for Mathematical Reasoning

**基本信息**
- 作者: Zhenrong Zhang, Fei Wu, Jun Du, Jianshu Zhang, Si Wei
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.27631](https://arxiv.org/abs/2607.27631)

**主要贡献**
提出 ReDiPPO——面向数学推理的 reference-guided、discrepancy-aware PPO 框架，解决长推理视野 + 稀疏结果奖励下标准 critic 无法准确评估中间推理状态、导致 advantage 估计噪声大的问题。

**方法**
(1) reference-guided critic：训练时以参考答案作为特权信号，获得更准确的价值估计；(2) 同时保留标准 critic，量化两个 critic 在 token 级的 reference-standard discrepancy，作为"困难推理状态"的指标；(3) 用该差异对 PPO 优化中的 token-level advantage 进行重加权。

**实验**
在多个数学推理基准上，ReDiPPO 提高了价值估计精度，并一致优于 PPO、DAPO、GSPO 等强策略优化基线；代码已开源。

**结论**
参考引导的价值校准与差异感知的 token 重加权相结合，使 critic-based PPO 在 LLM 数学推理训练中重新具备对 critic-free 方法的竞争力，token-level credit assignment 是关键收益来源。

---

## 3. Lightning OPD 2.0: Mitigating Style Bias in Cross-Teacher On-Policy Distillation for Large Reasoning Models

**基本信息**
- 作者: Yecheng Wu, Song Han, Han Cai
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.28449](https://arxiv.org/abs/2607.28449)

**主要贡献**
指出 on-policy distillation (OPD) 的效果依赖 teacher consistency（提供 OPD 监督的模型应当也生成了 SFT 参考数据），而实际中该条件经常被破坏（SFT 数据来源混杂或 SFT/蒸馏偏好不同模型）；提出 Lightning OPD 2.0 的 cross-fitted style residualization，消除 cross-teacher 设置下的风格 token 偏差。

**方法**
分析发现 teacher-reference 原始分歧同时包含有用的上下文相关 teacher 证据和一个反复出现的"风格成分"（措辞、格式、推理节奏差异）。方法用 rollout-level cross-fitting 估计这一反复成分，作为 style-token bias 的操作代理，并在构造 token-level OPD 更新前将其减去。

**实验**
在数学推理与代码生成基准上，cross-teacher 设置下 Lightning OPD 2.0 一致优于 Lightning OPD；从 Klear-Reasoner-8B-SFT 出发，达到 AIME 2024 82.4%、LiveCodeBench v5 63.0%。代码即将发布。

**结论**
去除风格偏差后，cross-teacher OPD 成为实用方案：teacher consistency 不再是前提，SFT 数据生成器与蒸馏 teacher 可以独立选择，为大推理模型的蒸馏管线提供更大灵活性。

---

**去重说明**: 本日速递已排除 papers.json 中已记录的 154 篇论文；三篇入选论文均为 2026-07-30 v1 新提交（无 held submissions），/abs Comments 均无会议接收声明，按预印本记录。
