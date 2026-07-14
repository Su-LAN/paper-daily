# 📚 每日论文速递 - 2026-07-15

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高相关预印本
**论文数量**: 3

---

## 1. LLMs as a Jury: Cross-Model Consensus Can Outperform Process Reward Models for LLM Reasoning

**基本信息**
- 作者: Ning Liu
- 发布: 2026-07-11
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.10139](https://arxiv.org/abs/2607.10139)

**主要贡献**
提出把多个独立训练的 LLM 当作"陪审团"，用跨模型共识作为推理链选择信号，替代自一致性（self-consistency）和训练好的过程奖励模型（PRM），并推导出一个无参数的数学定律，可以从陪审团统计量直接预测共识准确率。

**方法**
对同一问题采样多个候选推理链后，不再依赖单模型多数投票或 PRM 打分，而是让多个异构模型对候选答案进行投票。核心机制是"错误去相关"（error decorrelation）：独立训练的模型犯错方式不同，错误答案彼此发散，而正确答案会聚成簇，因此跨模型一致性成为可靠的正确性信号。

**实验**
在 7 个基准上验证，跨模型陪审团一致优于 PRM 选择，数学推理任务上优势尤为明显；推导的共识准确率预测定律与实测结果吻合。

**结论**
测试时扩展（test-time scaling）中，跨模型共识是一种免训练、可预测的验证机制；其固有局限在于模型间共享的错误认知（shared misconceptions）无法被去相关消除。

---

## 2. Depth-Entropy Guided Sampling for Training-Free LLM Reasoning

**基本信息**
- 作者: Zibin Meng, Peng Xie, Kani Chen
- 发布: 2026-06-19 (v1)，2026-07 公告
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.09693](https://arxiv.org/abs/2607.09693)

**主要贡献**
发现更强的推理模型在层间熵曲线上呈现"晚期坍缩"（late collapse）现象，并将这一内部动力学信号用作推理链质量的免训练评分器，避免昂贵的 RL 后训练。

**方法**
将序列似然与逐层深度熵信号结合，构造质量评分，再用 MCMC 采样在候选推理链空间中进行引导采样。整个流程不需要任何训练或标注数据，只利用 transformer 内部的层间熵动态。

**实验**
在 3 个开源权重模型、4 个基准上取得与需训练方法有竞争力的结果；在似然方法失效的域外（out-of-domain）任务上优势明显；额外计算开销极小。

**结论**
Transformer 内部的深度-熵动态是可直接利用的推理质量信号，为免训练的测试时推理增强提供了新途径。

---

## 3. TimeThink: Reasoning with Time for Video LLMs

**基本信息**
- 作者: Handong Li, Longteng Guo, Zikang Liu, Dongze Hao, Yepeng Tang, Zijia Zhao, Jie Jiang, Zhiwei Jin, Chen Chen, Haonan Lu, Jing Liu
- 发布: 2026-07-06
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈
- arXiv: [2607.05089](https://arxiv.org/abs/2607.05089)

**主要贡献**
提出一个面向 Video-LLM 的强化学习框架，把"时序线索步骤"（temporal clue steps）作为基本优化原语，通过步级时序过程奖励解决视频推理中的信用分配问题；并构建了带自动时序证据标注的 TimeThink-RFT-20K 数据集。

**方法**
在 RL 训练中引导模型显式发现时序证据：模型的推理轨迹被分解为时序线索步骤，每一步根据其定位的证据片段与自动推导的真值片段的匹配程度获得步级过程奖励，从而实现比结果级奖励更细粒度的信用分配。

**实验**
在多个视频推理与时序定位（temporal grounding）基准上均取得提升，验证了步级时序奖励相对结果奖励的优势。

**结论**
把时间维度显式纳入推理原语并配合步级过程奖励，能显著增强 Video-LLM 的时序推理与证据定位能力。

---

## 📊 今日统计

| # | 论文 | venue | 引用 |
|---|------|-------|-----|
| 1 | LLMs as a Jury | arXiv preprint | 0 |
| 2 | Depth-Entropy Guided Sampling | arXiv preprint | 0 |
| 3 | TimeThink | arXiv preprint | 0 |

*注: 三篇均为近 10 天内新发布论文，引用数尚未累积。TimeThink 搜索页曾显示 ICML 2026 接收，但 arXiv 摘要页 comments 仅标注 "14 pages"，暂按预印本记录，待后续引用更新时复核。*
