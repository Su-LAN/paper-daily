# 📚 每日论文速递 - 2026-06-23

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 / arXiv 预印本（推理方向高相关）
**论文数量**: 3

---

## 1. Stop When Further Reasoning Won't Help: Attention-State Adaptive Generation in Reasoning Models

**基本信息**
- 作者: Jiakai Li, Ke Qin, Rongzheng Wang, Yizhuo Ma, Qizhi Chen, Muquan Li, Shuang Liang
- 发布: 2026-06-13
- 会议/期刊: ICML 2026 Spotlight (CCF-A / CORE-A*)
- 引用数: 0 📈
- arXiv: [2606.15070](https://arxiv.org/abs/2606.15070)

**主要贡献**
针对大型推理模型（LRMs）普遍存在的"过度思考"（overthinking）问题，提出 ASAG（Attention-State Adaptive Generation）——一种**完全无需训练**的自适应停止生成方法。通过实时分析推理模型在思考链生成过程中的注意力状态变化，判断"继续推理是否还能带来收益"，从而在恰当时机主动截断思考过程。

**方法**
- 观察到推理模型在"已得出有效答案"后，注意力分布会从问题/中间步骤显著迁移到固定的反思/收尾 token 上，出现可识别的状态突变。
- ASAG 设计一个轻量级注意力状态监控器，实时追踪关键层的注意力熵与聚集度，触发条件命中即提前结束生成。
- 整个机制为 plug-in，不动模型权重、不改解码框架，可与 Qwen3、DeepSeek-R1-Distill 等开源推理模型直接组合。

**实验**
- 在 Qwen3-8B 上跨多个推理基准平均准确率提升 **+3.2%**，同时生成 token 数减少近 **40%**。
- DeepSeek-R1-Distill、Qwen3 系列等多模型上均观察到一致的"精度↑+长度↓"双赢。
- 与基于强化学习/SFT 的反过度思考方案相比，零训练成本，部署友好。

**结论**
推理模型自身的注意力分布即隐含"何时该停"的信号；显式利用这一信号可同时改善正确率与推理效率，为推理模型推理时计算（test-time compute）调度提供了一条无需训练的新范式。

---

## 2. Counterexample Guided Learning in the Large using Reasoning Agents

**基本信息**
- 作者: Hongyi Liu, Frederic Sala, Thomas Reps, Adithya Murali
- 发布: 2026-06-09
- 会议/期刊: arXiv preprint (cs.LG)
- 引用数: 0 📈
- arXiv: [2606.11521](https://arxiv.org/abs/2606.11521)

**主要贡献**
把形式方法里的经典框架 **CEGIS（Counterexample-Guided Inductive Synthesis）** 系统地搬到 LLM 推理-合成循环中，提出"反例引导的 LLM 大规模学习"范式：用一个外部 verifier 不断给出反例，驱动 LLM agent 迭代修复，从而在难度极高的正则表达式归纳（regex induction）任务上实现样本效率大幅提升。

**方法**
- 将 LLM agent 视作归纳学习器，输出候选解；外部符号 verifier 检查其是否满足所有规约，若失败则返回最小反例。
- 引入两项关键改进：(1) **正则化策略**，控制每轮修复幅度，避免漂移；(2) **符号聚类**，把语义相近的反例聚合为更具信息量的反例簇，使每一轮反馈"含金量"最大化。
- 该框架解耦"LLM 直觉"与"符号判定"，让推理模型专注于假设生成，把可验证性留给外部工具。

**实验**
- 在两组挑战性 regex 归纳基准上，成功率分别从 **3.2% → 38.1%** 与 **38.9% → 74.1%**，呈数量级跃升。
- 消融实验显示，正则化与符号聚类两项缺一不可，且收益主要源自"高信息反例"而非简单的多轮采样。

**结论**
传统形式方法中的反例驱动循环与现代 LLM 推理可以深度融合：把符号 verifier 当成"老师"，把 LLM 当成"会推理的学生"，能在符号化、组合性强的推理任务上取得远超纯 LLM 自迭代的效果。

---

## 3. Decentralized Multi-Agent Systems with Shared Context

**基本信息**
- 作者: Yuzhen Mao, Azalia Mirhoseini
- 发布: 2026-06-09
- 会议/期刊: arXiv preprint (cs.AI, cs.CL) — Stanford
- 引用数: 0 📈
- arXiv: [2606.10662](https://arxiv.org/abs/2606.10662)

**主要贡献**
针对当前 LLM 多智能体推理系统中"中心 orchestrator 成为瓶颈"的痛点，提出 **DeLM（Decentralized Language Models）**：用"并行 agent + 共享可验证上下文 + 任务队列"替代集中式协调，实现真正的去中心化多 agent 协作推理，在软件工程与长上下文推理任务上显著超过 sequential / centralized baseline。

**方法**
- **共享上下文池**：所有 agent 把自己已验证过的中间结论写入共享 context，下游 agent 读取该 context 作为可信前提。
- **去中心化任务队列**：任务由 agent 自发认领与拆分，避免主控 agent 的单点延迟。
- **可验证写入约束**：只有通过 verifier 检查的产出才会进入共享上下文，防止错误信息在协作过程中被放大。

**实验**
- 在 SWE 类软件工程基准与长上下文推理基准上，相对 sequential / centralized multi-agent baseline 提升 **5.7 ~ 10.5 个百分点**。
- 在并行 agent 数量增加时具备良好的可扩展性，无需增大编排成本。

**结论**
LLM 多智能体推理不必依赖中心 orchestrator——把"协调"下沉到共享上下文与任务队列层，可在保持正确性的同时大幅提升并行度和扩展性，为大规模 agentic 推理系统提供了一条可落地的去中心化路线。

---
