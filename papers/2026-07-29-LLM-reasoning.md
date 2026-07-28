# 📚 每日论文速递 - 2026-07-29

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高质量预印本
**论文数量**: 3

---

## 1. Not All LLM Reasoning is Visible in the Chain-of-Thought

**基本信息**
- 作者: Vatsal Baherwani, Tom Goldstein, Ashwinee Panda
- 发布: 2026-07-24
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2607.22925](https://arxiv.org/abs/2607.22925)

**主要贡献**
揭示前沿模型的"不可见推理"失效模式：模型可以借助与语义无关的填充 token 完成对下游任务有实质影响的计算，而这些计算在输出的思维链中完全没有可解释痕迹，对基于 CoT 监控的安全方案构成直接挑战。

**方法**
在合成推理任务上对比模型直接作答与插入语义无关填充 token 后作答的表现，覆盖 13 个前沿模型；并设计隐藏约束实验（如让模型在不损害主任务的前提下满足隐藏的模运算约束），检验填充 token 能否承载对监控者不可见的目标计算；进一步用 RL 和 SFT 训练模型，考察填充偏好与测试时收益是否可被训练固化。

**实验**
填充 token 在 13 个前沿模型上最高带来 13 个百分点的准确率提升；Claude Opus 4.5 能借助填充 token 满足隐藏的模运算约束且不影响主任务；RL 使 Qwen3-235B 形成对填充内容的强偏好，但 RL 与 SFT 均未能产生持久的测试时填充收益。

**结论**
前沿模型已经在进行输出 token 中无可解释痕迹的实质性计算，仅靠思维链监控无法保证对模型推理过程的可见性，CoT 忠实性假设需要重新审视。

---

## 2. Grounding latent algorithm routing in transformer reasoning

**基本信息**
- 作者: Xiangbo Zhang, Xiaoxu Ma
- 发布: 2026-07-27
- 会议/期刊: COLM 2026 (accepted)
- 引用数: 0 📈
- arXiv: [2607.24471](https://arxiv.org/abs/2607.24471)

**主要贡献**
提出并验证"潜在算法路由"假说：transformer 在上下文学习中会围绕归纳偏置族组织其自适应行为，即内部选择并路由到合适的求解算法；发布诊断基准 ROUTEBENCH 用于度量这种路由能力。

**方法**
构建 ROUTEBENCH：不同 regime 分别偏好 ridge 类、lasso 类、Huber 类和 kNN 类求解器；从头训练 44M–612M 的 dense decoder-only transformer，用 oracle-routing gap 和 route F1 量化路由质量；再用线性探针和激活修补（activation patching）验证路由相关内部方向既可解码又在功能上参与计算。

**实验**
306M 模型缩小了 80.9% 的 oracle 路由差距，route F1 达 84.1；结果对自然语言改写、打乱支撑样本和同义改述均稳健；探针与激活修补对照实验表明路由方向可解码且具有因果作用。作者明确说明该结果不等于预训练语言模型中存在普适路由。

**结论**
为 transformer 推理中的内部算法选择机制提供了可控、可复现的机制性证据，是理解 LLM 上下文推理如何"选算法"的重要一步。已被 COLM 2026 接收。

---

## 3. SymStep: Symbolic Step Verification for Logical Reasoning

**基本信息**
- 作者: Aida Usmanova, Rui Gao, Dilshod Azizov, Ricardo Usbeck, Zangir Iklassov
- 发布: 2026-07-25
- 会议/期刊: arXiv preprint
- 引用数: 0 📈
- arXiv: [2607.23055](https://arxiv.org/abs/2607.23055)

**主要贡献**
提出 SymStep 神经符号框架：让 LLM 每次只提出一个原子断言，由轻量约束传播器实时校验一致性、拒绝矛盾并级联推出隐含事实，将 CoT 在高约束密度逻辑题上的失效模式转化为近乎完美的求解。

**方法**
LLM 与符号约束传播器交替工作：模型逐步给出原子断言，传播器检查约束一致性并传播蕴含事实；增强版 SymStep+G 引入 MRV（最小剩余值）启发式，引导模型优先处理约束最紧的未解变量，减少无方向的循环推理。

**实验**
在 ZebraLogicBench 的 35 题子集上，Direct 和 CoT 均为 0%，SymStep+G 达到 97%；AR-LSAT 上 SymStep 达 100%（CoT 为 87%）；LGP-14 上达 100%（CoT 与 Logic-LM 均为 0%）。消融显示 MRV 引导显著减少循环，且优势与约束密度相关（在 AQUA-RAT 上验证了这一特异性）。

**结论**
步级符号校验能在纯 CoT 完全失效的高约束逻辑推理任务上实现近乎完美的准确率，说明"生成即校验"的细粒度神经符号耦合是补足 LLM 逻辑推理短板的有效路径。

---

*由 paper-daily 自动生成 | 数据来源: arXiv, Semantic Scholar*
