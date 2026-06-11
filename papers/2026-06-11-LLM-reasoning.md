# 📚 每日论文速递 - 2026-06-11

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. The Tell-Tale Norm: ℓ₂ Magnitude as a Signal for Reasoning Dynamics in Large Language Models

**基本信息**
- 作者: Jinyang Zhang, Hongxin Ding, Yue Fang, Weibin Liao, Muyang Ye, Junfeng Zhao, Yasha Wang
- 发布: 2026-06-04
- 会议/期刊: ICML 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2606.06188](https://arxiv.org/abs/2606.06188)

**主要贡献**
- 发现 hidden states 的 **ℓ₂ 范数是模型推理强度（reasoning intensity）的内生信号**：不需要外部探针或额外训练，直接从前向传播的几何量就能读出模型「正在用多大力气思考」。
- 用 Sparse Autoencoder (SAE) 做诊断工具，定位到推理相关特征的激活在网络**后段层**出现陡增，并给出推理强度与模型几何之间的理论联系。
- 基于该信号提出三种 **training-free 的推理期干预技术**：自适应逐层递归（adaptive layer-wise recursion）、推理状态引导（reasoning state steering）、响应选择（response selection）。

**方法**
作者首先在多个模型家族上做相关性分析：把推理 benchmark 上的题目按所需推理深度分层，观察 hidden state ℓ₂ 范数随层深与 token 位置的变化，发现范数增长曲线与任务推理强度高度相关。随后用 SAE 把 hidden state 分解为可解释特征，确认范数增长主要由后段层中一组「推理特征」的激活贡献，而非数值漂移。在此基础上做因果干预——直接缩放/引导这些方向上的激活，验证范数信号对推理行为有因果作用而非单纯相关。最后把信号产品化为三个推理期工具：按范数判断「这层还没想完」从而自适应地递归后段层；沿推理方向 steering 激活以提升推理强度；以及在多个候选回答间按推理范数轨迹做选择。

**实验**
- 在多种模型架构与推理 benchmark 上验证：ℓ₂ 范数信号与推理强度的相关性稳定成立，跨模型可迁移。
- 因果干预实验显示：增强推理特征方向的激活能改变模型的推理行为，确认信号的因果性。
- 三种推理期技术均不需要任何额外训练，即在推理任务上取得一致增益，且可以组合使用。

**结论**
LLM 的「思考强度」原来一直写在 hidden state 的模长里。ℓ₂ 范数提供了一个零成本、可跨架构使用的推理动态观测窗口，并且可以直接转化为推理期的控制手段。这为 interpretability 与 inference-time scaling 之间架起了一座桥：先读出模型想得多努力，再决定让它想多久、往哪个方向想。

---

## 2. Quantized Reasoning Models Think They Need to Think Longer, but They Do Not

**基本信息**
- 作者: Sanae Lotfi, Polina Kirichenko, Steven Li, Zechun Liu
- 发布: 2026-05-29
- 会议/期刊: arXiv preprint (cs.LG, 高质量预印本)
- 引用数: 0 📈
- arXiv: [2606.00206](https://arxiv.org/abs/2606.00206)

**主要贡献**
- 系统性地研究 **post-training quantization (PTQ) 对 reasoning model 的影响**：激进量化不仅降低准确率，还会让 chain-of-thought 显著变长——量化模型「以为自己需要想更久」。
- 给出一个惊人的失败模式统计：**高达 52% 的量化模型错误案例中，模型其实在中间推理步骤已经得到了正确答案，却没有把它作为最终答案输出**。
- 提出一个 **training-free 的 logit penalty**：只对一组精选的 overthinking 标记 token 施加惩罚，就能把 CoT 长度压缩 12–23%，同时保持甚至提升准确率。

**方法**
作者在数学、代码与科学推理任务上，对多种模型规模与多种量化方法（不同 bit 宽度）做对照实验，逐 token 比较量化模型与全精度模型的输出分布。分析发现：两者的 token-level divergence 并非均匀分布，而是集中在少数关键位置——恰好是模型决定「继续想还是收尾」的分叉点；量化模型在这些位置上不成比例地采样出 overthinking 标记词（如 wait、再检查一遍类的转折 token），从而走进反复自我怀疑的长推理分支。基于这一定位，修复方案非常轻量：维护一个精选的 overthinking token 列表，在解码时对它们的 logit 施加固定惩罚，不需要任何再训练或校准数据。

**实验**
- 覆盖数学 / 代码 / 科学三类推理 benchmark，多种模型尺寸 × 多种 PTQ 方法的组合。
- 量化越激进，准确率下降越多、CoT 越长；其中约一半的失败是「想到了但没说」——中间步骤已含正确答案。
- 加入 logit penalty 后：CoT 长度下降 12–23%，准确率持平或提升，且在不同模型规模和量化方法上结论一致。

**结论**
量化对 reasoning model 的伤害有相当一部分不是「想不出来」，而是「想出来了却停不下来」。失败的根源是少数分叉位置上的 token 分布偏移，而非整体推理能力崩塌。这意味着部署量化推理模型时，一个零成本的解码端干预就能挽回大量损失——比盲目提高 bit 宽度或重新训练便宜得多。

---

## 3. MindZero: Learning Online Mental Reasoning With Zero Annotations

**基本信息**
- 作者: Shunchi Zhang, Jin Lu, Chuanyang Jin, Yichao Zhou, Zhining Zhang, Tianmin Shu
- 发布: 2026-05-29
- 会议/期刊: ICML 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2606.00240](https://arxiv.org/abs/2606.00240)

**主要贡献**
- 提出 **MindZero**：一个完全不需要心理状态标注的自监督强化学习框架，训练多模态 LLM 做**在线 mental reasoning**（实时推断他人的目标 / 信念等心理状态，即 Theory of Mind）。
- 同时解决三个现实难题：(1) 在线推断中对多个心理状态假设做鲁棒的不确定性更新；(2) 实时效率——不能像 model-based 方法那样每步做昂贵的规划搜索；(3) 实际应用中根本不存在标注好的心理状态数据。
- 用 **planner-based estimator** 把「假设是否与观察到的行为一致」变成可自动计算的奖励信号，绕开人工标注。

**方法**
核心思路是把心理状态推断变成一个可自我验证的闭环：模型观察 agent 的行为序列，生成关于其目标/信念的多个假设，然后由一个基于 planner 的估计器检验——如果某个假设为真，理性 agent 接下来应该怎么行动？该预测与实际观察到的行为越吻合，对应假设获得的奖励越高。以此奖励做强化学习，多模态 LLM 学会在每个新观察到来时增量地更新假设分布，而不是每次从头重算。训练完成后，推断只需要 LLM 一次前向生成，不再依赖 planner，因此能做到实时。

**实验**
- 在 gridworld 与 household（家居环境）两类任务上评测在线心理状态推断。
- MindZero 在准确率上超过标准 LLM 提示基线，同时在速度上大幅领先需要在线规划搜索的 model-based 方法——同时拿下「更准」和「更快」。
- 零标注训练范式被验证可行：奖励完全来自行为一致性，无需任何人工心理状态标签。

**结论**
Theory of Mind 推理可以不靠标注数据习得：让模型自己提出心理状态假设、再用「理性行为预测」做裁判，就能用 RL 把慢速 model-based 推理蒸馏成 LLM 的快速直觉。这为社交智能 agent（人机协作、辅助机器人）提供了一条可扩展的训练路线——把昂贵的在线规划成本一次性付在训练期，推理期只剩一次前向。

---
