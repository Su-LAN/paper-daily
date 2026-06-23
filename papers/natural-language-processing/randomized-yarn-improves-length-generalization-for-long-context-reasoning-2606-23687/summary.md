# Randomized YaRN Improves Length Generalization for Long-Context Reasoning

- Authors: Manas Mehta, Fangcong Yin, Greg Durrett
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2606.23687v1
- Keywords: cs.CL

## Abstract
Large language models (LLMs) are typically pretrained on short sequences and then extended to work on longer sequences with additional training. However, such LLMs still struggle to further generalize to very long sequences. We propose Randomized YaRN, a training method that improves length generalization by combining YaRN-based positional extrapolation with randomized positional encoding and a length curriculum. During training on short context data, tokens are assigned YaRN positional encodings sampled from a larger position range, exposing the model to out-of-distribution positional representations even on short-context inputs. We evaluate Randomized YaRN on two challenging long-context reasoning benchmarks, BABILong and Multi-Round Coreference Resolution (MRCR). When training on data with <8K context, Randomized YaRN consistently improves reasoning performance on context lengths from 16K to 128K and outperforms standard fine-tuning, with the largest gains appearing at far out-of-distribution lengths. Our results suggest that progressively exposing models to OOD positional distributions provides an effective recipe for generalizable long-context reasoning.

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

