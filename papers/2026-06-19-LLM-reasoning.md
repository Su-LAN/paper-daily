# 📚 每日论文速递 - 2026-06-19

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + arXiv 最新预印本
**论文数量**: 3

---

## 1. ExpRL: Exploratory RL for LLM Mid-Training

**基本信息**
- 作者: Violet Xiang, Amrith Setlur, Chase Blagden, Nick Haber, Aviral Kumar
- 发布: 2026-06-15
- 会议/期刊: arXiv (preprint)
- 引用数: 0 (刚发布)
- arXiv: [2606.17024](https://arxiv.org/abs/2606.17024)

**主要贡献**
针对稀疏奖励强化学习对基模型先验依赖严重的问题，提出 ExpRL：把人类撰写的问答语料当作"奖励脚手架"（reward scaffolds）而非模仿目标，让模型在 mid-training 阶段通过 RL 主动探索而非被动模仿。

**方法**
- **奖励脚手架**: 不再用监督式 token-level 损失，而是用参考答案作为对比基准，让 LLM judge 评估采样推理轨迹与参考方案的匹配度
- **稠密奖励信号**: 同时给予过程级（中间步骤正确性）和结果级（最终答案）奖励，对部分进展也给予正反馈
- **Mid-Training 定位**: 介于预训练与下游 sparse-reward RL 之间，作为更强的初始化方案

**实验**
在数学推理任务上：
- 显著超越 SFT、GRPO（稀疏奖励）和自蒸馏基线
- 为下游 sparse-reward RL 提供更优初始化
- 拓展到混合领域任务仍保持收益，显示通用性

**结论**
当基础模型在目标领域覆盖不足时，传统稀疏奖励 RL 会失败；通过把人工 Q&A 转化为稠密奖励信号，ExpRL 为推理模型的 mid-training 阶段提供了一条可扩展、可迁移的路径。

---

## 2. Dynamic Rollout Editing for Reducing Overthinking in RL-Trained Reasoning Models

**基本信息**
- 作者: Zihao Wei, Wenjie Shi, Liang Pang, Jingcheng Deng, Shicheng Xu, Shasha Guo, Zenghao Duan, Jiahao Liu, Jingang Wang, Huawei Shen, Xueqi Cheng
- 发布: 2026-06-16
- 会议/期刊: arXiv (preprint)
- 引用数: 0 (刚发布)
- arXiv: [2606.17890](https://arxiv.org/abs/2606.17890)

**主要贡献**
将 RL 训练后推理模型的"过度思考"（overthinking）问题首次重新框定为**训练时的信用分配问题**，而非传统解码阶段问题。提出 Dynamic Rollout Editing (DRE)，在 RL 训练循环内直接编辑 rollout 以校正信用分配。

**方法**
- **诊断**: GRPO 等方法在序列层级分配信用，无法区分"到达答案的前缀"和"答案后的冗余继续"
- **DRE 流程**:
  1. 识别 group 内已正确达答的轨迹中存在多余推理的样本
  2. 保留触达解的前缀，编辑掉后续不必要的思考
  3. 在同一 RL group 内强化对"编辑后较短轨迹"的偏好信号
- **关键性质**: 不惩罚为达到正确答案所必需的推理，只压缩冗余尾巴

**实验**
- 在多种推理任务上有效降低不必要的推理长度
- 同时保持甚至提升复杂问题的求解性能
- 与 vanilla GRPO 比较显示明显的 token 效率提升

**结论**
过度思考的根因不在解码，而在 RL 训练阶段的 credit assignment 失衡。DRE 通过在训练时主动编辑 rollout 直接修正这种失衡，为简洁高效的推理模型提供了新的训练策略。

---

## 3. ATLAS: Agentic Test-time Learning-to-Allocate Scaling

**基本信息**
- 作者: Peijia Qin, Qi Cao, Pengtao Xie
- 发布: 2026-06-01
- 会议/期刊: arXiv (preprint)
- 引用数: 0 (刚发布)
- arXiv: [2606.01667](https://arxiv.org/abs/2606.01667)

**主要贡献**
提出 ATLAS：将测试时缩放（test-time scaling）从"手工设计的固定预算/工作流"重塑为**由 LLM 自身控制的智能体调度问题**。LLM 担任 orchestrator，在控制循环中决定何时探索、何时收集证据、何时综合答案。

**方法**
- **Agentic 控制**: LLM orchestrator 端到端拥有控制循环，自主决策推理预算与工作流
- **可扩展动作空间**: `explore` 动作可指定不同的 solver、推理深度或 prompt 策略
- **证据综合**: orchestrator 直接综合各 solver 的输出，消融实验证明这一直接综合是关键
- **多模型扩展 (ATLAS-MM)**: 在动作空间中额外暴露"solver 选择"维度，使 orchestrator 可在多个底座模型间动态切换

**实验**
- **HLE-Verified**: 56.00%（ATLAS-MM 提升至 60.00%）
- **LiveCodeBench**: 82.29%（ATLAS-MM 提升至 85.63%）
- **GPQA-Diamond**: 85.75%
- 在达到上述精度的同时**消耗更少 API 调用**，相比固定工作流基线更高效

**结论**
当模型本身能够推理"现在还该不该多花一些算力"时，test-time scaling 不再需要人工设计预算曲线。ATLAS 为构建可自主调度计算资源的强推理 agent 提供了实用框架。

---

## 📌 当日观察

- **训练侧主题**: ExpRL 与 DRE 同时关注**RL for reasoning** 的两个互补维度——ExpRL 解决"如何让 RL 学到东西"（稠密奖励 + mid-training），DRE 解决"如何让 RL 不学到坏习惯"（过度思考的训练期校正）
- **推理侧主题**: ATLAS 把过去由 prompt 工程师手写的 test-time 流程交还给模型自身，是 agentic reasoning 的代表方向
- **共同信号**: 三篇都在"效率与能力的边界"上做文章——要么更高效地训练、要么更高效地推理
