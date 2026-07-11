# 📚 每日论文速递 - 2026-07-12

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含预印本
**论文数量**: 3

---

## 1. Hidden Decoding at Scale: Latent Computation Scaling for Large Language Models

**基本信息**
- 作者: Aiwei Liu, Cheng Shi, Chuhan Wu 等 (共 47 位作者，30 页 9 图)
- 发布: 2026-07-09
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.08186](https://arxiv.org/abs/2607.08186)

**主要贡献**
针对"已经很强的模型再想变强只能重新做一轮昂贵预训练"的困境，提出 **Hidden Decoding**：不加深 Transformer 主干、不引入循环层，而是在**继续预训练 (continued pretraining)** 阶段做**序列长度维度的扩展** —— 把每个 token 展开成 n 条并行 stream，让模型对每个 token 花费更多**潜空间计算 (latent computation)**。

**方法**
每条 stream 拥有**独立的 embedding 表**，token 被展开为 n 条 stream 后在潜空间中并行演化；配套提出 **Stream-Factorized Attention**，把注意力按 stream 分解以控制展开带来的计算开销。整个方案不改动核心架构，可直接嫁接到现有强模型上。

**实验**
在 **100B+ MoE 规模**上验证了序列长度扩展路线：以 n=4 训练了 **WeLM-HD4-80B** 与 **WeLM-HD4-617B** 两个模型，相对算力匹配的基线取得一致提升，证明该方法在前沿规模 (frontier scale) 上有效。

**结论**
提升单 token 计算量是加深主干之外的另一条 scaling 路径：潜空间多 stream 展开 + 分解注意力让"每个 token 想得更久"在工业级 MoE 模型上首次被验证可行，为已有强模型的能力续升提供了低成本选项。

---

## 2. What LLM Forecasters Know but Don't Say: Probing Internal Representations for Calibration and Faithfulness

**基本信息**
- 作者: Raphaël Sarfati, Pratyush Ranjan Tiwari, Siddharth Boppana, Christopher J. Earls, Srikar Varadaraj, Eric Ho
- 发布: 2026-07-09
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.08046](https://arxiv.org/abs/2607.08046)

**主要贡献**
证明 LLM 预测器 (forecaster) 的**内部表征比外部输出知道得更多**：在中间层激活上训练的探针 (probe)，其校准度显著优于模型自身报告的预测概率；并系统性揭示了 **CoT 不忠实 (unfaithfulness)** —— 推理链经常掩盖真正影响决策的因素。

**方法**
在 Eternis-Forecaster 8B 等模型的中间激活上训练线性探针，读出"模型内心的"预测分布；通过**证据移除实验**和 **prompt 注入测试**对比内部信号与外显推理链的变化，检验 CoT 是否如实反映决策依据；再利用探针作为行为漂移检测器。

**实验**
探针校准度显著优于标准输出；探针能检测到推理链**刻意隐藏**的行为变化；关键发现是**模型的预测在推理文本生成之前就已基本确定** —— 据此按初步答案分布做智能路由，可节省 **30–47% 的推理 token** 且不损失精度。

**结论**
CoT 更像"事后解释"而非"决策过程"：预测在生成推理前已定型。读取内部表征既能获得更可信的校准信号，也能当作忠实度审计工具，还能直接换来可观的推理算力节省。

---

## 3. CausalDS: Benchmarking Causal Reasoning in Data-Science Agents

**基本信息**
- 作者: Andrej Leban, Yuekai Sun (55 页 10 图)
- 发布: 2026-07-09
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.08093](https://arxiv.org/abs/2607.08093)

**主要贡献**
指出现有因果评测数据集"只能从既有来源整理有限样例"的局限，提出 **CausalDS**：一个**合成生成**的因果推理基准 —— 每个场景由结构因果模型 (SCM)、对应观测数据和一段真实感叙事构成，专门评测数据科学 agent 的因果推理能力。

**方法**
程序化生成 SCM + 数据 + 叙事三元组，任务覆盖 **Pearl 因果三层级**（关联/干预/反事实），并刻意加入不完美观测等现实挑战；评测维度包括符号因果推理、数据科学操作、不确定性量化、**弃答 (abstention)** 与工具使用/编码，其中"识别问题无据可答并选择弃答"被作为计分项。

**实验**
以合成生成方式规模化构建评测场景（55 页完整报告），对 LLM 数据科学 agent 在三层级因果任务上进行多维打分，重点考察 agent 在观测不完美、答案不可得时能否恰当表达不确定性而非强行作答。

**结论**
因果推理评测不必受限于人工整理的既有案例：SCM 驱动的合成基准既可无限扩展，又能精确控制难度与可答性；把"知道自己不知道"纳入计分，是对 agent 可靠性评测的重要补充。

---

## 📊 今日趋势观察

1. **潜空间计算成为新的 scaling 维度**: Hidden Decoding 在 100B+ MoE 上验证了"每 token 多算"路线，与循环层、test-time compute 等方向汇流 —— 算力投向从"更大模型"转向"更深思考"。
2. **CoT 忠实度危机有了定量证据**: 探针实验表明预测在推理文本生成前已定型，呼应昨日 GraphEval 的"答案对≠推理对" —— 内部表征审计正成为推理评估的新工具层。
3. **基准建设走向合成化与可弃答**: CausalDS 用 SCM 程序化生成替代人工整理，并把弃答纳入计分 —— 评测社区开始同时关注"能答对"与"知道不能答"。
