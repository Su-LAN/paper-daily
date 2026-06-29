# 📚 每日论文速递 - 2026-06-29

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. When Does Combining Language Models Help? A Co-Failure Ceiling on Routing, Voting, and Mixture-of-Agents Across 67 Frontier Models

**基本信息**
- 作者: Josef Chen
- 发布: 2026-06-25
- 会议/期刊: arXiv (preprint, cs.AI)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.27288](https://arxiv.org/abs/2606.27288)

**主要贡献**
为「路由 / 投票 / Mixture-of-Agents」这类组合多 LLM 的工程范式，给出了一个**与具体算法无关的理论上界**：组合系统的准确率不会超过 `1 − β`，其中 β 是「所有候选模型在同一 query 上同时答错」的概率（co-failure rate）。基于这一上界，作者在 21 家厂商共 **67 个前沿模型**上系统度量 β，揭示出现实中 β 比传统相关性度量预测的更大，因此「多模型组合」收益远比直觉小。

**方法**
- 形式化「co-failure ceiling」: 在 query 级 routing/voting/MoA 的任意组合策略下，准确率 ≤ 1 − Pr[所有模型同时错]；
- 在大规模 benchmark（含数学推理任务）上估计 β，并将其与「成对错误相关性 + 边际错误率」预测的 β 做对比；
- 给出何时「query-level routing」能逼近上界、何时只是噪声选择的判据。

**实验**
跨 67 个 frontier model 的实测显示：(1) 仅当存在强 query-level routing 时组合才会显著优于单个最佳模型；(2) **数学推理任务上，实测 co-failure rate 比由错误相关性公式预测值高约 2.5 倍**——说明前沿模型在「难推理题」上倾向集体翻车，集成增益受限严重。

**结论**
对依赖 ensemble / MoA / self-consistency 的 reasoning pipeline 是个直接警告：在报告新组合方法前应**先报 β**，否则提升大概率来自「方差里挑赢家」。这给「scaling test-time by combining models」给出了一个干净、可证伪的天花板。

---

## 2. The Verification Horizon: No Silver Bullet for Coding Agent Rewards

**基本信息**
- 作者: Binghai Wang, Chenlong Zhang, Dayiheng Liu, Jiajun Zhang, Jiawei Chen, Mouxiang Chen, Rongyao Fang, Siyuan Zhang, Xuwu Wang, Yuheng Jing, Zeyao Ma, Zeyu Cui (Qwen)
- 发布: 2026-06-24
- 会议/期刊: arXiv (preprint, cs.AI / cs.CL)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.26300](https://arxiv.org/abs/2606.26300)

**主要贡献**
随着 coding agent 候选解越来越容易生成，「**可靠地验证一个解**」已成为 RL 训练的核心瓶颈。Qwen 团队提出 **Verification Horizon** 框架：每一种 verifier 本质上都只是对人类意图的 **proxy**，导致两类系统性问题——*intent underspecification*（意图欠规范）与 *optimization drift*（训练中策略对 proxy 过拟合）。

**方法**
沿三个维度对 reward 信号做画像：
- **Scalability**：能否随任务复杂度无痛扩展；
- **Faithfulness**：与人类真实意图的对齐程度；
- **Robustness**：在强化策略迭代后是否仍能区分好坏轨迹。

并系统比较四类 verifier：**test verifier**、**rubric verifier**、**human verification** 与 **automated agent verifier**，分别给出失效模式与适用区间。

**实验**
在 coding agent 训练流水线中实证：**任何固定的 reward function 都会随 policy 能力增长而退化**——early-stage 有效的 test verifier 在后期被钻空子，rubric/agent verifier 在长程任务上保真度下降。文中给出了 reward「保鲜期」的可观测信号与切换策略。

**结论**
对所有用 RL 训练 coding / 推理 agent 的工作给出一个反常识结论：**不存在一劳永逸的 reward**，verifier 必须与 policy 一起演化。这把「verifier engineering」抬到了与「policy optimization」同等重要的位置。

---

## 3. Why Multi-Step Tool-Use Reinforcement Learning Collapses and How Supervisory Signals Fix It

**基本信息**
- 作者: Yupu Hao, Zhuoran Jin, Huanxuan Liao, Kang Liu, Jun Zhao
- 发布: 2026-06-24
- 会议/期刊: arXiv (preprint, cs.CL)
- 引用数: 0 📈 (刚发布)
- arXiv: [2606.26027](https://arxiv.org/abs/2606.26027)

**主要贡献**
针对多步 tool-use RL 中的「**性能突然崩塌**」现象，做了一次根因解剖：表面是任务准确率断崖式下跌，**底层能力其实仍在**——但控制 token（如工具调用括号、字段名）出现异常概率尖峰，导致 tool-invocation 结构被破坏。

**方法**
- 通过 token 级 logit 追踪定位「format collapse」具体发生的层与时刻；
- 比较多种监督信号注入方式：**off-policy 监督**、**hint-based guidance**、以及 **SFT × RL 交替**；
- 给出每种监督在「稳定性 vs OOD 泛化」上的权衡曲线。

**实验**
在多步工具使用 benchmark 上：
- 纯 RL 出现典型 collapse 曲线（前期稳定上升、某一步后控制 token 失控）；
- **SFT/RL 交错训练**最有效遏制 collapse，但代价是 OOD 任务上轻度退化；
- hint-based guidance 在 in-distribution 上接近 SFT-interleaved，且 OOD 损失更小。

**结论**
为「Agent RL 训练 = 端到端 RL」这一默认范式做了校正：**多步 tool-use 的失败常常是「格式生成层」崩溃而非「决策层」失能**，因此监督信号应有针对性地保护控制 token 的分布。对所有 ReAct / tool-use / agentic-RL pipeline 都直接可用。

---

## 📊 今日总结

- **共同主题**：三篇都从「**RL / 组合 / verifier**」这条 reasoning agent 训练链上指出一个被忽视的天花板或失效模式——Co-Failure Ceiling 限制集成、Verification Horizon 限制 reward、Format Collapse 限制 multi-step RL。
- **方法论倾向**：从「再加一个 trick」转向「**先量化失败/上界**」，与近期 reasoning 社区「先 audit, 再 push」的趋势一致。
- **工程价值**：三篇都给出可直接套用的诊断信号（β、verifier 三轴、控制 token logit 监控），适合并入现有 agent training pipeline 的健康检查项。

Sources:
- [arXiv 2606.27288](https://arxiv.org/abs/2606.27288)
- [arXiv 2606.26300](https://arxiv.org/abs/2606.26300)
- [arXiv 2606.26027](https://arxiv.org/abs/2606.26027)
