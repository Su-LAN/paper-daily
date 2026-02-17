# RF-GPT: Teaching AI to See the Wireless World

- Authors: Hang Zou, Yu Tian, Bohao Wang, Lina Bariah, Samson Lasaulce, Chongwen Huang, Mérouane Debbah
- Venue/Year: arXiv 2026
- Domain: machine-learning
- Source: https://arxiv.org/pdf/2602.14833v1
- Keywords: eess.SP, cs.LG

## Abstract
Large language models (LLMs) and multimodal models have become powerful general-purpose reasoning systems. However, radio-frequency (RF) signals, which underpin wireless systems, are still not natively supported by these models. Existing LLM-based approaches for telecom focus mainly on text and structured data, while conventional RF deep-learning models are built separately for specific signal-processing tasks, highlighting a clear gap between RF perception and high-level reasoning. To bridge this gap, we introduce RF-GPT, a radio-frequency language model (RFLM) that utilizes the visual encoders of multimodal LLMs to process and understand RF spectrograms. In this framework, complex in-phase/quadrature (IQ) waveforms are mapped to time-frequency spectrograms and then passed to pretrained visual encoders. The resulting representations are injected as RF tokens into a decoder-only LLM, which generates RF-grounded answers, explanations, and structured outputs. To train RF-GPT, we perform supervised instruction fine-tuning of a pretrained multimodal LLM using a fully synthetic RF corpus. Standards-compliant waveform generators produce wideband scenes for six wireless technologies, from which we derive time-frequency spectrograms, exact configuration metadata, and dense captions. A text-only LLM then converts these captions into RF-grounded instruction-answer pairs, yielding roughly 12,000 RF scenes and 0.625 million instruction examples without any manual labeling. Across benchmarks for wideband modulation classification, overlap analysis, wireless-technology recognition, WLAN user counting, and 5G NR information extraction, RF-GPT achieves strong multi-task performance, whereas general-purpose VLMs with no RF grounding largely fail.

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

