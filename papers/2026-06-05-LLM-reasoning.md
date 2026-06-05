# 📚 每日论文速递 - 2026-06-05

**研究方向**: LLM reasoning
**筛选条件**: arXiv 最新预印本 (优先顶会方向: NeurIPS / ICML / ICLR / ACL)
**论文数量**: 3

---

## 1. Rethinking RL for LLM Reasoning: It's Sparse Policy Selection, Not Capability Learning

**基本信息**
- 作者: Omer Akgul, Rajgopal Kannan, Willie Neiswanger, Viktor K. Prasanna
- 发布: 2026-05-07
- 会议/期刊: arXiv (预印本, 方向: NeurIPS/ICML 候选)
- 引用数: 0 📈
- arXiv: [2605.06241](https://arxiv.org/abs/2605.06241)

**主要贡献**
对 RL 微调 LLM 推理能力的主流叙事提出根本性挑战：作者通过 token 级分析证明 RL 并未让模型学到新策略，而是在已有的解空间上做**稀疏的策略选择**。仅 1–3% 的 token 位置受 RL 影响，且被推升的 token 始终落在基模型的 top-5 候选中。

**方法**
- 在多个模型族和多种 RL 算法下进行 token 级分析，定位 RL 真正"起作用"的位置
- 提出 **ReasonMaxxer**：一种 RL-free 方法，仅在 base 模型熵高的"决策点"上施加 contrastive loss
- 完全离线 (无在线 rollout)，仅需数百条 base-model rollout
- 利用 base 模型自身熵识别关键 token 位置，整个修正过程是低维的、可压缩到极少参数中

**实验**
- 覆盖 3 个模型族、6 种规模、6 个数学推理基准
- ReasonMaxxer 匹配甚至超过全量 RL 性能
- 训练成本下降约 3 个数量级 (几十道题、单 GPU 几分钟)
- 关键消融：随机修正失败，仅高熵位置修正能恢复绝大部分 RL 收益

**结论**
将推理改进重新框定为"稀疏策略选择"而非"能力获取"，对当前用 GRPO/PPO 大规模训练推理模型的范式提出质疑。如果稀疏选择假说成立，o1/R1 类训练管线可能存在巨大效率冗余。

---

## 2. Thinking Economically: A Hierarchical Framework for Adaptive-Complexity Reasoning in LLMs

**基本信息**
- 作者: Yubo Gao, Haotian Wu, Hong Chen, Jun Huang, Yibo Yan, Jungang Li, Zihao Dongfang, Sicheng Tao, Puay Siew Tan, Jie M. Zhang, Xuming Hu
- 发布: 2026-05-31
- 会议/期刊: arXiv (预印本)
- 引用数: 0 📈
- arXiv: [2606.01168](https://arxiv.org/abs/2606.01168)

**主要贡献**
针对 CoT 推理普遍的"overthinking"问题，提出**Thinking Economically**原则：根据任务和单步内在难度分层分配计算预算，而非追求统一的简洁。区别于现有"统一压缩"方法，作者明确建模推理复杂度的两层异质性 (问题间 / 步骤内)。

**方法**
- **Hierarchical Adaptive Budgeter (HAB)** 训练框架
  - **Inter-step level**: 为每个问题预测最佳推理深度
  - **Intra-step level**: 从 PPL 派生的步骤对比中学习 token 预算信号
  - **Adaptive Pareto optimization**: 捕获局部质量-效率折衷
  - **Fisher Information-based pruner**: 提供细粒度训练时引导，鼓励生成器内化更经济的推理模式

**实验**
- 数据集: GSM8K, MATH500
- 结果: HAB 不仅在准确率上超过标准 CoT，还减少了 token 使用量
- 在效率-性能 Pareto 前沿上优于所有对比基线

**结论**
区分"问题难度"和"步骤难度"两个粒度后，自适应预算可同时提升精度并降低成本。该工作为高效推理研究 (efficient reasoning) 提供了新的训练侧切入点，互补 OpenAI o1 / DeepSeek-R1 一类长思维链方法。

---

## 3. Predictive Maps of Multi-Agent Reasoning: A Successor-Representation Spectrum for LLM Communication Topologies

**基本信息**
- 作者: E. Parks, Dalal Alharthi
- 发布: 2026-05-12
- 会议/期刊: arXiv (预印本)
- 引用数: 0 📈
- arXiv: [2605.11453](https://arxiv.org/abs/2605.11453)

**主要贡献**
为多智能体 LLM 系统的通信拓扑选择 (chain/star/mesh) 提供首个**前置 (pre-inference) 诊断工具**。基于 successor representation 的谱量，把"何种拓扑会放大 drift / 收敛到一致 / 在扰动下保持稳健"这三类问题归约到三个谱不变量。

**方法**
- 用通信算子的行随机矩阵 P 构造 successor representation **M = (I - γP)⁻¹**
- 把三种失败模式与三个谱量绑定：
  - **谱半径 ρ(M)** → 累积误差
  - **谱间隙 Δ(M)** → 共识动力学
  - **条件数 κ(M)** → 扰动鲁棒性
- 给出 chain/star/mesh 的闭式谱

**实验**
- 12 步结构化状态跟踪任务，Qwen2.5-7B-Instruct，100 次独立实验
- κ(M) 是经验扰动鲁棒性的**完美排名预测器** (r_s = 1.0)
- 谱间隙部分预测共识动力学 (r_s = 0.5)
- 谱半径相对累积误差**完美反向** (r_s = −1.0)，作者将其溯源到 non-contracting bias drift 失效区
- 提出 affine-noise 扩展，恢复经验排序

**结论**
首次为 multi-agent LLM 系统提供"表示性、漂移感知"的结构诊断，与经典谱理论和共识理论并列。对部署 LangGraph、AutoGen、CrewAI 等多 agent 框架的实践者具有直接选型价值。

---

**记录时间**: 2026-06-05
**已记录论文累计**: 19 篇 (+3)
