# 📚 每日论文速递 - 2026-07-05

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含预印本
**论文数量**: 3

---

## 1. Active-GRPO: Adaptive Imitation and Self-Improving Reasoning for Molecular Optimization

**基本信息**
- 作者: Xuefeng Liu, Mingxuan Cao, Qinan Huang, Thomas Brettin, Rick L. Stevens, Le Cong (Stanford / UChicago / Argonne)
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.00531](https://arxiv.org/abs/2607.00531)

**主要贡献**
针对科学推理任务（指令驱动的分子优化）中两个训练难题——answer-only SFT 会瓦解多步推理能力、RLVR 反馈过于稀疏——提出 **active reasoning** 新范式：策略在每个实例上主动决定何时模仿参考答案、何时强化自身发现，并持续升级所模仿的参考。

**方法**
将该范式实例化为 **Active-GRPO**，在 GRPO 基础上引入两个机制：(1) active imitate-reinforce——按实例自适应地在"模仿参考"与"强化自我探索"间切换；(2) active referencing——用策略自身发现的更优解持续替换数据集中较弱的参考，打破参考质量对性能的天花板限制。

**实验**
在指令驱动的分子优化任务上评测，对比 answer-only SFT、标准 RLVR 和 reference-guided policy optimization 等基线，检验参考质量与性能上限的耦合关系。

**结论**
主动决定模仿与强化时机、并动态升级参考，能同时缓解 SFT 推理坍塌与 RLVR 稀疏反馈问题，为 LLM 科学推理训练提供了更鲁棒的 RL 配方。

---

## 2. Reasoning LLM Improves Speaker Recognition in Long-form TV Dramas

**基本信息**
- 作者: Yuxuan Li, Lingxi Xie, Xinyue Huo, Jihao Qiu, Jiacheng Shao, Pengfei Chen, Jiannan Ge, Kaiwen Duan, Qi Tian
- 发布: 2026-07-02
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.02504](https://arxiv.org/abs/2607.02504)

**主要贡献**
提出 **DramaSR-532K**——首个长篇电视剧说话人识别的大规模基准，包含 53.2 万条标注对白、900+ 个角色，要求融合听觉、语言和视觉线索；并提出基于大型推理模型（LRM）的 **DramaSR-LRM** 方法。

**方法**
DramaSR-LRM 让大型推理模型通过**多模态工具调用（multimodal tool-use）自主聚合上下文证据**，综合声纹、剧情语言线索与视觉信息完成高保真的话语-角色归属，并输出可验证的 chain-of-thought 轨迹和工具调用日志，提升多模态决策的可解释性。

**实验**
在 DramaSR-532K 上与现有说话人识别基线对比，重点考察声学生物特征天然不可靠的短话语场景。

**结论**
DramaSR-LRM 显著超越现有基线，尤其在短话语上优势明显，表明推理型 LLM + 工具调用是叙事视频理解中说话人归属的有效范式。

---

## 3. AGI Maze as a Benchmark Framework for World-Modeling Agents

**基本信息**
- 作者: Alexey Potapov
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.00627](https://arxiv.org/abs/2607.00627)

**主要贡献**
提出 **AGI Maze**——一个轻量级基准框架，用于检验智能体能否在**部分可观测、有状态、需要记忆和隐状态假设**的环境中构建并使用世界模型，而非仅在静态文本上做模式补全式"推理"。

**方法**
提供一族网格迷宫任务，具有干净的 API 和多个难度等级，无需高维感知输入。设计目标是迫使智能体学习并使用世界状态表征，而不是从现成观测中归纳局部规则。另引入一个允许用消息历史作为工作记忆来构建观测描述的基线智能体。

**实验**
对多个 vanilla LLM 在简单迷宫上进行评测：模型在推理时无法在内部表征迷宫结构；带工作记忆的基线智能体虽有改善，但在对人类绰绰有余的步数预算内，仍无法可靠解决小规模迷宫。

**结论**
文本推理能力不等于世界建模能力：当环境部分可观测且有状态时，当前 LLM 的"推理"显著退化。AGI Maze 为评测世界建模型智能体提供了低成本、可控难度的测试床。

---

*注: 三篇论文均为最近 4 天内发布的新预印本，Semantic Scholar 引用数暂记为 0，将在后续 `--update` 中刷新。*
