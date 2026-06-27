# 📚 每日论文速递 - 2026-06-27

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 / arXiv 预印本（近三周）
**论文数量**: 3

---

## 1. Beyond Entropy: Learning from Token-Level Distributional Deviations for LLM Reasoning

**基本信息**
- 作者: Xuanzhi Feng, Zhengyang Li, Zeyu Liu, Haoxi Li, Yuming Jiang, Bing Guo, Jingcai Guo, Jie Zhang, Song Guo
- 发布: 2026-06-18
- 会议/期刊: arXiv 预印本（投稿 ICLR/NeurIPS 候选方向）
- 引用数: 0 📈
- arXiv: [2606.19771](https://arxiv.org/abs/2606.19771)

**主要贡献**
针对带可验证奖励的强化学习（RLVR）中"熵塌缩 vs 探索发散"的固有矛盾，提出 Independent Combinatorial Tokens (ICT) 框架，将优化目标从标量级不确定性转向 token 级 logit 分布特征，并用 Jensen-Shannon 散度识别真正承载决策信息的关键 token。

**方法**
- 用 JS 散度刻画每个 token 的分布偏离程度，把约 10% 拥有显著分布偏移的 token 标记为关键决策点。
- 仅对这些关键 token 做策略更新，避免对低信息 token 的无效梯度污染。
- 用 Shannon 熵与 Rényi 熵给出理论保证：选择性更新可显式调控策略集中度，从而在探索与利用间形成稳定平衡。

**实验**
在 Qwen-0.5B / 1.5B / 7B 上覆盖数学、常识与奥赛级 7 个基准，相比强 RLVR 基线 pass@4 平均提升 4.58%，最大单项提升 14.9%；且在 7B 规模上仍稳定不塌缩。

**结论**
熵不是 RL 调控的合适标量，token 级分布偏移才是更细粒度、更可解释的优化信号。该方法为 RLVR 训练中"该更新谁、不该更新谁"提供了一个统一框架。

---

## 2. QMFOL: Benchmarking Large Language Model Reasoning via Quantifiable Monadic First-Order Logic Test Case Generation

**基本信息**
- 作者: Xinyi Zheng, Ling Shi, Tianlong Yu, Yongxin Zhao, Lorenz Goette, Kailong Wang
- 发布: 2026-06-18
- 会议/期刊: arXiv 预印本（NeurIPS Datasets & Benchmarks 候选方向）
- 引用数: 0 📈
- arXiv: [2606.20227](https://arxiv.org/abs/2606.20227)

**主要贡献**
现有推理 benchmark 难以解耦"语义多样性"与"逻辑难度"。本文提出 QMFOL 自动化框架，可生成具有可量化、可控复杂度的单子一阶逻辑（MFOL）推理题，并发布 2,880 题、960 配置的 QMFOLBench 数据集。

**方法**
- 在形式逻辑层显式控制四个维度：推理深度、推理宽度、标签类型（True / False / Unknown）、干扰项的合取/析取模式。
- LLM 将形式逻辑结构翻译为自然语言题面，再用外部 prover 做 round-trip 验证，确保自然语言与原命题严格等价。
- 由此把"语义自然度"与"逻辑硬度"作为两条可独立扫描的轴。

**实验**
评估 6 个推理模型 + 2 个通用 LLM：
- 准确率随逻辑复杂度单调下降，token 开销显著上升；
- True 标签明显比 False / Unknown 容易（揭示了模型在"反驳"与"未知"上的系统性弱点）；
- 模型对语义改写敏感度差异巨大，提示当前推理能力高度依赖表层表达。

**结论**
QMFOL 把 benchmark 难度从"经验估计"推到"可量化指标"，为后续推理模型评测建立了可扩展、可复现、可控的基础设施。

---

## 3. ActiveMem: Distributed Active Memory for Long-Horizon LLM Reasoning

**基本信息**
- 作者: Yunhan Jiang, Wenbin Duan, Shasha Guo, Liang Pang, Xiaoqian Sun, Huawei Shen
- 发布: 2026-06-09
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2606.10532](https://arxiv.org/abs/2606.10532)

**主要贡献**
长时序推理 agent 长期受困于"上下文越长越乱"。本文借鉴人脑执行控制与记忆系统的功能分离，提出 ActiveMem 异构架构，把记忆管理从核心推理中解耦，避免推理轨迹与上下文管理在同一窗口内互相挤压。

**方法**
- **高层 Planner**：用蒸馏得到的紧凑语义表示进行规划，不再直接消耗原始上下文。
- **分布式 Active Memory**：与推理过程并行运行的轻量记忆系统，主动累积、整合、压缩语义信息。
- 两者通过结构化语义接口交互，使长时推理可在"短上下文 + 持续后台记忆"的组合下运行。

**实验**
在 BrowseComp-Plus 与 GAIA 两个长时序 agent 基准上达到 SOTA 精度，同时显著降低上下文开销。

**结论**
长上下文不是长时推理的唯一解；将"想"与"记"做架构级解耦能在准确率与成本上双赢，为后续 agent 框架提供了可借鉴的认知启发式设计。

---

## Sources

- [ReSum and June 2026 LLM reasoning arXiv search](https://arxiv.org/abs/2606.13316)
- [Beyond Entropy: Token-Level Distributional Deviations](https://arxiv.org/abs/2606.19771)
- [QMFOL: Benchmarking LLM Reasoning](https://arxiv.org/abs/2606.20227)
- [ActiveMem: Distributed Active Memory](https://arxiv.org/abs/2606.10532)
