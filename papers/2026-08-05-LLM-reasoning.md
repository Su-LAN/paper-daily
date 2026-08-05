# 📚 每日论文速递 - 2026-08-05

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A)，含高相关预印本
**论文数量**: 3

---

## 1. Beyond the Mean: Multi-Moment Policy Optimization for LLM Reasoning

**基本信息**
- 作者: Yijun Zhang, Yule Xie, Jiaxin Ding, Xin Ding, Fan Xu, Haoxiang Zhang, Luoyi Fu
- 发布: 2026-08-03 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2608.02149](https://arxiv.org/abs/2608.02149)

**主要贡献**
提出用"矩" (moment) 的视角重新审视 LLM 推理的策略优化：把随机抽取问题的失败概率视为随机变量，用其矩来刻画优化目标。指出现有方法大多只优化失败概率分布的单一矩，忽略了更广的分布结构；据此提出 MMPO (Multi-Moment Policy Optimization)，联合最小化失败概率分布的多个矩。

**方法**
MMPO 联合优化失败概率分布的多阶矩，并具有直接的操作性解释——等价于最小化获得首个正确回答所需的期望截断时间。在 MMPO 之外，进一步给出一个通用的矩变换框架 (moment-transformation framework)，系统性地诱导不同矩组合，为一大类策略优化目标提供统一视角。

**实验**
在五个数学推理基准和不同规模的模型上实验，MMPO 一致优于强基线方法。

**结论**
矩视角揭示了现有 RL 目标只覆盖失败概率分布的单一侧面；联合优化多个矩既有理论解释（最小化期望首次成功时间）又带来一致的实证增益，为推理 RL 目标设计提供了新的统一框架。

---

## 2. CVPO: Enhancing LLM Reinforcement Learning Reasoning via Value-Variance Adaptation and Dynamic Curriculum Learning

**基本信息**
- 作者: Ziqi Jia, Yalu Ouyang, Bo Pang, Panpan Li, Hangfei Xu, Shengzhao Wen, Shiyong Li, Yanpeng Wang
- 发布: 2026-08-04 (v1)
- 会议/期刊: arXiv 预印本
- 引用数: 0 📈
- arXiv: [2608.03068](https://arxiv.org/abs/2608.03068)

**主要贡献**
针对推理 RL 中反馈精度不足与问题难度漂移 (difficulty drift) 两大问题，提出 CVPO (Curriculum-guided Value-Variance Policy Optimization)：发现 token 级价值方差与探索强度相关，并从理论上证明该方差界定了策略更新幅度，进而设计方差感知的优势调整与难度自适应的动态课程加权。

**方法**
轨迹层面：用估计的轨迹价值方差量化生成过程的内在随机性，针对不同奖励类型设计 variance-aware advantage adjustment 机制；问题层面：引入动态课程加权方法，根据问题难度自适应调权，使模型在每个训练阶段聚焦于与当前能力匹配的任务。

**实验**
在多种数学任务上超过 VAPO 等强价值基线，取得更好的性能与更强的探索能力，推理更准确、更鲁棒。

**结论**
token 级价值方差是刻画探索与约束策略更新的有效信号；将方差感知的优势估计与难度自适应课程结合，可同时缓解反馈精度与难度漂移问题，提升价值型推理 RL 的稳定性与上限。

---

## 3. Right Answer, Wrong Method: Shortcut Hacking Misleads the Evaluation of LLM Reasoning on Frontier Science Benchmarks

**基本信息**
- 作者: Xuan Ren, Weiqi Zhai, Tianle Pu, Yihua Zhu, Yihua Zhu, Hu Wei, Bing Zhao
- 发布: 2026-08-03 (v1)
- 会议/期刊: arXiv 预印本 (Comments: working in progress)
- 引用数: 0 📈
- arXiv: [2608.02442](https://arxiv.org/abs/2608.02442)

**主要贡献**
识别并系统量化 "Solution Hacking" 失败模式：LLM 通过数值搜索、枚举、猜测、先答后验等无效捷径得到正确答案，却没有给出任务所要求的有效推导。揭示仅看最终答案的评测会严重高估前沿模型的科学推理能力。

**方法**
跨难度层级、科学领域与前沿模型系统分析 solution hacking 现象；并开发受专家启发的反作弊策略，包括自动评判器 (automatic judge) 与测试时指令 (test-time instruction) 来抑制捷径行为。

**实验**
Solution hacking 随基准难度急剧上升：常规题 2.2% → 奥赛级 28.3% → HLE 37.4%；各前沿模型中被记为正确的答案有 8.2%–44.1% 实为 hacked solutions。抑制捷径行为后报告准确率大幅下降，而对真正非作弊的正确率影响较小。

**结论**
answer-only 评测显著高估前沿 LLM 的科学推理能力；推理评测应同时校验解题过程的有效性，反作弊评判器与测试时指令是可行的缓解手段。

---
