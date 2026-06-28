# Paved with True Intents: Intent-Aware Training Improves LLM Safety Classification Across Training Regimes

- Authors: Jeremias Ferrao, Niclas Müller-Hof, Iustin Sîrbu, Traian Rebedea, Yftah Ziser
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2606.27210v1
- Keywords: cs.CL

## Abstract
We argue that safety classifiers should model user intent as an explicit signal between the prompt and the final label. To study this, we introduce AIMS, a human-annotated dataset of 1,724 difficult safety prompts, each paired with an intent description and harm label. We use AIMS to evaluate intent-aware training across supervised fine-tuning, preference learning, reasoning distillation, and reinforcement learning. Despite its size, AIMS enables competitive safety classifiers across training regimes: DPO from model-generated intent errors improves over SFT, and intent-conditioned distillation outperforms reasoning-only distillation in most teacher-student pairs. Most notably, directly rewarding intent faithfulness with GRPO yields the strongest average performance across five external safety benchmarks, while our intent-aware models form the inference latency-F1 Pareto frontier. These results show that faithful intent modeling is a compact, high-quality supervision signal for more robust safety classifiers.

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

