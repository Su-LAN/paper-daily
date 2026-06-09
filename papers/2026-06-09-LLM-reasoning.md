# 📚 每日论文速递 - 2026-06-09

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量 arXiv 预印本
**论文数量**: 3

---

## 1. Latent Reasoning with Normalizing Flows

**基本信息**
- 作者: Guancheng Tu, Xiangjun Fu, Suhao Yu, Yao Tang, Haoqiang Kang, Lianhui Qin, Yizhe Zhang, Jiatao Gu
- 发布: 2026-06-04
- 会议/期刊: arXiv preprint (cs.CL / cs.LG, 高质量预印本)
- 引用数: 0 📈
- arXiv: [2606.06447](https://arxiv.org/abs/2606.06447)

**主要贡献**
- 提出 NF-CoT：用 **normalizing flows** 在连续潜空间中执行中间推理，而非把每一步都展开成文字 token，从而获得「高带宽」的思考通道。
- 在保留显式 CoT 的两个关键优势（精确似然 + 与原始 KV cache 兼容的从左到右概率解码）的前提下，把推理放到 compact continuous states 中完成。
- 在代码生成基准上同时取得更高准确率与更低的中间推理开销，超越显式 CoT 与现有 latent reasoning 方法。

**方法**
NF-CoT 将「思考」建模为一段在潜空间中演化的连续向量序列：每一步思考被参数化为一个 normalizing flow 变换，从前一个潜态映射到下一个潜态，再在需要时解码出输出 token。由于 flow 是可逆且 tractable 的，整个潜在推理轨迹拥有 exact log-likelihood，可被纳入标准的 left-to-right 自回归训练目标；同时，因为思考过程不再展开为长文本 token 序列，原有 transformer 的 KV cache 机制对它仍然成立，推理时不需要每步把潜态再翻译成文字。这给出了一个介于「discrete CoT」与「fully continuous thought vectors」之间的折中：保留了概率框架，又压缩了表示。

**实验**
- 在代码生成基准上对比显式 CoT、Coconut 等 latent reasoning 基线，NF-CoT 在准确率上更高，同时中间推理 token / 计算量更低。
- 消融显示：normalizing flow 的可逆结构对获得稳定的潜在推理至关重要；去掉精确似然约束后，潜态会塌缩成无信息量的恒等映射。
- 与显式 CoT 的对比表明，连续潜在推理特别适合「中间步骤难以用自然语言精确描述」的代码 / 结构化推理任务。

**结论**
显式 chain-of-thought 并非推理的唯一形式：把中间步骤搬到带有精确似然的连续潜空间里，既能保留 LLM 训练 / 推理栈的兼容性，又能用更少的 token 完成同样甚至更难的推理。NF-CoT 为「latent reasoning」一条更可训练、更可分析的技术路线。

---

## 2. On the Generalization Gap in Self-Evolving Language Model Reasoning

**基本信息**
- 作者: Zhenting Qi, Susanna Maria Baby, Stefanie Anna Baby, Kan Yuan, Andrew Tomkins, Tu Vu, Da-Cheng Juan, Cyrus Rashtchian
- 发布: 2026-05-31 (v1) / 2026-06-02 (v2)
- 会议/期刊: ICML 2026 (CCF-A / CORE A*)
- 引用数: 0 📈
- arXiv: [2606.01075](https://arxiv.org/abs/2606.01075)

**主要贡献**
- 系统性地度量 **self-evolution（自生成训练信号）** 与 **oracle supervision（金标准答案）** 之间的 generalization gap，把「自演化能走多远」量化下来。
- 在受控的 Knights-and-Knaves 逻辑推理任务上对比了四种自演化策略：single-round verification、multi-turn critic-revision、iterative training、curriculum learning。
- 给出三条关键经验结论：self-evolution 一致地超过 base model，但随训练计算的增加会很快进入 plateau；multi-turn critic-revision 在 Gemma 12B 上几乎追平 oracle-supervised training；在真实世界基准上的收益相对受限。

**方法**
作者构建了一个闭环设置：模型先生成解答，再以自身（或同族 critic 模型）评估或修正，得到的新数据回流到训练循环。在四种策略上跑相同的训练预算后，他们以同任务下的 oracle 监督（可证明正确的标签）为上限，量化「自演化 - oracle」的 gap，并按训练计算（compute）做缩放实验。Knights and Knaves 之所以被选作主基准，是因为它有可枚举的真值空间，可以避免常见自演化研究中「无法判断标签到底对不对」的方法论硬伤。

**实验**
- 所有四种自演化策略都显著优于不训练的 base model，但增益随 compute 出现明显的 saturation。
- multi-turn critic-revision 是最强策略：Gemma 12B 在该范式下接近 oracle 训练上限，而 single-round verification 收益最低。
- 在迁移到外部真实推理基准（数学 / 常识）时，自演化带来的提升明显衰减，提示当前 self-evolution 主要在「任务内打磨」，向新任务泛化能力有限。

**结论**
Self-evolution 不是无限的免费午餐：在严格闭环 + 可证明真值的条件下，它能把模型推到接近 oracle 的水平，但只对训练任务有效，且很快遇到 compute plateau。要让自演化真正提升通用推理能力，下一步关键是引入更强的多任务 critic 与跨任务 curriculum，而不是单纯堆更多自生成数据。

---

## 3. Reasoning Structure of Large Language Models

**基本信息**
- 作者: Frédéric Berdoz, Luca A. Lanzendörfer, Fabian Farestam, Roger Wattenhofer
- 发布: 2026-06-02
- 会议/期刊: ICML 2026 (CCF-A / CORE A*)（同时入选 ICLR 2026 LLM Reasoning Workshop）
- 引用数: 0 📈
- arXiv: [2606.03883](https://arxiv.org/abs/2606.03883)

**主要贡献**
- 提出一个 **可扩展的 LRM (Large Reasoning Model) benchmark**：用逻辑谜题作为可严格验证的推理任务，并配套把非结构化推理 trace 自动转成 verifiable reasoning graph 的 pipeline。
- 定义一种新的 **结构性效率指标**，刻画一个模型推理流图中「逻辑流是否集中在主干」，与传统的 token 数 / 准确率正交。
- 在多款开源 reasoning 模型上发现：单看 accuracy 看不出差异的两个模型，在 reasoning graph 结构上其实截然不同，这给出了诊断 failure mode 的新工具。

**方法**
论文把一条推理 trace 解析为「claim 节点 + 依赖关系边」的图，所有 claim 都能在背景知识 / 上一节点的基础上被独立验证。基于这个图，作者定义两类指标：(1) 正确性指标——多少 claim 真正可被验证；(2) 结构性指标——逻辑流的集中度，即从问题节点到答案节点的关键路径占整张图的比例。整套 pipeline 自动从原始 trace 中抽 claim、检查 entailment 关系，无需人工标注，因此可以在大规模 LRM benchmark 上跑。

**实验**
- 在自建的 logic puzzle benchmark 上跑了多款开源 reasoning 模型（覆盖不同尺寸 / 不同 RL 训练范式）。
- 在 accuracy 接近的模型之间，结构性指标显示有的模型「主干推理 + 大量旁支」，有的则「整条推理只走主干」——后者对长推理更鲁棒。
- 在某些模型上观察到典型 failure：推理图存在大量「孤立 claim」，最终答案与主干断开，这能解释为何中间看似合理但最终答错。

**结论**
仅看 final accuracy 或 token 数，无法真正理解一个 reasoning model 在「怎么想」。把 trace 解析为 verifiable reasoning graph，再用结构性指标看逻辑流，是评估 LRM 的下一步必要工具。这种结构化评测既能区分「会推理」和「会蒙对」，也能定位具体 failure mode，给 RL / SFT 训练提供新的优化信号。

---
