# 📚 每日论文速递 - 2026-07-18

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. CoEvoT: Co-Evolving Chain-of-Thought Prompting for Graph-LLM Reasoning

**基本信息**
- 作者: Haohua Niu, Xingtong Yu, Yang Liu, Junfeng Fang, Xuanting Xie, Jie Tan, Zhongjian Zhang, Hong Cheng, Yuan Fang
- 发布: 2026-05-08 (v1)，2026-07 公告
- 会议/期刊: arXiv 预印本（标注 "Under review"）
- 引用数: 0 📈
- arXiv: [2607.14114](https://arxiv.org/abs/2607.14114)

**主要贡献**
提出 CoEvoT 框架，将图学习问题转化为文本提示交给 LLM 做多步推理，核心创新是让"文本→图 token 重写"与"图→文本推理引导"在闭环中共同演化，而非使用静态图表示。

**方法**
在每个推理步骤中动态精炼证据：图侧根据当前推理状态重写 token 表示，文本侧利用图结构信息引导下一步 chain-of-thought，两者交替迭代形成 co-evolving 循环，以应对分布偏移和弱监督场景。

**实验**
在 8 个数据集上评测，相对现有 Graph-LLM 方法取得一致提升，尤其在分布偏移和有限监督设定下表现稳健。

**结论**
图与文本推理的闭环共演化优于静态图编码 + 单向提示的范式，为 Graph-LLM 推理提供了新的 prompting 框架。

---

## 2. Evidence-Grounded Verified Agentic Reasoning: A Path Toward Eliminating LLM Hallucination in Empirical Inference via Tool-Attested Kernel Proofs

**基本信息**
- 作者: Junyu Ren
- 发布: 2026-07-14
- 会议/期刊: ICML 2026 TAIGR Workshop（workshop 接收，非主会）
- 引用数: 0 📈
- arXiv: [2607.12650](https://arxiv.org/abs/2607.12650)

**主要贡献**
提出 EG-VAR 系统：以 Lean 4 内核作为 LLM 经验推理输出的权威验证器，保证被接受的输出要么结构性地源自经过认证的工具调用与有效推理链，要么诚实弃答并留下审计轨迹，从机制上消除幻觉。

**方法**
将 LLM 的经验推断形式化为工具认证的内核证明（tool-attested kernel proofs）：所有事实断言必须绑定到 attested tool calls，推理链由 Lean 内核检查；无法验证时返回带审计信息的弃答而非猜测。

**实验**
TableBench 数值推理（n=120）达到 120/120，同工具基线为 95%；跨 5 个领域的压力测试中保持 100% 来源保真度（对比方法降至 80-90%）；部署时形式化错误率 Sonnet 3.3%、Opus 1.7%。

**结论**
内核验证 + 工具证据绑定可为高风险场景提供可审计的经验推理基础设施，是消除 LLM 幻觉的一条可行路径。

---

## 3. Show Me How You Reason and I'll Tell You Who You Are: Reasoning Graphs for Robust LLM Authorship Attribution

**基本信息**
- 作者: Zlata Kikteva, Artur Romazanov, Annette Hautli-Janisz, Ramon Ruiz-Dolz
- 发布: 2026-07-16
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2607.14905](https://arxiv.org/abs/2607.14905)

**主要贡献**
超越表层语言特征，首次利用 LLM 生成文本中的推理结构（reasoning graphs）做作者归属：用论辩挖掘（argument mining）流水线抽取推理图，再用图神经网络做鲁棒的 LLM authorship attribution。

**方法**
argument mining 抽取文本的论辩/推理结构构成推理图 → GNN 在图上学习模型特有的"推理指纹"，对释义等表层改写不敏感。

**实验**
在释义、回译等混淆攻击下比 Longformer 基线高出最多 27 个百分点；在未见过的新模型版本生成的文本上（模拟真实部署场景）高出 19 个百分点。

**结论**
推理结构是比表层语言特征更稳健的 LLM 作者信号，对对抗混淆和模型版本迭代均有更好的泛化。

---

## 📌 备注

- 三篇论文均为一周内新公告（07-11 至 07-18 窗口），Semantic Scholar 引用数均为 0（刚发布属正常）。
- EG-VAR 的 "Accepted at ICML 2026" 为 **TAIGR workshop** 接收（已对照 /abs 页 comments 核实），非 ICML 主会。
- 本次运行同时补录了 07-17 引用更新的 16 篇遗留论文（11 篇取自 straggler 文件计 07-17，5 篇今日重新抓取计 07-18），papers.json 现共 121 篇。
