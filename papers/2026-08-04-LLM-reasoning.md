# 📚 每日论文速递 - 2026-08-04

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. Knowing When to Quit: Diagnosing and Training LLMs to Abort Futile Reasoning

**基本信息**
- 作者: Xinyan Guan, Jiali Zeng, Chunlei Xin, Yaojie Lu, Hongyu Lin, Xianpei Han, Le Sun, Fandong Meng
- 发布: 2026-07-31 (v1)
- 会议/期刊: arXiv 预印本（S2 venue 字段显示 ACL，/abs 页无 Comments 佐证，暂记预印本）
- 引用数: 1 📈
- arXiv: [2607.29211](https://arxiv.org/abs/2607.29211)

**主要贡献**
系统刻画 LLM 在超出自身能力任务上的"无效推理"(futile reasoning) 现象：模型会生成计算昂贵却语义空洞的推理，产出貌似合理实则错误的推导误导用户。分析揭示了普遍的能力越界 (capability overreach) 与能力-行为间的系统性失准，并提出 CaRL (Capability-aligned Reinforcement Learning) 训练模型在能力边界处主动放弃推理。

**方法**
诊断侧：系统分析发现主导失败模式是 specious reasoning——输出表面有效但含细微错误，且随任务难度升级。训练侧：CaRL 通过两个机制将行为与能力边界对齐：(1) reward shaping 激励在无效推理场景下选择拒答而非继续推理；(2) hindsight refusal augmentation 把失败样本转化为拒答监督信号。

**实验**
在不同难度任务上实验表明，CaRL 大幅减少无效推理，同时在各难度层级上保持原有性能，实现能力对齐的行为而不牺牲效用。

**结论**
LLM 推理的可信性问题不仅在于推得对不对，还在于该不该推；把"知道何时放弃"作为训练目标，可在不损失能力的前提下显著削减貌似合理的错误推导。

---

## 2. Demystifying Entropy-based Selection for Chain-of-Thought Compression in Large Reasoning Models

**基本信息**
- 作者: Sara Candussio, Daniel Scalena, Luca Bortolussi, Elisabetta Fersini, Malvina Nissim, Gabriele Sarti
- 发布: 2026-07-30 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.28707](https://arxiv.org/abs/2607.28707)

**主要贡献**
对流行的基于熵的 CoT 压缩方法做了严格的鲁棒性检验与因果分析：发现无论低熵还是高熵步骤选择，在所有评测设置下都不比随机剪枝更好；并给出因果证据表明任务信息分布在整条推理链上，而非集中于少数可被启发式识别的 token。

**方法**
跨多个模型与推理任务系统对比低熵/高熵 CoT 步骤选择与随机剪枝；进一步从句子级下探到 token 级，分析保留低熵 token 的效果来源；最后用 activation patching——将一小部分 CoT token 替换为其原始激活——检验任务信息是否集中于这些 token。

**实验**
熵选择在所有评测设置中均无优势；保留低熵 token 仅在数学基准上看似有效，归因于数字 token 天然低熵且在数学题中承载语义内容；对少量 CoT token 做激活修补即可恢复接近完整推理链的性能，证明信息分布式存在。

**结论**
熵不是识别关键推理步骤的可靠信号；CoT 压缩启发式的表面收益可能是 token 统计特性的伪影，任务信息在推理链中是分布式编码的。

---

## 3. How Hard Does It Think? Analyzing Step-Aware Reasoning Energy in LLM Chain-of-Thought Trajectories

**基本信息**
- 作者: Hui Wei, Junda Wu, Sheldon Yu, Sizhe Zhou, Yizhu Jiao, Ming Zhong, Bowen Jin, Tong Yu, Shijia Pan, Jiawei Han, Julian McAuley
- 发布: 2026-07-28 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.28674](https://arxiv.org/abs/2607.28674)

**主要贡献**
提出 SARE (Step-Aware Reasoning Energy)——一个在单个 CoT 步骤粒度上量化模型"计算努力"的几何框架，解决现有可解释性方法依赖输出信号或把处理深度压缩为轨迹级标量、步骤级努力不可见的问题。

**方法**
用相邻 transformer 层间 token 隐状态 Gram 矩阵的 CKA (Centered Kernel Alignment) 度量每个 CoT 步骤的表示变化能量，捕捉 token 间关系结构且无需特征向量对齐或聚类对应；再将 CoT 轨迹建模为潜在语义状态间的转移，把能量置于推理的语义进程中。

**实验**
在 6 个推理基准和 3 个开源 LLM 上：推理能量在不同步骤类型间高度非均匀，呈现轨迹级指标不可见的相变式转换；错误轨迹在关键推理节点处能量系统性偏低；基于 SARE 的特征在多数设置下匹配或超过基于输出的置信度基线。

**结论**
模型内部的几何动态编码了超越表面信号的预测信息；步骤级"推理能量"为诊断 CoT 轨迹质量提供了新的内部视角。

---
