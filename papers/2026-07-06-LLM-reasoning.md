# 📚 每日论文速递 - 2026-07-06

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含预印本
**论文数量**: 3

---

## 1. G-RRM: Guiding Symbolic Solvers with Recurrent Reasoning Models

**基本信息**
- 作者: Timo Bertram, Sidhant Bhavnani, Richard Freinschlag, Erich Kobler, Andreas Mayr, Günter Klambauer (JKU Linz)
- 发布: 2026-07-02
- 会议/期刊: arXiv 2026 (preprint, cs.AI)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.02491](https://arxiv.org/abs/2607.02491)

**主要贡献**
提出 **G-RRM**（Guiding with Recurrent Reasoning Models）神经-符号混合框架：用符号等变的循环推理模型（SE-RRM）作为神经求解器生成完整解提案，去引导经典符号求解器（回溯、SAT），系统回答"神经引导何时能提升符号搜索效率"这一问题。

**方法**
SE-RRM 是 RRM 的符号等变实例化，对更大问题规模具有更好的外推能力。其生成的候选解被注入回溯求解器和 SAT 求解器（Glucose 4.1、CaDiCaL 3.0.0）作为搜索提示；符号求解器保证全局正确性，并可动态覆盖不完美的神经建议。

**实验**
在 9×9 数独等约束满足问题上评测：SE-RRM 单独达到 91.1% 准确率；作为引导时，回溯求解器获得 **33.3× 加速**，Glucose 4.1 获得 1.70× 加速；而 CaDiCaL 3.0.0 因开销主导的设计且无法覆盖注入提示，收益甚微。

**结论**
神经引导在组合搜索空间庞大、且求解器能动态覆盖错误提示时收益最大。该工作为"神经推理模型 + 符号求解器"的分工协作提供了清晰的实证边界。

---

## 2. Perceive-to-Reason: Decoupling Perception and Reasoning for Fine-Grained Visual Reasoning

**基本信息**
- 作者: Hongxing Li, Xiufeng Huang, Dingming Li, Yongliang Shen 等 14 人 (浙江大学 / 阿里巴巴)
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint, cs.CV)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.01191](https://arxiv.org/abs/2607.01191)
- 代码: [ZJU-REAL/Perceive-to-Reason](https://github.com/ZJU-REAL/Perceive-to-Reason)

**主要贡献**
针对高分辨率图像中细粒度视觉线索难以捕捉的问题，提出 **P2R** 框架：将细粒度视觉推理显式解耦为两阶段——先作为 *Perceiver* 定位问题相关证据，再作为 *Reasoner* 基于标注图像和裁剪区域作答，取代现有"反复裁剪/测试时视觉搜索"且不区分感知与推理的做法。

**方法**
提出 **PRA-GRPO**（Perception-Reasoning Alternating GRPO）——一种角色感知的强化学习策略，在"感知聚焦更新"与"推理聚焦更新"之间交替，且仅需最终答案监督，无需中间定位标注。基于 Qwen3-VL-Instruct-2B/4B/8B 实现。

**实验**
P2R 在各模型规模上一致提升：P2R-4B 达到 **V-Star 93.2%、HR-Bench-4K 81.9%、HR-Bench-8K 80.5%**，大幅超越对应 backbone；增益还能泛化到高分辨率基准之外的更广泛多模态推理任务。

**结论**
显式解耦感知与推理是细粒度视觉推理的有效范式；仅靠结果监督的角色交替 RL 即可同时训练出好的定位与推理行为。

---

## 3. OmniView-Space: Reinforcing Spatial Reasoning via Multi-Perspective Spatial Mapping

**基本信息**
- 作者: Xudong Li, Mengdan Zhang, Peixian Chen, Rongrong Ji 等 10 人 (厦门大学 / 腾讯优图 / 北京理工大学)
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint, cs.CV)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.00881](https://arxiv.org/abs/2607.00881)

**主要贡献**
针对 MLLM 空间智能短板——多步推理中无法动态将证据重新锚定到查询要求的相机/物体/方向中心参考系——提出 **OmniView-Space** 框架，通过多模态自我中心证据维持空间一致性。

**方法**
三个核心组件：(1) **MPSM**（多视角空间映射）——将重建几何重新锚定为查询对齐的视觉认知地图 + 文本空间图；(2) **工具引导的自我中心推理**——交错式策略，主动选择查询所需的 ego 锚点并请求对应 MPSM 证据；(3) **认知地图蒸馏**——利用 MPSM 生成的轨迹和 ego-frame 奖励，训练模型用自生成认知地图推理。

**实验**
在单图和多图空间推理基准上达到 **SOTA**；蒸馏后的模型在保持性能的同时显著降低对外部几何重建管线的依赖。

**结论**
"重建 → 查询对齐重锚定 → 工具引导推理 → 蒸馏内化"是提升 MLLM 空间推理的有效路线，兼顾性能与部署成本。

---

*注: 三篇论文均为最近 5 天内发布的新预印本，Semantic Scholar 引用数暂记为 0，将在后续 `--update` 中刷新。*
