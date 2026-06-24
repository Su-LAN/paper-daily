# 📚 每日论文速递 - 2026-06-24

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + arXiv 预印本
**论文数量**: 3

---

## 1. What are Key Factors for Updates in RL for LLM Reasoning?

**基本信息**
- 作者: Peidong Wang, Demi Wang, Xufang Luo, Jiahang Xu, Xiaocui Yang, Shi Feng, Yuqing Yang, Dongsheng Li
- 发布: 2026-06-21
- 会议/期刊: Findings of ACL 2026 (CCF-A / CORE-A*)
- 引用数: 0 (新文)
- arXiv: [2606.22570](https://arxiv.org/abs/2606.22570)

**主要贡献**
- 对 RLVR (Reinforcement Learning with Verifiable Rewards) 训练过程中影响 token 级更新的关键量进行了系统的理论分析；
- 指出"每个 rollout 上的梯度步数"如何主导 importance sampling ratio 的分布形态，并将"梯度期望"识别为决定更新动力学的核心量；
- 提出 **Adaptive Clip Policy Optimization (ACPO)**，根据不同 token 组的 importance sampling ratio 经验方差自适应地调整裁剪边界。

**方法**
作者从 token 级 update 出发，将 token 概率、advantage 与 importance sampling ratio 三者之间的耦合关系显式拆解。ACPO 不再使用 DAPO / CISPO 等方法中统一的 clip 阈值，而是按 token 分组（高方差组 / 低方差组）分别设定上下界，从而在保留高优势 token 信号的同时抑制高方差 token 带来的策略漂移。

**实验**
- 在 3B 和 7B 规模模型上验证，覆盖数学推理、表格问答和逻辑谜题三类任务；
- 相比 DAPO 和 CISPO 两种强基线，ACPO 在准确率与训练稳定性上均显著占优；
- 提供完整开源实现，便于复现。

**结论**
ACPO 把"按 token 组方差自适应剪裁"提炼为一个简单但通用的 RLVR 训练技巧，为构造更稳定的 LLM 推理 RL 训练循环提供了具体且即插即用的方案，是 GRPO/DAPO 家族重要的实操延伸。

---

## 2. A First-Principles Derivation of LLM Policy Optimization: From Expected Reward to GRPO and Its Structural Extensions

**基本信息**
- 作者: Jianghan Shen, Siqi Luo, Yue Li, Jiyao Liu, Wanying Qu, Yi Zhang, Ziyan Huang, Tianbin Li, Ming Hu, Xiaohong Liu, Yirong Chen, Junjun He
- 发布: 2026-06-15
- 会议/期刊: arXiv 预印本 (cs.AI)
- 引用数: 0 (新文)
- arXiv: [2606.16733](https://arxiv.org/abs/2606.16733)

**主要贡献**
- 给出 LLM 策略优化方法从 REINFORCE 一路推广到 GRPO 及其后续变体的统一第一性原理推导；
- 把所有方法纳入同一目标函数框架，并显式分解为"轨迹概率 $p_\theta(\tau)$"与"奖励 $R(\tau)$"两个维度；
- 借此识别出"耦合失效"场景：单一维度的修正（仅修轨迹采样或仅修 reward）不足以解决，必须联合修改。

**方法**
作者以期望奖励 $\mathbb{E}_{\tau\sim p_\theta}[R(\tau)]$ 为出发点，推导出每种现有方法（REINFORCE、PPO、DPO、GRPO、DAPO 等）都对应于在轨迹维度与奖励维度上的特定改写。通过把每种"trick"映射回这两条轴，论文绘制出策略优化算法的"二维地图"，并标出当前研究尚未覆盖的边界区域与组合失败模式。

**实验**
论文以理论分析为主，没有给出新的端到端实验对比，但通过案例说明在哪些情形下单维修正必然失败，为下一代算法的设计指出了具体的改进方向。

**结论**
对当前 RL-for-LLM-reasoning 文献的"算法暴增"提供一个统一的解释框架，方便研究者判断手头的 trick 究竟在改"轨迹"还是改"奖励"，并指引"必须联合修两侧"的复合修正路线。

---

## 3. Navigating Unreliable Parametric and Contextual Knowledge: Explicit Knowledge Conflict Resolution for LLM Inference

**基本信息**
- 作者: Huang Peng, Jiuyang Tang, Weixin Zeng, Hao Xu, Xiang Zhao
- 发布: 2026-06-18
- 会议/期刊: arXiv 预印本 (cs.AI)
- 引用数: 0 (新文)
- arXiv: [2606.20245](https://arxiv.org/abs/2606.20245)

**主要贡献**
- 把"LLM 参数化知识不可靠 + 检索到的上下文知识也不可靠"这一现实场景显式建模，跳出以往"二选一"的假设；
- 提出 **MACR (Multi-Agent Conflict Resolution)** 框架，把推理过程拆为置信度评估、规则归纳、冲突分析与一致性修复四步；
- 利用修正后的 semantic entropy 作为模型自我置信度的度量，动态决定是依赖内部知识还是检索外部上下文。

**方法**
MACR 包含三类专门 agent：(1) 规则归纳 agent 从上下文中抽取可验证规则；(2) 冲突分析 agent 把候选答案与内/外知识进行对照、定位冲突来源；(3) 一致性修复 agent 选择并解释最终答案。框架在每一步都生成可读的推理痕迹，使最终决策具有可解释性，而不是简单的"哪个分数高就用哪个"。

**实验**
在多个知识冲突基准上（涵盖参数化错误与上下文错误两种来源），MACR 相比当前 SOTA 基线显著提升答案准确率，同时输出可读的冲突解释，便于事后审计。

**结论**
这篇论文把 RAG / 知识增强推理领域长期回避的"两边都可能错"问题摆到台面上，给出一个可执行的多 agent 推理 + 显式冲突推断的解决方案，是把 LLM reasoning 推向更可靠现实应用的一步。

---

## 📊 今日小结

今日三篇均聚焦 RL-for-Reasoning 与可靠推理：
- 一篇为 RLVR 训练给出**实操级 token-级 clip 自适应方案** (ACPO)；
- 一篇把 GRPO 家族放进**统一第一性原理框架**，方便判断每种 trick 改的是哪一维；
- 一篇瞄准 RAG 场景下**双源知识冲突**，用多 agent 显式推理消解矛盾。

整体方向：RL 训练算法从"经验调参"走向"机制理解 + 自适应"，推理过程从"信谁的"转向"显式拆解+解释"。
