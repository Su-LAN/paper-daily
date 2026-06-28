# Resource-Aware Neuro-Symbolic Reasoning for Local Small Language Models

- Authors: Carlos Ramírez Ovalle, Abel Alvarez
- Venue/Year: arXiv 2026
- Domain: machine-learning
- Source: https://arxiv.org/pdf/2606.27281v1
- Keywords: cs.LO

## Abstract
Small language models can run locally on consumer hardware, but structured reasoning often pushes users toward repeated sampling or larger models. This article studies a bounded neuro-symbolic alternative for local inference: a model translates a problem into typed finite-domain rules and constraints, a symbolic layer checks traceability and consistency, and a deterministic solver performs the reasoning step. The resulting Verifiable Formalization and Repair pipeline (VFR-LLM) tests when symbolic verification can replace repeated sampling without weakening accuracy. We evaluate it through LM Studio on Apple Silicon, using Qwen3-4B-2507 as the primary model, with Phi-4-mini-reasoning and Gemma-3n-E4B as robustness checks. On 120 generated pure-precedence problems, Qwen VFR-LLM achieves 0.983 accuracy, versus 0.700 for serial self-consistency using one model call instead of five. On a 120-instance BBH-derived extended logical-deduction subset, it reaches 0.933 versus 0.283. The advantage persists against a stronger cost-aware adaptive self-consistency baseline, which lowers sampling cost but not the single-call accuracy gap. Gemma reproduces the same model-dependent boundaries and Phi is negative on typed constraints. The contribution is bounded: finite-domain logic can replace repeated local sampling for some structured tasks, saving model calls and serial latency, with stratum-dependent token savings.

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

