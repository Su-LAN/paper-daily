# Enhancing Decision-Making with Large Language Models through Multi-Agent Fictitious Play

- Authors: Leyang Shen, Yang Zhang, Xiaoyan Zhao, Chun Kai Ling, Tat-Seng Chua
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2606.19308v1
- Keywords: cs.CL, cs.MA

## Abstract
Large language model (LLM)-based multi-agent systems (MAS) have demonstrated great potential in solving tasks with execution complexity, by distributing subtasks across cooperative agents. However, this divide-and-conquer paradigm falls short on decision-making tasks that are also prevalent in the real world. These tasks require simultaneous reasoning from the stances of all involved stakeholders whose decisions are mutually dependent and thus cannot be solved in isolation. We characterize this challenge as stance entanglement, a form of decision complexity distinct from execution complexity. To address it, we propose Multi-Agent Fictitious Play (MAFP), a novel MAS paradigm that represents stakeholder stances as agents and formulates decision-making as an equilibrium-seeking process. Built on the game-theoretic principle of fictitious play, MAFP iteratively updates each agent's decision by best responding to the empirical mixture of other agents' past decisions. This enables agents to expose and address one another's weaknesses, progressively improving decision quality and robustness. We evaluate MAFP on challenging decision-making tasks that test the capability of deciding strategies for competitive scenarios prior to acting. MAFP outperforms both single-round and multi-round baselines on two complementary metrics, tournament strength and robustness, demonstrating its effectiveness in addressing stance entanglement.

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

