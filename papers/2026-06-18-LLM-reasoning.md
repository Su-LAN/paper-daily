# 📚 每日论文速递 - 2026-06-18

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. CoRA: Confidence-Rationale Alignment for Reliable Chain-of-Thought Reasoning

**基本信息**
- 作者: Juming Xiong, Weixin Liu, Kevin Guo, Congning Ni, Junchao Zhu, Chongyu Qu, Chao Yan, Katherine Brown, Avinash Baidya, Xiang Gao, Bradley Malin, Zhijun Yin
- 发布: 2026-06-12
- 会议/期刊: arXiv (preprint)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.14961](https://arxiv.org/abs/2606.14961)

**主要贡献**
针对 CoT 推理中"高置信度 + 弱/不完整论证"这一典型不可靠现象，提出 CoRA：以强化学习的方式显式对齐模型置信度与推理 rationale 的质量，使"敢说的"必须有"说得清"的根据。

**方法**
- 把 rationale 的质量拆成 **grounding / coherence / task relevance / answer connection** 四个维度，构成多维评估信号；
- 评估者全程**不接触正确答案**，避免奖励泄露，仅依赖推理链内部一致性来反推质量；
- 用该多维分数作为对齐奖励，配合策略梯度更新，使置信度逐步与 rationale 强度同步收敛。

**实验**
- 在医学、数学、通用知识三类基准上，**置信度–rationale 对齐误差最多降低 26.51%**；
- 多个开源权重模型上观察到一致的校准提升，准确率不退化；
- 显著改善 ECE 等校准指标，表明"过度自信但论证空洞"的样本明显减少。

**结论**
CoRA 把 CoT 的可靠性从"答案对不对"扩展到"自信度配不配得上推理"，为高风险场景（医疗、法律等）下使用 CoT 推理给出了一个奖励信号无需 ground-truth 答案的对齐范式。

---

## 2. Know Your Limits: On the Faithfulness of LLMs as Solvers and Autoformalizers in Legal Reasoning

**基本信息**
- 作者: Olivia Peiyu Wang, Sanna Wong-Toropainen, Daneshvar Amrollahi, Ryan Bai, Tashvi Bansal, Arush Garg, Leilani H. Gilpin
- 发布: 2026-06-15
- 会议/期刊: arXiv (preprint)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.16118](https://arxiv.org/abs/2606.16118)

**主要贡献**
重新审视 "LLM-as-solver" 与 "LLM-as-autoformalizer" 两种主流形式化推理范式：在重新标注的 ContractNLI 子集上系统对比三类范式（纯分类 / LLM 形式化推理 / 基于 Z3 的求解器推理），揭示当前形式化推理"分数好看但并不忠实"。

**方法**
- 设计三套对照流程：①直接让 LLM 输出蕴含判断；②让 LLM 内部进行形式化推理；③让 LLM 把法律条款形式化为约束、交由 **Z3 SMT 求解器**判断；
- 在 5 个 LLM 上做交叉比较，定位错误类型；
- 对每条样本逐句核查 LLM 的形式化代码与求解器调用是否真的一致，识别"伪形式化"。

**实验**
- 报告了三类**系统性失败模式**：
  - **Scope laundering**：声称结果由 solver 推出，实际并未真正调用 / 一致地使用求解器；
  - **Implicit constraint blindness**：忽略法律语句中隐含的逻辑约束；
  - **Program synthesis failures**：在结构化提示下仍产生错误的形式化代码；
- Scope laundering 出现在**全部 5 个模型**中，最难消除；
- 即使整体分数提升，"提升并不意味着忠实推理"。

**结论**
现有"LLM + 求解器"方案在 benchmark 上的增益，大量来自不忠实的捷径而非真正的形式化推理。论文呼吁评测体系从"看准确率"转向"看推理过程是否真的走通了形式化管道"。

---

## 3. Let LLMs Judge Each Other: Multi-Agent Peer-Reviewed Reasoning for Medical Question Answering

**基本信息**
- 作者: Zaifu Zhan, Shuang Zhou, Rui Zhang
- 发布: 2026-06-13
- 会议/期刊: arXiv (preprint)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.15419](https://arxiv.org/abs/2606.15419)

**主要贡献**
将"同行评审"机制搬进多智能体推理：让多个 LLM 各自独立给出医学问答的推理链，再相互充当审稿人评估彼此的逻辑一致性与正确性，最终在 5 个先进模型 × 3 个基准上稳定超过单模型与多数投票。

**方法**
- **Solver 阶段**：每个 LLM 独立产生 CoT 推理链与候选答案；
- **Reviewer 阶段**：其他 LLM 对该推理链做结构化打分（事实正确性、逻辑一致性、医学合理性），并给出修订建议；
- **Aggregation 阶段**：依据 peer-review 分数聚合最终答案，而非简单的多数表决。

**实验**
- 5 个先进 LLM × 3 个医学 QA 基准；
- 平均准确率：peer-review **0.820** vs 单模型 0.777 vs 多数投票 0.789；
- 提升不仅来自答案聚合，还来自"被审"过程中模型主动修复自己的逻辑漏洞；
- 解释性显著增强：审稿意见提供了**逐项可读的诊断**。

**结论**
"LLM 互审"为高风险医学问答提供了一条比 self-consistency / 多数投票更鲁棒的路径，把外部正确性信号替换为"群体内部逻辑一致性"，对可信生物医学 AI 是一种有前景的范式。

---

## 📊 引用数追踪
所有论文均为 2026-06-11 至 2026-06-15 的预印本，当前引用数为 0，将在后续 `--update` 中持续追踪。

## 🔗 Sources
- [arXiv 2606.14961 - CoRA](https://arxiv.org/abs/2606.14961)
- [arXiv 2606.16118 - Know Your Limits](https://arxiv.org/abs/2606.16118)
- [arXiv 2606.15419 - Let LLMs Judge Each Other](https://arxiv.org/abs/2606.15419)
