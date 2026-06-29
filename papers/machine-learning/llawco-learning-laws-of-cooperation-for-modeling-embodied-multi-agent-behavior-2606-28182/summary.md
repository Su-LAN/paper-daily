# LLawCo: Learning Laws of Cooperation for Modeling Embodied Multi-Agent Behavior

- Authors: Qinhong Zhou, Chuang Gan, Anoop Cherian
- Venue/Year: arXiv 2026
- Domain: machine-learning
- Source: https://arxiv.org/pdf/2606.28182v1
- Keywords: cs.LG, cs.AI, cs.CV, cs.RO

## Abstract
Embodied agents operating in decentralized and partially observable environments have attracted growing attention in recent years. However, existing large language model (LLM)-based agents often exhibit behaviors that are misaligned with their partners or inconsistent with the environment state, leading to inefficient cooperation and poor task success. To address this challenge, we propose a novel framework, Learning Laws of Cooperation (LLawCo), that enables embodied agents to autonomously align with both their partners and task objectives. Our framework allows agents to reflect on past failures to extract misaligned behavioral patterns, which are used to derive high-level behavioral laws, such as "Talk when necessary" and "Wait for partner." These laws are explicitly incorporated into the agents' chains of thought via supervised fine-tuning, aligning their reasoning with task requirements and the behavior of other agents. To evaluate our approach, we introduce PARTNR-Dialog, a large-scale multi-agent communicative and cooperative planning benchmark built on the PARTNR environment. Experiments on existing tasks and our new benchmark demonstrate significant improvements in cooperative efficiency and task success rates. Across four backbone LLMs, our method achieves average success rate improvements of 4.5% on the PARTNR-Dialog benchmark and 6.8% on the TDW-MAT benchmark over state-of-the-art open-source communicative agent frameworks. See the LLawCo project page for details: https://www.merl.com/research/highlights/LLawCo

## TL;DR
[Write 2-4 sentences in Chinese.]

## Contributions
- [Contribution 1 in Chinese]
- [Contribution 2 in Chinese]
- [Contribution 3 in Chinese]

## Method
### Overview
[Describe the method in Chinese.]

### Components and I/O
| Component | Input | Output | Description |
| --- | --- | --- | --- |
| <Module A> | <Input> | <Output> | <Chinese description> |
| <Module B> | <Input> | <Output> | <Chinese description> |

### Key Equations
```tex
% Add equations from the paper.
```

### Workflow or Model Figure
![caption](figures/figure-1.png)
[Explain the figure in Chinese, including component inputs and outputs.]

## Experiments
- Datasets:
- Baselines:
- Metrics:
- Results:
- Ablations/Analysis:

## Conclusions
- Summary:
- Limitations:
- Future Work:
> Auto note: 此文件由自动流程生成，请补充中文详细解读、公式和图示。

