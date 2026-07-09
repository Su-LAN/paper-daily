# A hierarchical memory architecture overcomes context limits in long-horizon multi-agent computational modeling

- Authors: Shivendra G. Tewari, Holly Kimko
- Venue/Year: arXiv 2026
- Domain: machine-learning
- Source: https://arxiv.org/pdf/2607.07666v1
- Keywords: q-bio.QM, cs.MA

## Abstract
Large language models (LLMs) demonstrate remarkable reasoning capabilities, yet their stateless architecture fundamentally limits deployment in long-horizon research workflows requiring multi-session continuity and quantitative rigor. Here we present Ensemble QSP, a multi-agent framework featuring a three-layer hierarchical memory architecture that keeps injected context bounded and constant in project duration (mid-term project state: median 301 tokens, max 4,050, across 104 runs) by capping each state category and evicting completed work, enabling continuous autonomous operation without context degradation. The system orchestrates five specialist worker agents under domain-expert principal investigators, enforcing physical constraints through physics-based checklists and structured-domain knowledge. Comprehensive benchmarking demonstrates robust autonomous pharmacokinetic-pharmacodynamic model selection without human intervention, consistent result quality across both lower-cost and frontier LLMs, improved PK parameter recovery relative to single-agent baselines, and stable model selection across linguistically diverse prompts of the same task. Feature-level ablation across physiologically based pharmacokinetic (PBPK) models spanning a broad complexity range shows that PI-agent oversight improves debugging efficiency while preserving final accuracy across conditions. The architecture is structurally domain-agnostic, adding a new scientific domain requires only a new PI agent configuration.

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

