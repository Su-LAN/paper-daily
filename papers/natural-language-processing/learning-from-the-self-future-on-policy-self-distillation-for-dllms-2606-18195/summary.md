# Learning from the Self-future: On-policy Self-distillation for dLLMs

- Authors: Yifu Luo, Zeyu Chen, Haoyu Wang, Xinhao Hu, Yuxuan Zhang, Zhizhou Sha, Shiwei Liu
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2606.18195v1
- Keywords: cs.CL

## Abstract
On-policy self-distillation (OPSD) has proven effective for post-training large language models (LLMs), yet its application to diffusion LLMs (dLLMs) remains unexplored. Existing OPSD methods are inherently autoregressive-centric. They inject privileged information via left-to-right prefix conditioning with token-level divergence supervision, a design that fundamentally conflicts with the arbitraryorder generation of dLLMs. We introduce d-OPSD, the first OPSD framework tailored for dLLMs. Our approach makes two core contributions. First, we reframe self-teacher construction by using self-generated answers as suffix conditioning, enabling the student model to learn from "self future-experience" rather than privileged prefixes. Second, we shift supervision from token-level to step-level, aligning training with the iterative denoising process of dLLMs. Experiments across four reasoning benchmarks show that d-OPSD consistently outperforms RLVR and SFT baselines with superior sample efficiency, requiring only around 10% of the optimization steps by RLVR and opening a promising pathway for dLLM posttraining. The code is available at https://github.com/xingzhejun/d-OPSD.

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

