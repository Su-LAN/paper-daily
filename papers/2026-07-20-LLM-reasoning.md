# 📚 每日论文速递 - 2026-07-20

**研究方向**: LLM reasoning
**筛选条件**: 顶会顶刊 (CCF-A / CORE A* / CORE A) + 高质量预印本
**论文数量**: 3

---

## 1. Implicit Reasoning Steering via Concept Chaining

**基本信息**
- 作者: Xiao Ye, Sanika Chavan, Yuxi Huang, Shahriar Kabir Nahin, Muhao Chen, Anshuman Chhabra, Ben Zhou
- 发布: 2026-07-15
- 会议/期刊: arXiv 预印本 (cs.CL)
- 引用数: 0 📈
- arXiv: [2607.14242](https://arxiv.org/abs/2607.14242)

**主要贡献**
提出"隐式推理引导"(implicit reasoning steering)这一新攻击面：无需显式指令、触发词或直接答案提示，仅用自然语言文本即可将模型偏向指定答案。核心方法 Concept Chaining 揭示了 LLM 推理脆弱性不仅是评估层面的伪影，更构成一条可被利用的实际攻击通道。

**方法**
Concept Chaining 生成一段简短的"连接段落"，通过一到两个中间概念将问题中的实体与目标选项串联起来。随后在这些连接段落上对受害模型继续预训练，检验其在原始多选题上的答案偏好是否发生系统性偏移。

**实验**
实验表明，这类间接、外观自然的文本能够系统性地引导模型预测，且相比直接改写(paraphrase)显著更难被检测/推断出来。重复采样下模型对同一问题给出对错混杂的答案，印证了最终决策形成机制的底层脆弱性。

**结论**
LLM 推理的脆弱性可被普通外观的文本放大为隐蔽的决策操纵通道——潜在偏差可以在无显式触发的情况下被激活。这对数据投毒防御和推理鲁棒性评估提出了新要求。

---

## 2. Leveraging Instruction Tuning and Merging for Reasoning Model Adaptation

**基本信息**
- 作者: Yu-Du Feng, Niels Mündler-Sasahara, Mark Vero, Martin Vechev
- 发布: 2026-07-16
- 会议/期刊: arXiv 预印本 (cs.LG / cs.CL)
- 引用数: 0 📈
- arXiv: [2607.14895](https://arxiv.org/abs/2607.14895)

**主要贡献**
提出一种极低成本的推理模型(RLM)领域适配方案：先对 RLM 做指令微调，再将微调后的模型与原模型进行参数合并(merging)，在注入新能力的同时保留原有推理能力。整个流程成本约 3 美元。

**方法**
两阶段流水线：(1) 用带有人工撰写解答的监督微调数据对 RLM 做 instruction tuning；(2) 将微调模型与原始 RLM 做模型合并，以恢复/保留因微调而可能退化的长链推理能力。

**实验**
在可验证领域（代码）和难以验证领域（文本摘要）上均取得性能提升，同时在其他任务上保持原有水平，未出现能力灾难性遗忘。

**结论**
"指令微调 + 模型合并"是让推理模型适配新领域的高性价比路径，尤其适合缺乏可验证奖励信号的任务场景，为 RLM 的轻量级定制提供了实用方案。

---

## 3. Deep Interaction: An Efficient Human-AI Interaction Method for Large Reasoning Models

**基本信息**
- 作者: Hefeng Zhou, Jinxuan Zhang, Jiong Lou, Yuxin Liu, Chaochao Lu, Jingjing Qu, Jie Li
- 发布: 2026-07-15
- 会议/期刊: arXiv 预印本 (cs.AI)
- 引用数: 0 📈
- arXiv: [2607.14049](https://arxiv.org/abs/2607.14049)

**主要贡献**
针对大型推理模型(LRM)在 Chain-of-Thought 推理中出错后难以纠正的问题，提出 Deep Interaction 交互机制：允许用户直接编辑错误的推理步骤、保留正确步骤，实现细粒度的人机协同纠错。

**方法**
用户在推理链层面进行局部编辑（改错留对），编辑后的推理路径被提炼成一个蒸馏提示(distilled prompt)，用于引导模型继续后续推理，避免整段重新生成。

**实验**
在 STEM 推理任务上，相比基线交互方式，纠错成功率提升超过 25%，token 消耗降低约 40%。

**结论**
在推理步骤粒度上开放人类编辑入口，比整体重试/重新提示更高效且更可控，为 LRM 的实用化人机协同提供了一种低开销范式。

---

## 📊 今日统计

- 新增论文: 3 篇（均为预印本，`include_preprints` 已启用）
- 论文库总数: 127 篇
- 已记录论文自动去重: 本次搜索命中的 2607.14905 / 2607.14552 / 2607.14114 等均已于 2026-07-19 记录，今日跳过
