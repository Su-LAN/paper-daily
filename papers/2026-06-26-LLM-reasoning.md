# 📚 每日论文速递 - 2026-06-26

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 + reasoning 相关高质量预印本
**论文数量**: 3

---

## 1. MiniOpt: Reasoning to Model and Solve General Optimization Problems with Limited Resources

**基本信息**
- 作者: Ke Zhao, Zixiang Di, Hong Qian, Xiang Shu, Yaolin Wen, Qitao Shi, Bingdong Li, Xingyu Lu, Xiangfeng Wang, Jun Zhou, Ke Tang, Yang Yu
- 发布: 2026-06-24
- 会议/期刊: arXiv preprint (cs.LG, EMNLP 2026 under review)
- 引用数: 0 📈
- arXiv: [2606.25832](https://arxiv.org/abs/2606.25832)

**主要贡献**
针对"用小模型 (≤10B) 端到端推理建模并求解通用优化问题"的痛点，提出 MiniOpt：将"读题 → 形式化 → 调用求解器"显式分阶段，并用强化学习把小模型训练成一个具备建模能力的"优化推理体"。相较此前依赖大模型 few-shot 或专家示范的方案，MiniOpt 在 3B 规模下取得了 <10B 量级最优的求解准确率，同时显著降低对人工标注的依赖。

**方法**
- **两阶段推理流程**: 把"general optimization"任务拆为 (a) Reasoning-to-Model：从自然语言题目推出形式化目标/约束；(b) Reasoning-to-Solve：生成可执行求解器代码并接外部 solver。
- **OptReward (层级奖励)**: 对建模阶段验证形式化是否能成功被 solver 加载、约束是否完备；对求解阶段验证目标值与可行性。无需专家轨迹，全部来自 solver 反馈。
- **策略优化改造**: 在 GRPO 基础上加入面向小模型的探索增益项与稳定化技巧，缓解 reward sparsity 与策略坍缩。
- **训练数据**: 来源于多个开源 LP/MILP/CP/QP 题库，并通过自动改写扩展到自然语言描述。

**实验**
- MiniOpt-3B 在 LP/MILP/NLP 等多类优化任务上同时超过同尺寸基线与若干 7B 级模型。
- 与基于大模型 prompting 的 OptiMUS 等方法相比，达到接近或更优的求解精度，且训练/推理成本显著更低。
- 消融显示 OptReward 中的"建模质量"分量是关键，移除后 solver 通过率明显下降。
- 在跨域 (生产调度、能源规划、组合优化) 表现稳定，验证了"reasoning + solver"范式的泛化性。

**结论**
通过把"形式化建模"显式作为推理任务并用 solver 直接打分，小模型也能在通用优化问题上做到端到端高质量求解。这条路径回避了纯 CoT 蒸馏在符号搜索类问题上的天花板（参见 [2606.21884]），用"推理 + 外部精确求解器"的合作模式，把验证型奖励落到工业级运筹场景。

---

## 2. Age of LLM: A Strategic 1v1 Benchmark for Reasoning, Diplomacy and Reliability of Large Language Models under Fog of War

**基本信息**
- 作者: Arnaud Ricci
- 发布: 2026-06-23
- 会议/期刊: arXiv preprint (cs.AI)
- 引用数: 0 📈
- arXiv: [2606.24391](https://arxiv.org/abs/2606.24391)

**主要贡献**
提出一个 1v1 战略对弈环境作为推理能力评测基准，刻意把三类挑战叠加在一起：(i) 信息不完备的 fog of war；(ii) 含资源追踪与隐式承诺的全套外交对话；(iii) 严格 JSON 格式约束 (违规动作静默丢弃)。对 15 个主流 reasoning 模型 54 场对局共 5,258 步动作进行系统评测，给出"推理 - 外交 - 可靠性"三轴的实测画像。

**方法**
- **环境**: 13×7 网格 turn-based 对弈，玩家可选军事进攻、外交对话、资源采集与隐藏行动，胜负条件含核打击/常规征服/外交胜利。
- **协议**: 每一步要求模型输出严格 JSON action；invalid action 默认无效但消耗回合，构成"可靠性"压力测试。
- **对手池**: 包含主流闭源/开源 reasoning 模型（含 GPT、Claude、Gemini、Qwen、DeepSeek 系列等 15 个）。
- **指标**: 胜率、违规率、违规原因分布、外交达成率、策略偏好（核/常规/外交）。
- **开源**: 发布 corpus 含全部 replay 与可视化工具，支持后续研究。

**实验**
- 78–85% 的胜利来自核策略，常规征服较少但耗时更短，纯外交胜利极罕见。
- 58% 的规则违规来自"状态追踪错误"——模型忘了已部署单位、隐藏资源或对手公开承诺。
- 可靠性 (JSON 合规率) 与胜率呈正相关趋势，但相关性较弱；说明 reasoning 模型整体仍受限于工作记忆与一致性维护。
- 不同模型呈现稳定的"性格": 部分倾向欺骗与隐藏行动，部分倾向克制式外交。

**结论**
在 adversarial uncertainty + 多模态长 horizon 决策下，主流 reasoning 模型最大瓶颈并非单步推理质量，而是"状态追踪 + 协议遵守 + 多 agent 信念建模"。该基准把"reliability"作为一个与正确率并列的评估轴，与近期"latent reasoning / efficient reasoning"研究形成正交补充。

---

## 3. Process-Verified Reinforcement Learning for Theorem Proving via Lean

**基本信息**
- 作者: Minsu Kim, Se-Young Yun
- 发布: 2026-06-18
- 会议/期刊: arXiv preprint (cs.AI, cs.LG)
- 引用数: 0 📈
- arXiv: [2606.20068](https://arxiv.org/abs/2606.20068)

**主要贡献**
把 Lean 形式化证明助手当作 RL 训练时的"符号过程 oracle"：不仅给出最终对/错信号，还把每一条 tactic 的类型论合法性细粒度地反馈给策略。提出在 GRPO 风格的训练框架中显式利用这种 tactic-level verified feedback，并配套设计 credit assignment 方案。结果表明，过程级监督在 MiniF2F、ProofNet 等基准上系统性优于仅有 outcome reward 的基线，给"RLVR + 形式化系统"提供了一条比单纯 0/1 verifier 更密集、更稳定的训练信号路径。

**方法**
- **过程 Oracle**: 把模型输出 parse 成 tactic 序列后逐步喂入 Lean 内核，记录每一步是否被类型检查接受、是否推进 goal 状态，从而生成 step-level reward。
- **GRPO 改造**: 在 group-relative advantage 中加入按 tactic 步骤分配的 credit；对 partial proofs 不再 0/1 一刀切，而按"已合法步骤占比 + 子目标推进度"评分。
- **训练设置**: 基于 STP-Lean 与 DeepSeek-Prover-V1.5 上启动；策略采样 + tactic 验证循环作为唯一监督。
- **稳定化技巧**: 对低质量轨迹做 entropy 与 length penalty，避免策略过早坍缩到"短证明猜测"。

**实验**
- 在 MiniF2F、ProofNet 上 tactic-level supervision 一致优于 outcome-only baseline；改进在中等难度题目上最明显。
- 与 DeepSeek-Prover-V1.5 outcome RL 基线相比，pass@K 在多数 K 上提升 ~2-5 pp。
- 消融显示 step-level reward 显著加快训练收敛，对策略 entropy 维持也更友好；移除 partial credit 后表现回落到 outcome-only baseline 水平。
- Failure mode 分析揭示模型仍易在长 proof 中累积小错误，提示后续可结合 search/lookahead。

**结论**
形式化证明系统不仅可用于推理结果验证，更可在训练时作为"密集且可验证"的过程奖励来源，这一思想可迁移到代码、数学、SQL 等任何具有可执行 verifier 的领域，是 RLVR 范式向更细粒度推进的代表性工作。也与本期 MiniOpt (solver 反馈) 形成同一类范式：把符号系统当作 reward source 来驱动小模型的可信推理。

---

## 📊 趋势观察

1. **"推理 + 符号系统"协同**: 本期 MiniOpt (solver) 与 Process-Verified RL (Lean) 不约而同地把"外部符号验证器"作为奖励来源，呼应了 [2606.21884] 关于"搜索类任务无法被 CoT 蒸馏忠实学习"的判断——把不可学的部分外包给精确系统，是 reasoning 工程化的主旋律。
2. **可靠性 (reliability) 走上台面**: Age of LLM 把"是否按协议输出"作为与"是否答对"并列的评估轴，提示 reasoning 评测正从"单题准确率"走向"长 horizon 行为可控性"。
3. **小模型 + RL + Verifier 的工程闭环**: 三篇论文都默契指向 ≤10B 级 reasoning 模型 + verified reward 的训练范式，意味着 2026 下半年学术与工业 reasoning 系统将更多走向"小而专、且可验证"的方向。
