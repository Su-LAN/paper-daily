# Sparse Reward Subsystem in Large Language Models

- Authors: Guowei Xu, Mert Yuksekgonul, James Zou
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2602.00986v1
- Keywords: cs.CL

## Abstract
In this paper, we identify a sparse reward subsystem within the hidden states of Large Language Models (LLMs), drawing an analogy to the biological reward subsystem in the human brain. We demonstrate that this subsystem contains value neurons that represent the model's internal expectation of state value, and through intervention experiments, we establish the importance of these neurons for reasoning. Our experiments reveal that these value neurons are robust across diverse datasets, model scales, and architectures; furthermore, they exhibit significant transferability across different datasets and models fine-tuned from the same base model. By examining cases where value predictions and actual rewards diverge, we identify dopamine neurons within the reward subsystem which encode reward prediction errors (RPE). These neurons exhibit high activation when the reward is higher than expected and low activation when the reward is lower than expected.

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

