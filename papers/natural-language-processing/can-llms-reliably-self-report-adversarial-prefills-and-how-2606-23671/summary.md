# Can LLMs Reliably Self-Report Adversarial Prefills, and How?

- Authors: Quang Minh Nguyen, Uzair Ahmed, Taegyoon Kim
- Venue/Year: arXiv 2026
- Domain: natural-language-processing
- Source: https://arxiv.org/pdf/2606.23671v1
- Keywords: cs.CL

## Abstract
Prior work shows that large language models (LLMs) exhibit introspective capability on benign tasks. We extend the question to safety contexts and examine how reliably a model can recognize that its own prior response was elicited by an adversarial prefill attack. Across ten open-weight instruction-tuned LLMs (3B to 70B) and four safety benchmarks, no model reliably recognizes its own compromised outputs, with models claiming intent on prefilled responses at an average rate of $27.3\%$. Introspective signal stems largely from safety- and refusal-related reasoning. Orthogonalizing models' weights against the refusal direction collapses the gap between claiming rates on prefilled and natural outputs to near zero, though the direction is not its unique mediator. The signal is also probe-dependent: framing the question as internal intention versus external tampering elicits qualitatively different responses on the same models. We test three LoRA finetuning methods (SFT, GRPO, DPO) on eight models from 3B to 27B; all three widen the intention-probe gap on every model from 8B to 27B, with method ranking varying by model. The intervention does not transfer to the tampering probe and counterintuitively raises attack success rate under adversarial prefill on most models, amounting to a partial mitigation. These findings outline mechanisms underpinning the observed introspective signals in safety contexts and highlight risks in the reliability of LLM self-reports.

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

