# Diffusion Language Model for Recommendation

- Authors: Chengyi Liu, Yongqi Zhou, Junwei Pan, Zhixiang Feng, Chengguo Yin, Haijie Gu, Jie Jiang, Yinghao Liu, Yujuan Ding, Qing Li, Wenqi Fan
- Venue/Year: arXiv 2026
- Domain: information-retrieval
- Source: https://arxiv.org/pdf/2607.21519v1
- Keywords: cs.IR

## Abstract
Large language model (LLM)-empowered recommender systems have emerged as a promising paradigm for generative recommendation, leveraging their strong semantic reasoning and generative capacity to model complex, diverse user preferences. However, most existing approaches rely on an autoregressive paradigm that is suboptimal for recommendation. The next-token objective emphasizes sequential order rather than the structural inter-item dependencies underlying user preferences. In addition, prefix-constrained generation restricts bidirectional context and commits to left-to-right decoding, causing early errors to accumulate without correction. Inspired by the success of diffusion language models, we propose \textbf{DLMRec}, a discrete diffusion language model tailored for recommendation that offers a compelling alternative to autoregressive generation. Specifically, DLMRec introduces three key components to bridge diffusion language modeling with recommendation. First, a collaborative-aware stochastic tokenizer encodes multi-hop collaborative signals into expressive discrete tokens compatible with diffusion modeling. Second, a curriculum-driven training strategy aligns the denoising process with preference recovery through progressive item- and token-level learning. Third, a stability-aware voting mechanism aggregates iterative predictions to improve generation consistency and robustness.

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

