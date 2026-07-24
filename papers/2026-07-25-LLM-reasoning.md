# 📚 每日论文速递 - 2026-07-25

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. When RLVR Shrinks the Reasoning Boundary: Diagnosing Pass@k Inversion

**基本信息**
- 作者: Todd Zhou
- 发布: 2026-07-12
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.20543](https://arxiv.org/abs/2607.20543)

**主要贡献**
系统诊断 RLVR（可验证奖励强化学习）的 "pass@k 反转" 现象：RLVR 提升单次采样准确率的同时，在大 k 重复采样下策略模型能解出的不同问题反而少于 base model，即推理边界被压缩。

**方法**
给出机制解释——在"边界 prompt"上，稀有的正确轨迹在获得足够强化之前就从采样分布中消失，且无法通过采样恢复；提出 Per-Problem Base Anchoring (PBA)：逐问题锚定并保留 base model 已有的解，只在更安全的 prompt 上选择性优化。

**实验**
在 Omni-MATH-Test 与 MATH500 上，PBA 相比匹配基线同时改善单次尝试（pass@1）与高采样预算（大 k）性能；结论进一步延伸到依赖外部 verifier 的视觉-语言推理任务。

**结论**
"稀有正确轨迹先消失、后无法恢复"是 RLVR 压缩推理边界的机制根源；此类优化风险普遍存在于推理后训练系统，逐问题锚定是简单有效的缓解手段。

---

## 2. MIRROR: Learning from the Other View for Multi-Modal Reasoning

**基本信息**
- 作者: Wen Ye, Yuxiao Qu, Aviral Kumar, Xuezhe Ma
- 发布: 2026-07-23
- 会议/期刊: arXiv 预印本 (preprint)
- 引用数: 0 📈
- arXiv: [2607.21552](https://arxiv.org/abs/2607.21552)

**主要贡献**
发现 VLM 在语义等价的三种视图（纯文本、纯图示、图示+文本）上表现严重不一致——同一几何题文本视图能解、图示视图却失败（或相反）；构建配对多模态几何数据集 ODA-Data（每题三种表示），并提出利用模态间互补性的 RL 方法 MIRROR。

**方法**
对每个问题在所有模态视图上评估模型，选出表现最好的视图作为 teacher，用 reverse-KL 目标将其余视图的策略向 teacher 对齐训练，让"另一个视图"的成功成为监督信号。

**实验**
在几何推理基准上，MIRROR 优于标准 RL，且跨模态行为更准确、更一致。

**结论**
多模态推理的模态间不一致性本身蕴含免费的监督信号；以最优视图为锚的跨视图蒸馏是提升多模态推理一致性的有效途径。

---

## 3. Geo3R: Mitigating Spatial Reasoning Hallucination in Multimodal Large Language Models

**基本信息**
- 作者: Mingyu Wang, Weilin Jin, Wenbo Li, Haoyang Huang, Tong Jia, Ying Li
- 发布: 2026-07-23
- 会议/期刊: ACM MM 2026 (CCF-A)（/abs 页 Comments 原文 "Accepted by ACM MM 2026"）
- 引用数: 0 📈
- arXiv: [2607.21085](https://arxiv.org/abs/2607.21085)

**主要贡献**
界定 MLLM 的"空间推理幻觉"：模型无法从 2D 图像准确建模 3D 空间结构，归纳出三类典型失效场景——透视畸变、物体朝向、视角切换；提出免训练框架 Geo3R。

**方法**
Geo3R 在推理过程中引入显式几何推理（3D 结构先验），无需任何额外训练即可嵌入不同类型的 MLLM。

**实验**
在 3 个基准共 18 个任务上验证，Geo3R 对多种模型均显著降低空间推理错误，且无需重训练。

**结论**
空间幻觉源于 2D→3D 结构建模缺失；显式几何先验可作为即插即用组件缓解该问题。

---

## 📈 引用数更新说明

- 三篇新论文引用数均经 Semantic Scholar API 确认为 0（首轮 18 请求全部 429，重试代理约数分钟后恢复取回 3/3）。
- 全量引用刷新由每日 Citation update 任务单独执行。
