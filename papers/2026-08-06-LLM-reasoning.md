# 📚 每日论文速递 - 2026-08-06

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. Test-Time Scaling in Reasoning LLMs: Inference Regimes, Evaluation, and Reproducibility

**基本信息**
- 作者: Mohsen Hariri, Weicong Chen, Nahal Shahini, Vikash Singh, Kai Ye, Amirhossein Samandar, Debargha Ganguly, Sreehari Sankar, Yanyan Zhang, Shouren Wang, Jerry Peng, Biyao Zhang, Michael Hinczewski, Vipin Chaudhary
- 发布: 2026-08-04
- 会议/期刊: arXiv 预印本 (cs.LG)
- 引用数: 0 📈
- arXiv: [2608.04001](https://arxiv.org/abs/2608.04001)

**主要贡献**
提出了 test-time scaling 的系统性理论框架，指出当前文献把多种截然不同的推理算法（单轨迹延长思考、多候选采样聚合、部分状态搜索）混同在单一"预算"标量下报告结果，导致跨研究不可比。论文从推理机制、评测原则、可复现性三个维度给出统一账目，并发布超过 20 亿条完整推理轨迹（含 verifier 与 token 级信号）。

**方法**
将 test-time scaling 形式化为自回归模型隐式前缀树上的预算化推理（budgeted inference over the implicit prefix tree），区分三种结构性 regime：(1) 单轨迹顺序扩展；(2) 叶级扩展 + 终端归约（投票/验证）；(3) 前缀级扩展（搜索）。评测上主张把整个推理系统作为被评对象，提出 evaluation profile，其坐标和简单泛函可恢复或界定常见 repeated-sampling 指标，并要求按协议匹配报告算力与不确定性。可复现性上区分 exact replay 与 distributional reproducibility，并列出各自所需的 artifact。

**实验**
在 broad-knowledge、符号推理、竞赛数学三类基准上应用上述原则，整理 open-weight reasoning 生态的模型侧与接口侧机制，并汇编 20 亿+条完整推理轨迹用于发布。

**结论**
Test-time scaling 的结果必须连同推理协议、算力账目一起报告才有可比性；论文提供的三轴框架和轨迹数据集为后续推理算法研究建立了统一的评测与复现基础。

---

## 2. ReflectRL: Learning from Golden Negative Trajectories via Reflective-to-Direct Reasoning

**基本信息**
- 作者: Jinhe Bi, Chennan Zhou, Zengjie Jin, Aniri, Shuo Lu, Wenke Huang, Hu Cao, Xun Xiao, Zhihong Zhu, Volker Tresp, Fei Shen, Yunpu Ma, Tat-Seng Chua
- 发布: 2026-08-04
- 会议/期刊: arXiv 预印本 (cs.AI)
- 引用数: 0 📈
- arXiv: [2608.03972](https://arxiv.org/abs/2608.03972)

**主要贡献**
提出 "Golden Negative Trajectories" 概念：专家模型在难题上失败的轨迹通常被当作负样本丢弃，但它们仍含有宝贵的推理信号——不是作为模仿对象，而是作为反思材料。论文识别出 Reflection Advantage 现象：对难题而言，反思一条有缺陷的轨迹比从零直接求解更容易、更有效。

**方法**
ReflectRL 是一个轻量、即插即用的 on-policy 训练框架，分两阶段：(1) 利用 Golden Negative Trajectories 激发 Reflective Reasoning（模型对失败轨迹进行反思式推理）；(2) 通过 Reflective-to-Direct Policy Transition 把反思中习得的推理行为迁移回直接推理模式，使推理能力在无失败轨迹输入时也能保持。

**实验**
覆盖 9 个基准、4 种 LLM backbone、4 种 on-policy 训练方法（作为宿主框架），ReflectRL 在各组合上一致提升推理性能，且额外开销极小。

**结论**
专家失败轨迹不应被丢弃：把"反思失败"作为中间训练信号再迁移回直接推理，是对现有 trajectory-guided on-policy 训练的通用增强，在专家无法给出正确示范的难题上尤其有价值。

---

## 3. The Tell-Tale Trace: Detecting Reasoning Failures in LLMs Using Chain-of-Thought Dynamics

**基本信息**
- 作者: Shashwat Sourav, Aishwarya Balwani
- 发布: 2026-08-04
- 会议/期刊: arXiv 预印本 (cs.LG)
- 引用数: 0 📈
- arXiv: [2608.03291](https://arxiv.org/abs/2608.03291)

**主要贡献**
提出通过 CoT 的动态结构（而非单步语义正确性）来区分成功与失败的推理过程，且不依赖"CoT 忠实反映内部计算"的假设。发现了分布在整条轨迹上的失败模式（如 premature verification collapse），这类失败无法通过检查单个错误步骤发现。

**方法**
在可验证、复杂度可控的布尔可满足性 (SAT/UNSAT) 任务上研究多个 LLM，使对比可以在每个模型的能力边界附近进行。将 CoT 句子按推理功能打标签，分析推理轨迹的时序动态：检查行为何时开始、操作是否重复、结论何时敲定。基于诊断结果设计针对性的 proof-search prompt 干预。

**实验**
SAT 问题上，错误轨迹更早进入子句检查、重复相似操作、更早敲定答案（premature verification collapse）；UNSAT 问题上，模型倾向于错误地走向 SAT 结论，检查候选赋值而不是跨构造情形推导矛盾。针对性 proof-search prompt 干预将 Llama3-70B 准确率从 13.3% 提升到 85%，纠正了 84.6% 的此类错误。

**结论**
能力失败会表现为可见推理结构中分布式、任务相关的变化；即使不假设 CoT 的语义忠实性，其动态特征也足以诊断并修正推理失败，为轻量级推理监控提供了新途径。

---

## 📊 今日统计

- 搜索关键词: LLM reasoning
- 新收录论文: 3 (全部为 2026-08-04 v1 预印本)
- 今日主题分布: 推理评测与复现框架 ×1, RL 后训练 ×1, CoT 失败诊断 ×1
- 备注: 2607.29211 复查 /abs 页仍无 Comments 字段，维持 preprint 记录
