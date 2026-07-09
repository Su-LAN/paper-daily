# 📚 每日论文速递 - 2026-07-09

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含预印本
**论文数量**: 3

---

## 1. Multimodal Continuous Reasoning via Asymmetric Mutual Variational Learning

**基本信息**
- 作者: Shijie Li, Yilin Gao, Siyuan Yang, Tieyuan Chen, Chaofan Gan, Zhihao He, Zicheng Zhao, Yuyu Guo, Weiyao Lin, Hang Yu (上海交通大学 / 蚂蚁集团)
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.00461](https://arxiv.org/abs/2607.00461)

**主要贡献**
针对 MLLM 被"语言空间瓶颈"限制——复杂视觉推理被迫压缩为离散 token 而丢失感知细节——提出 **AMVL**（Asymmetric Mutual Variational Learning）连续潜空间推理框架。核心洞察：标准变分训练存在严重的**训练-推理失配**——训练时后验以真实答案为条件、可利用答案依赖捷径，而推理时先验被迫模仿这个"作弊"的后验，导致测试性能崩塌。

**方法**
AMVL 通过**双向校准目标**化解失配：前向的先验对齐（forward prior alignment）与反向的后验支撑正则（reverse posterior support regularization）相互约束，使先验与后验非对称地互相学习，端到端发现连接多模态查询与最终答案的连续推理空间，且无需外部潜变量监督。

**实验**
在多项多模态推理基准上一致超越强离散推理与潜空间推理基线：复杂感知推理基准 **BLINK 平均分 +10.83**，单项推理任务最高提升 **+32.00**。

**结论**
连续潜空间推理的关键障碍在于变分训练的后验捷径问题；非对称互学习是一种无需潜变量标注即可稳定学得可用推理空间的通用方案。

---

## 2. KARA: Efficient Reasoning LLM Serving via Sliding-Window KV Cache Compression

**基本信息**
- 作者: Shen Han, Yuyang Wu (共同一作), Junpu Yu, Olexandr Isayev
- 发布: 2026-07-01
- 会议/期刊: arXiv 2026 (preprint, 9 页 6 图)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.01237](https://arxiv.org/abs/2607.01237)

**主要贡献**
针对推理模型长 CoT 解码阶段 KV cache 急剧膨胀、在**内存受限的并发服务**场景下导致高解码延迟与吞吐受限的问题，提出滑动窗口式解码时 KV cache 压缩方法 **KARA**。指出现有阈值触发式压缩的两大缺陷：并发服务下反而降低输出吞吐；可能把序列中某些块的 KV 对完全清除，加剧信息丢失。

**方法**
KARA 在解码过程中仅对**最近生成的上下文窗口**执行滑动式压缩，避免一次性大规模驱逐带来的吞吐抖动，并保证序列各区段的 KV 信息不被整块清空。方法**免训练**，可作为插件适配多种 LLM。

**实验**
在内存受限并发服务设定下评测多个推理 LLM：相比阈值触发式压缩基线，KARA 在保持生成质量的同时改善了解码延迟与整体吞吐（9 页论文含 6 组实验图表）。

**结论**
面向长 CoT 推理负载的服务系统，"持续小步、滑窗局部"的压缩策略比"阈值触发、全局驱逐"更适合内存受限并发场景。

---

## 3. Your Agent's Memories Are Not Its Own: Forged Reasoning Attacks on LLM Agent Memory and Defenses

**基本信息**
- 作者: Neeraj Karamchandani, Piyush Nagasubramaniam, Sencun Zhu, Dinghao Wu (宾夕法尼亚州立大学)
- 发布: 2026-07-06
- 会议/期刊: arXiv 2026 (preprint, cs.CR)
- 引用数: 0 📈 (刚发布)
- arXiv: [2607.05029](https://arxiv.org/abs/2607.05029)

**主要贡献**
揭示 LLM Agent 持久记忆的新攻击面：与以往投毒"事实知识"不同，提出 **FARMA**（Forged Amplifying Rationale Memory Attack），直接伪造并投毒 Agent **记忆中的推理轨迹（rationale）**，操纵其后续决策；同时提出分层防御管线 **SENTINEL** 检测伪造推理条目。

**方法**
FARMA 两步走：(1) 用规避性措辞注入伪造推理轨迹，绕过基于关键词的过滤防御；(2) 通过**自指涉强化**（self-referential reinforcement）让伪造记忆在后续交互中被反复引用而不断放大权重，击溃基于共识的防御。SENTINEL 则以多层检测（来源、语义一致性、引用结构等）拦截伪造推理条目。

**实验**
在多个 Agent 框架与不同底座 LLM 上各进行 50 次试验：FARMA 在基线条件下攻击成功率最高达 **100%**，并能击败关键词过滤与 A-MemGuard 等现有防御；SENTINEL 显著降低攻击成功率。

**结论**
Agent 记忆中存储的"推理过程"本身是被低估的攻击面——投毒推理比投毒事实更隐蔽且更易自我放大；记忆写入端需要针对推理条目的专门防御。

---

*注: 三篇论文均为最近 8 天内发布的新预印本，Semantic Scholar 引用数暂记为 0，将在后续 `--update` 中刷新。*
