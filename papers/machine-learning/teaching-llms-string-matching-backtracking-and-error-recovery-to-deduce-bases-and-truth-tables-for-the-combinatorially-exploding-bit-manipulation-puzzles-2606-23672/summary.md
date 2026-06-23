# Teaching LLMs String Matching, Backtracking, and Error Recovery to Deduce Bases and Truth Tables for the Combinatorially Exploding Bit Manipulation Puzzles

- Authors: Prateek Agnihotri, Sanchit Jain, Prabhat Agnihotri, Aditya Prasad, Shubham Jain
- Venue/Year: arXiv 2026
- Domain: machine-learning
- Source: https://arxiv.org/pdf/2606.23672v1
- Keywords: cs.AI

## Abstract
This paper presents our algorithmic innovations for the NVIDIA Nemotron Model Reasoning Challenge, focusing on Bit Manipulation Puzzles. In this task, the objective is to discover a hidden logical rule transforming input binary strings to outputs, then apply it to unseen inputs. Large Language Models (LLMs) notoriously struggle here; traditional methods force them to simulate complex boolean logic and arithmetic, leading to hallucinations. Furthermore, the search space of bitwise operations (combinations of shifts, rotations, and logic gates) suffers from a severe combinatorial explosion. To overcome this computational intractability, we present a novel approach that abandons arithmetic logic entirely in favor of string similarity, structured search, and autonomous error recovery. Our core contributions are: 1. Bases and Truth Table Formulation: We reframe logic-gate deduction into a base-selection task, leveraging string similarity (minimal bit flips) to isolate primitive transformations ("bases") and deduce truth tables without complex arithmetic. 2. Backtracking DFS and Error Recovery: We formalize a search process that tests candidate bases, detects logical collisions across examples, and backtracks upon failure to perform robust error recovery. 3. Bit Tokenization and Interactive Reasoning SFT: We force the tokenizer to encode binary strings as individual single-bit tokens. We use dynamic masking to simulate external oracle feedback, training the model to hypothesize, self-evaluate, and backtrack natively. Evaluated on bit manipulation puzzles, our approach achieved over 96% validation accuracy. This represents the highest performance in this category, driving our 7th Place overall finish in the contest.

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

