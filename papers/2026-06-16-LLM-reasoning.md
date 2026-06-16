# 📚 每日论文速递 - 2026-06-16

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. ReSum: Synergizing LLM Reasoning and Summarization with Reinforcement Learning

**基本信息**
- 作者: Xucong Wang, Ziyu Ma, Yong Wang, Shidong Yang, Hailang Huang, Renda Li, Pengkun Wang, Xiangxiang Chu
- 发布: 2026-06-11
- 会议/期刊: arXiv (preprint)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.13316](https://arxiv.org/abs/2606.13316)

**主要贡献**
针对长程推理中"不必要的冗长 rollout 损害推理连贯性"这一痛点，提出一个把"推理"和"自我总结"用 RL 串起来的框架 ReSum，让模型在生成轨迹中显式压缩自己已经想清楚的部分，再继续往下推。

**方法**
- 引入"自总结 (self-summarization)"算子，当 token 级熵升高、推理开始发散时由模型主动触发；
- 在 RLVR (Reinforcement Learning with Verifiable Rewards) 框架下，对总结句采用对比掩码：自发触发时将其遮蔽，再在其他位置注入，迫使策略学习"何时该总结"而不是"复读冗长前缀"；
- 目标函数同时奖励答案正确性与摘要质量，缓解因错误前缀累积导致的错误传播。

**实验**
- 在数学、代码、长链推理基准上，平均准确率提升 4%；
- rollout 长度平均缩短 18.6%，token 级熵显著下降；
- 验证自总结确实"稳定生成"，且对 1.5B–32B 多个规模都有收益。

**结论**
"先想，再总结自己想了什么，再接着想"是一种简单但有效的推理结构先验。把它做成 RL 中可优化的算子，比纯 prompt 级 CoT 压缩更鲁棒，给 long-horizon reasoning 的 token 经济性提供了新的解。

---

## 2. From Symbolic to Geometric: Enabling Spatial Reasoning in Large Language Models

**基本信息**
- 作者: Chen Chu, Bita Azarijoo, Li Xiong, Khurram Shafique, Cyrus Shahabi
- 发布: 2026-06-03
- 会议/期刊: arXiv (preprint, multimodal LLM 方向)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.04381](https://arxiv.org/abs/2606.04381)

**主要贡献**
指出当前 LLM 的"空间推理"本质是对空间语言的模式匹配，并非真正的几何推理。提出 Spatial Language Model (SLM)：第一个把"位置"当作一等模态的多模态 LLM，直接在学到的空间表征上做几何运算，而不是依赖文本描述。

**方法**
- 将坐标 / 多边形 / 拓扑关系等空间对象编码为可微分的几何 token，与文本 token 共享 Transformer 主干；
- 构建 Spatial Instruction Dataset，把"几何操作 ↔ 空间表征 ↔ 自然语言"三者对齐；
- 发布 SpatialEval 基准，覆盖距离推理、包含关系、路径规划、拓扑变换等多维空间技能。

**实验**
- 在 SpatialEval 上显著优于基于符号推理或文本描述的现有 LLM 基线；
- 在 distance / containment / routing 三类任务上提升尤其明显；
- 跨模态消融显示"几何 token"贡献远大于多分辨率文本坐标提示。

**结论**
把空间作为一种独立模态、用几何运算原生进入推理，是绕开 "LLM 把世界当字符串" 这一缺陷的合理路径。对地图、机器人、GIS、具身 AI 等空间密集型应用是一种通用的能力基底。

---

## 3. Beyond Representational Alignment with Brain-Guided Language Models for Robust Reasoning

**基本信息**
- 作者: Mingqing Xiao, Kai Du, Zhouchen Lin
- 发布: 2026-06-10
- 会议/期刊: arXiv (preprint, neuro-AI 交叉)
- 引用数: 0 📈 (新论文)
- arXiv: [2606.11893](https://arxiv.org/abs/2606.11893)

**主要贡献**
不仅观察"LLM 表征与人脑活动部分对齐"这一现象，而是更进一步：把脑信号作为可用的监督源，反向去增强 LLM 的推理鲁棒性。提出 brain-guided 框架，用 task-fMRI 信号在推理时干预 / 训练阶段微调 LLM 内部表征。

**方法**
- 收集人类做演绎推理任务时的 fMRI 数据，定位与推理高度相关的脑区表征；
- 在 LLM 隐藏态空间引入"脑对齐损失"，把模型表征推向脑信号子空间；
- 同时支持 inference-time intervention（对隐藏态做向量注入）和 training-time fine-tuning 两种使用方式。

**实验**
- 在 1.5B–72B 多个模型规模上一致获得鲁棒性收益，最高绝对精度提升约 13%；
- 该提升与"纯语言监督"正交：在已经做过 instruction tuning 的模型上仍能继续涨；
- 在未见过的推理类型上呈现 transfer 效应，说明脑信号注入的是较通用的推理偏置，不是任务专属补丁。

**结论**
"脑表征"不只是评估 LLM 的镜子，也可以作为可优化的训练信号。这条 brain-in-the-loop 路线，给 LLM 推理鲁棒性的提升提供了一个独立于"更多数据 + 更多算力"的新维度，是 cognitive-aligned AI 一个有意思的早期里程碑。

---

**📝 备注**
- 三篇均为 2026 年 6 月最新预印本，引用数尚未累积，但方向（RL × 推理压缩、几何模态、脑信号引导）都对应当前 LLM reasoning 的关键瓶颈；
- ReSum 已在 RL × LLM 社区获得较多关注，预计将快速积累引用；
- 后续可用 `--update` 模式跟踪三者引用增长。
