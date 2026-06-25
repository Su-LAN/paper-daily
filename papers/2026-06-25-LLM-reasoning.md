# 📚 每日论文速递 - 2026-06-25

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 + reasoning 相关高质量预印本
**论文数量**: 3

---

## 1. A Verifiable Search Is Not a Learnable Chain-of-Thought

**基本信息**
- 作者: Harsh Patel
- 发布: 2026-06-20
- 会议/期刊: arXiv preprint (cs.LG, cs.AI, cs.CL)
- 引用数: 0 📈
- arXiv: [2606.21884](https://arxiv.org/abs/2606.21884)

**主要贡献**
挑战了"凡是可以用短程序求解的任务都可以通过 chain-of-thought (CoT) 蒸馏教给语言模型"这一隐含假设。作者在 9 个推理任务（包括算术、密码算式 cryptarithmetic 等）上系统比较了"前向可计算 (forward-computable)"任务与"信息缺乏型搜索 (search-over-information-free-structure)"任务的可学性差异，明确提出："当一个过程的唯一解法是在无信息结构上搜索时，不存在可供模仿的忠实前向 CoT"，因此 CoT 蒸馏方法存在根本性边界。

**方法**
- 模型: 30B Nemotron（3.5B active 参数，MoE 结构），rank-32 LoRA 微调。
- 任务设计: 9 个推理任务，覆盖加减乘除、混合算术、字母替换的 cryptarithmetic 等。
- 训练数据生成: 区分"前向可生成 CoT"和"必须搜索"两类任务，分别合成 CoT 序列。
- 关键诊断: 当模型已经掌握组件级运算（如个位加法）却在 cryptarithmetic 上失败时，作者证明模型实际学到的是"记忆 + 验证"模式，而非真正的搜索过程。
- 替代方案: 对必须搜索的任务，把所有组合解预计算为查找表 (catalog)，再通过检索式 CoT 引导模型。

**实验**
- 前向可计算任务上，CoT 蒸馏几乎完美地把能力迁移到 30B Nemotron。
- cryptarithmetic 类任务上，即使每一步原子运算都正确，整体准确率显著下降，CoT 长度增长也无法弥补。
- Catalog-based 方案在私榜 (Private Leaderboard) 上取得 0.92 的最佳成绩，验证了"把搜索折叠成记忆 + 检索"是可行替代路径。
- 31 页正文，包含 6 张图和 16 张表的详细消融。

**结论**
存在一类推理任务对 CoT 蒸馏天然不可学；理解任务的"前向可计算性"应成为选择训练范式的先决条件。这为近期对 CoT 信仰的反思（latent reasoning、隐式推理）提供了从可计算性角度出发的硬性边界证据，也提示工业系统应优先识别"搜索类"子任务并替换为符号求解器或预计算 catalog。

---

## 2. Randomized YaRN Improves Length Generalization for Long-Context Reasoning

**基本信息**
- 作者: Manas Mehta, Fangcong Yin, Greg Durrett (UT Austin)
- 发布: 2026-06-22
- 会议/期刊: arXiv preprint (cs.CL)
- 引用数: 0 📈
- arXiv: [2606.23687](https://arxiv.org/abs/2606.23687)

**主要贡献**
聚焦"在短上下文上训练、希望在长上下文上做多跳推理"的长度泛化难题。作者将 YaRN 位置外推与 randomized positional encoding 以及 length curriculum 三种思路合成单一方法 Randomized YaRN (R-YaRN)，让训练阶段就采样自远超训练长度的位置编码空间，从而在不增加训练上下文长度的前提下显著提升 16K–128K 区间的多跳长上下文推理表现。

**方法**
- 位置编码: 在 YaRN 的频率重缩放基础上，对每个 batch 随机采样不同的位置 ID 偏移和缩放因子，覆盖出分布的 (OOD) 位置区间。
- 长度课程: 从 2K → 4K → 8K 三阶段渐进式增加序列长度，每个阶段维持随机化位置策略。
- 训练数据: 全部在 ≤ 8K tokens 的样本上训练，但评测覆盖 16K–128K。
- 基线对比: 标准 YaRN、NTK-aware、固定 RoPE 扩展。

**实验**
- BABILong 基准: 在 32K/64K/128K 上对多跳 QA 任务的准确率比标准 YaRN 平均提升 6–12 个百分点。
- Multi-Round Coreference Resolution: 长程指代消解任务上同样观察到一致提升。
- 在训练长度 (≤ 8K) 内无性能损失，验证 R-YaRN 没有损害短上下文能力。
- 消融显示：仅加随机位置或仅加 length curriculum 都不够，三者必须组合才能达到最佳长度泛化。

**结论**
位置编码的 OOD 暴露 + 渐进式 length curriculum 是低成本的长上下文推理增强方案。对于在长输入上做 chain-of-thought / multi-step reasoning 的应用尤其有价值，因为它把长度泛化问题从"必须用 128K 数据训练"转化为"在 8K 数据上随机化位置编码即可"，显著降低长上下文推理模型的训练成本。

---

## 3. Reasoning as Attractor Dynamics: Latent Memory Retrieval via Gibbs-Weighted Energy Minimization

**基本信息**
- 作者: Kanishk Awadhiya
- 发布: 2026-06-23
- 会议/期刊: ICLR Workshop 2026 (CORE-A*)
- 引用数: 0 📈
- arXiv: [2606.24543](https://arxiv.org/abs/2606.24543)

**主要贡献**
将大语言模型重新解读为"高维 Dense Associative Memory"，而不是传统的自回归序列模型，并据此提出一个新的推理 / 检索机制：正确推理对应输出分布上稳定的宽极小值，错误推理则对应不稳定的局部极小值。作者通过基于谱熵 (spectral entropy) 的 Gibbs 加权聚合多条推理路径，让模型"沉降"到鲁棒解上。这与近期 latent reasoning、思维收敛性的研究形成有趣对照，提供了一个能量视角下的推理理论框架。

**方法**
- 理论框架: 将 LLM 视为 Dense Associative Memory，定义每条采样推理路径的"能量"为输出 logits 的谱熵。
- 推理算法 (Gibbs-Weighted Retrieval):
  1. 对同一问题采样 K 条 reasoning paths（带温度的解码）。
  2. 计算每条路径的谱熵能量 E_k。
  3. 用 Gibbs 权重 w_k ∝ exp(−β·E_k) 聚合答案分布。
  4. 取加权后最大概率答案作为最终输出。
- 关键直觉: 高熵 = 浅而不稳定的局部极小值（错误），低熵 = 稳定吸引子（正确）；这与多数投票/self-consistency 不同，权重不是基于"答案出现频率"而是基于"输出分布稳定性"。

**实验**
- 基础模型: Microsoft Phi-3.5 (3.8B)。
- 数据集: GSM8K (数学链式推理)。
- 主结果: 准确率从 84.7% 提升到 90.1% (+5.4 pp)，超过 self-consistency 在相同采样预算下的表现。
- 推理预算分析: 在 K=8 / K=16 / K=32 路径下均一致优于 self-consistency。

**结论**
"推理是吸引子动力学过程"这一框架不仅提供新的解释视角，更可直接转化为推理时的采样聚合算法，对 latent reasoning、self-consistency 提供了能量论上的理论基础。该工作与同期出现的"reasoning is latent, not chain of thought"等观点呼应，暗示下一阶段的推理研究可能从"如何生成更长的 CoT"转向"如何让推理在表示空间中收敛到稳定吸引子"。

---

## 📌 今日小结

今天三篇分别从**可学性边界 (2606.21884)**、**长上下文泛化机制 (2606.23687)** 与**推理动力学理论 (2606.24543)** 三个互补角度，挑战了主流"更多 CoT / 更长上下文 / 更多采样"的直觉：

- 2606.21884 给出了 CoT 蒸馏的根本性边界，提示"搜索类"任务必须借助 catalog/符号系统。
- 2606.23687 用位置编码随机化把长上下文推理的成本从训练长度转移到训练分布。
- 2606.24543 用能量/吸引子视角重构 reasoning，把 self-consistency 升级为基于输出稳定性的 Gibbs 加权聚合。

三者共同指向同一研究主线：**理解推理本身的结构，而非简单堆叠 token / 上下文 / 样本**。
