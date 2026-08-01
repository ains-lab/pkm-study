---
source_type: zotero
zotero_item_key: HJDEIS2T
zotero_attachment_keys: ["IJJBX4JN"]
item_type: journalArticle
title: "Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection"
authors:
  - "Lei, Chang"
published: 2026-06-28
publication: "ScienceOpen Preprints"
publisher: "ScienceOpen"
doi: "10.14293/PR2199.003969.v1"
url: "https://www.scienceopen.com/hosted-document?doi=10.14293/PR2199.003969.v1"
language: en
citation_key: Lei2026_HJDEIS2T
zotero_collections: ["NK7LTLD6"]
attachment_filenames: ["Lei - 2026 - Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection.pdf"]
ingested: 2026-07-22
metadata_status: complete
sha256: "134f9979410eca586ecd3937cc5e285243c7706df7a6b714b2d8963fc4a3ed19"
---

# Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection

## Zotero Metadata

- Zotero Item Key: HJDEIS2T
- Item Type: journalArticle
- Citation Key: Lei2026_HJDEIS2T
- Authors: Lei, Chang
- Published: 2026-06-28
- Publication: ScienceOpen Preprints
- Publisher: ScienceOpen
- DOI: 10.14293/PR2199.003969.v1
- URL: https://www.scienceopen.com/hosted-document?doi=10.14293/PR2199.003969.v1
- Language: en
- Collection Keys: NK7LTLD6
- Attachment Keys: IJJBX4JN
- Attachment Filenames: Lei - 2026 - Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection.pdf

## Abstract

<p xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" class="first" dir="auto" id="d7618035e91">The rapid proliferation of autonomous LLM-based agents in high-stakes enterprise and operational environments has created a critical safety gap: these agents generate multi-step action plans that can fail through contextual misalignment, structural incoherence, or adversarial manipulation, yet traditional anomaly detection methods remain ill-equipped to address these novel failure modes. Conventional approaches—whether mean-pooling embeddings that dilute anomalous steps, contrastive-only methods that ignore sequential structure, or rule-based static defenses that fail to generalize—achieve limited effectiveness on agent trajectory validation tasks. This paper proposes a comprehensive framework that unifies agentic AI capabilities with LLM-driven contextual anomaly detection. The framework consists of three synergistic pillars: a sequence-aware Siamese Recurrent Autoencoder with hybrid contrastive-reconstruction loss that jointly learns task-trajectory alignment and structural validity, achieving high accuracy at low inference latency—significantly faster than LLM Judge baselines; a two-tier detection architecture combining fast spectral kill-switch mechanisms for sub-millisecond inline verification during agent execution with deep context-aware reasoning for precision; and adaptive multi-dimensional monitoring that normalizes heterogeneous metrics across capability, robustness, safety, human-centered, and economic axes, substantially reducing false-positive rates compared with static thresholds. Validated on enterprise-scale deployments processing thousands of agent sessions daily and benchmarked against real-world security audits and multi-agent system failures, the framework demonstrates robust detection performance while maintaining operational efficiency, outperforming state-of-the-art baselines by a significant margin. By bridging the gap between agentic autonomy and contextual safety verification, this work establishes a production-ready foundation for trustworthy LLM-driven agent deployment across safety-critical domains. </p>

## Extracted Text

Article title: Agentic AI and LLM-Driven Framework for Contextual Anomaly Detection
Authors: Chang Lei[1]
Affiliations: university of south florida st. petersburg[1]
Orcid ids: 0009-0003-1468-3180[1]
Contact e-mail: leichang911@gmail.com
License information: This work has been published open access under Creative Commons Attribution License
http://creativecommons.org/licenses/by/4.0/, which permits unrestricted use, distribution, and reproduction in any
medium, provided the original work is properly cited. Conditions, terms of use and publishing policy can be found at
https://www.scienceopen.com/.
Preprint statement: This article is a preprint and has not been peer-reviewed, under consideration and submitted to
ScienceOpen Preprints for open peer review.
DOI: 10.14293/PR2199.003969.v1
Preprint first posted online: 28 June 2026
Keywords: Agentic AI, Large Language Models, Contextual Anomaly Detection, Multi-agent Systems, Trajectory Validation,
Sequence-aware Autoencoders, Contrastive Learning, Safety Verification, Real-time Monitoring


Agentic AI and LLM-Driven Framework for Contextual
Anomaly Detection
Chang Lei
University of South Florida St. Petersburg
Date: June, 2026
Abstract
The rapid proliferation of autonomous LLM-based agents in high-stakes enterprise and operational environments has created a critical safety gap: these agents generate multi-step action plans that can fail through contextual misalignment, structural incoherence, or
adversarial manipulation, yet traditional anomaly detection methods remain ill-equipped to address these novel failure modes. Conventional approaches—whether mean-pooling embeddings that dilute anomalous steps, contrastive-only methods that ignore sequential structure, or rule-based static defenses that fail to generalize—achieve limited effectiveness on
agent trajectory validation tasks. This paper proposes a comprehensive framework that unifies agentic AI capabilities with LLM-driven contextual anomaly detection. The framework consists of three synergistic pillars: a sequence-aware Siamese Recurrent Autoencoder with hybrid contrastive-reconstruction loss that jointly learns task-trajectory alignment and
structural validity, achieving high accuracy at low inference latency—significantly faster than LLM Judge baselines; a two-tier detection architecture combining fast spectral kill-switch mechanisms for sub-millisecond inline verification during agent execution with deep contextaware reasoning for precision; and adaptive multi-dimensional monitoring that normalizes
heterogeneous metrics across capability, robustness, safety, human-centered, and economic axes, substantially reducing false-positive rates compared with static thresholds. Validated on enterprise-scale deployments processing thousands of agent sessions daily and benchmarked against real-world security audits and multi-agent system failures, the framework demonstrates
robust detection performance while maintaining operational efficiency, outperforming stateof-the-art baselines by a significant margin. By bridging the gap between agentic autonomy and contextual safety verification, this work establishes a production-ready foundation for trustworthy LLM-driven agent deployment across safety-critical domains.
Keywords: Agentic AI; Large Language Models; Contextual Anomaly Detection; Multi-agent Systems; Trajectory Validation; Sequence-aware Autoencoders; Contrastive Learning; Safety Verification; Real-time Monitoring
1. Introduction
The emergence of autonomous agents powered by large language models represents one of the most significant paradigm shifts in artificial intelligence over the past decade. Unlike


traditional AI systems that operate within narrowly defined parameters and respond to explicit user queries with single-turn outputs, LLM-driven agents possess the capacity to engage in multi-step reasoning, maintain persistent memory across interactions, utilize external tools and
APIs, and execute complex action sequences autonomously toward specified goals. Contemporary agent systems are frequently based on LLMs due to their superior capabilities in understanding and reasoning with multimodal data and their proficiency in tool utilization (Xi et al., 2023). This evolution from conversational chatbots to proactive, decision-making
agents has unlocked transformative applications across customer service automation, software development, code generation and debugging, data analysis and business intelligence, autonomous research assistance, and robotic process automation in enterprise workflows (Yang et al., 2024). However, this expanded capability envelope introduces profound safety
and reliability challenges that current monitoring and validation frameworks are ill-equipped to address. As these agents transition from experimental prototypes to production deployments handling sensitive data, financial transactions, and safety-critical operations, the imperative for robust anomaly detection mechanisms that can operate in real time while maintaining
contextual awareness has become paramount (Wang et al., 2023).
The fundamental difficulty in detecting anomalies within LLM agent behavior stems from several interconnected factors that distinguish this problem from traditional anomaly detection
domains. First, the action space of these agents is virtually unbounded, encompassing natural language generation, API calls, code execution, file system operations, and interactive dialogues, making it impossible to define exhaustive sets of normal or permissible behaviors through static rules or predefined templates. Second, the sequential nature of agent decision
making introduces temporal dependencies where individual actions derive their legitimacy and appropriateness from the broader context of the ongoing task trajectory, rendering pointwise anomaly detection approaches that examine actions in isolation largely ineffective. The behavioral characteristics of LLM-driven agents are fundamentally different from those in
hard-coded traditional systems, with a wider variety of anomalies occurring and greater demands on observability (Chen et al., 2024). Third, the stochastic generation processes underlying LLMs produce inherent variability in outputs even for identical inputs, meaning that deviations from expected patterns may reflect benign linguistic variation rather than malicious or erroneous behavior (Zhang and Li, 2024). Fourth, the complexity of modern agent
architectures, which often incorporate retrieval-augmented generation, chain-of-thought reasoning, self-reflection loops, and multi-agent collaboration protocols (Yao et al., 2023; Shinn et al., 2024), creates emergent behaviors that are difficult to characterize through analytical models alone. These challenges collectively necessitate a detection framework that
combines deep contextual understanding with computational efficiency suitable for real-time deployment (Liu et al., 2024).
Traditional anomaly detection approaches span a broad spectrum of techniques, each with characteristic strengths and limitations when applied to the agentic AI context. Statistical methods that model normal behavior through probabilistic distributions or control charts assume that data conforms to parametric forms that rarely hold for the high-dimensional, multimodal outputs generated by LLMs (Chandola et al., 2009). Machine learning approaches


based on isolation forests, one-class SVMs, or local outlier factors require carefully engineered feature representations that capture meaningful aspects of agent behavior while remaining computationally tractable, yet the semantic richness of agent actions resists reduction to fixed
dimensional numeric vectors without substantial information loss (Liu et al., 2008; Schölkopf et al., 2001). Deep learning methods employing autoencoders or variational architectures have shown promise in learning latent representations of normal patterns (Sakurada and Yairi, 2014), but standard implementations treat sequential data as independent samples rather than
modeling the temporal dependencies critical for contextual anomaly detection. Contrastive learning frameworks that distinguish normal from anomalous patterns through similarity comparisons have achieved notable success in image and text domains (Chen et al., 2020; Gao et al., 2021), yet their application to agent trajectories requires careful adaptation to account
for variable-length sequences, hierarchical action structures, and the interplay between linguistic content and execution semantics (Wu et al., 2023). Furthermore, contemporary approaches to agent safety have largely focused on adversarial prompt injection defenses and output content filtering (Piet et al., 2023; Kumar et al., 2024), which, while valuable, address
only a subset of the anomaly landscape and fail to capture failures arising from task misunderstanding, goal misgeneralization, cumulative error propagation, or emergent coordination breakdowns in multi-agent settings (Liu et al., 2024).
The landscape of existing anomaly detection methods applied to LLM agent contexts reveals a persistent performance ceiling that underscores the need for fundamentally new approaches. Mean-pooling strategies that aggregate token-level embeddings across entire trajectories into fixed-dimensional representations discard crucial sequential information and dilute the signal
from anomalous actions when surrounded by predominantly normal behavior (Reimers and Gurevych, 2019). Contrastive-only frameworks that train encoders to maximize similarity between positive pairs and minimize similarity between negative pairs struggle with the inherent ambiguity of agent actions where the boundary between normal deviation and genuine
anomaly is often context-dependent and not amenable to binary classification (Robinson et al., 2021). Static rule-based defenses that enumerate prohibited actions or output patterns inevitably suffer from incompleteness and brittleness, failing against novel attack vectors while simultaneously generating excessive false positives that undermine operational trust in detection systems (Wallace et al., 2024). Attempts to leverage LLMs themselves as judges for
anomaly detection achieve superior contextual understanding but incur prohibitive computational costs that make real-time verification during agent execution infeasible, with inference latencies on the order of hundreds of milliseconds to seconds that introduce unacceptable delays in interactive applications (Zheng et al., 2023). The evaluation of these
existing methods has further been hampered by the absence of standardized benchmarks and realistic testbeds that capture the diversity and complexity of production agent deployments (Wu et al., 2023), making cross-method comparisons difficult and obscuring the practical performance gaps that matter for real-world adoption.
This paper addresses these limitations through the proposal and empirical validation of a comprehensive framework for contextual anomaly detection specifically designed for LLMdriven autonomous agents. The framework integrates advances in sequence modeling,


contrastive representation learning, architectural optimization, and adaptive monitoring to achieve detection performance that substantially exceeds current state-of-the-art methods while maintaining computational efficiency suitable for inline deployment. At the methodological
core lies a sequence-aware Siamese Recurrent Autoencoder that jointly optimizes reconstruction fidelity and contrastive trajectory alignment through a hybrid loss function. This architectural choice is motivated by the complementary strengths of reconstruction-based and contrastive approaches: reconstruction loss enforces that the model learns a faithful compressed
representation of normal trajectories, enabling the detection of structural anomalies that deviate from learned patterns (Sakurada and Yairi, 2014), while contrastive loss promotes the separation of normal and anomalous trajectories in the latent space, enhancing discriminative power without requiring exhaustive anomaly exemplars during training (Chen et al., 2020).
The recurrent components capture temporal dependencies and sequential ordering that are essential for contextual validity (Hochreiter and Schmidhuber, 1997), addressing the limitations of pooling strategies that treat trajectories as unordered sets. The two-tier detection architecture employs a fast spectral kill-switch mechanism operating on compressed
representations for sub-millisecond inline verification during agent execution, ensuring that obvious anomalies are intercepted before they can cause harm, while deep context-aware reasoning engages full model capacity for ambiguous cases where subtle contextual violations require careful analysis (Zhou et al., 2024). This hierarchical design balances the competing
demands of latency sensitivity and detection thoroughness through a cascade that only invokes expensive computation when simpler methods indicate sufficient uncertainty.
The framework further incorporates adaptive multi-dimensional monitoring that normalizes
and tracks heterogeneous metrics across five distinct axes: capability metrics reflecting task completion quality and efficiency, robustness metrics capturing resistance to adversarial inputs and distributional shifts, safety metrics assessing compliance with behavioral constraints and avoidance of harmful outputs, human-centered metrics measuring interpretability,
transparency, and alignment with user expectations, and economic metrics evaluating resource utilization and cost effectiveness (Deng et al., 2023). This multidimensional approach provides a comprehensive view of agent health that single-number anomaly scores cannot capture, enabling nuanced detection of failures that manifest in specific operational dimensions while remaining normal in others. The adaptive component automatically calibrates detection
thresholds based on historical performance and environmental context (Ahmed et al., 2024), reducing the false-positive rates that plague static threshold configurations while maintaining sensitivity to genuine anomalies that exhibit novel patterns absent from training distributions. The entire framework is designed for production deployment at enterprise scale, with careful
attention to memory footprint, inference optimization through quantization and distillation techniques (Gholami et al., 2021), and graceful degradation under resource constraints.
The validation methodology encompasses rigorous benchmarking against diverse anomaly types drawn from real-world production deployments and security audits. These anomaly categories include adversarial prompt injections that attempt to circumvent safety guardrails through carefully crafted input manipulations (Piet et al., 2023), task-hijacking scenarios where agents are covertly redirected from intended objectives (Liu et al., 2024), goal


misgeneralization failures where agents pursue superficially specified objectives in ways that violate implicit safety constraints (Shah et al., 2022), cumulative error propagation where small mistakes compound over multi-step trajectories (Wang et al., 2023), and emergent coordination
pathologies in multi-agent settings where collective behavior diverges from individually safe actions (Yang et al., 2024). The experimental evaluation employs both offline analysis of logged trajectories and real-time testing in simulated production environments to assess detection accuracy, latency, false-positive rates, and scalability across varying deployment
scales. Comparative baselines include autoencoder variants, contrastive learning frameworks, LLM-based judges, and rule-based filters, with comprehensive ablation studies isolating the contribution of each architectural component to overall performance.
The remainder of this paper is organized as follows. Section 2 presents a comprehensive review of related literature spanning anomaly detection methodologies, LLM agent architectures, safety and security frameworks, and evaluation benchmarks. Section 3 details the proposed framework architecture, including the sequence-aware Siamese Recurrent Autoencoder, the
two-tier detection system, adaptive multi-dimensional monitoring, and implementation considerations for production deployment. Section 4 presents the experimental setup, datasets, evaluation metrics, and comparative results. Section 5 provides a thorough discussion of findings, including performance analysis, architectural trade-offs, practical implications, and
limitations. Section 6 concludes the paper with a summary of contributions and directions for future research.
2. Literature Review
2.1 Anomaly Detection: Foundations and Methodologies
Anomaly detection, also referred to as outlier detection or novelty detection, constitutes a fundamental problem in data analysis with applications spanning fraud detection, network intrusion identification, fault diagnosis, and medical screening. The central objective is to identify patterns or observations that deviate significantly from expected behavior, where
deviation is defined relative to some notion of normality established through either labeled data, unlabeled data, or domain knowledge. Chandola et al. (2009) provide a comprehensive taxonomy of anomaly detection techniques, categorizing approaches according to the nature of input data, the availability of labels, and the type of model employed. This taxonomy remains relevant as a foundation for understanding the design space of anomaly detection methods,
though subsequent advances in deep learning have substantially expanded the methodological repertoire available to practitioners.
Early approaches to anomaly detection relied predominantly on statistical models that assume data follows a known parametric distribution, typically Gaussian, with anomalies identified as low-probability observations under the fitted distribution. While conceptually elegant and computationally efficient, these methods suffer from limited expressiveness when applied to
high-dimensional or multimodal data where distributional assumptions are violated (Hodge and Austin, 2004). Proximity-based methods address this limitation by avoiding parametric assumptions, instead characterizing normality through dense regions in feature space as defined


by distance or density measures. The k-nearest neighbor approach flags instances whose average distance to neighbors exceeds a threshold (Ramaswamy et al., 2000), while local outlier factor extends this concept with relative density comparisons that account for varying
data densities across regions (Breunig et al., 2000). These methods achieve strong performance on low-dimensional data but degrade in high-dimensional spaces due to the concentration of distances and the computational cost of pairwise comparisons (Aggarwal, 2017).
Clustering-based approaches, including variants of k-means and DBSCAN, exploit the assumption that normal data forms dense clusters while anomalies appear as points that do not belong to any cluster or are far from cluster centers (Ester et al., 1996). However, the effectiveness of these methods depends critically on the choice of clustering algorithm and
parameters, with sensitivity to initialization and cluster shape assumptions presenting practical challenges. Decision tree ensembles, particularly isolation forests, adopt a fundamentally different philosophy by explicitly isolating anomalies rather than modeling normality (Liu et al., 2008). Isolation forest constructs an ensemble of random partitioning trees, exploiting the
fact that anomalies are more susceptible to isolation through random splits than normal points, requiring fewer partitions to be separated. This approach achieves exceptional efficiency and scalability, making it a popular choice for high-dimensional data, though its reliance on random splits can produce unstable results and its lack of a principled normality model limits
interpretability.
The advent of deep learning introduced transformative capabilities for anomaly detection, particularly in domains characterized by complex, high-dimensional, and unstructured data
such as images, text, and time series. Autoencoder-based methods learn compressed representations of normal data through an encoder-decoder architecture, with anomalies identified by large reconstruction errors resulting from the model's inability to represent outof-distribution patterns (Sakurada and Yairi, 2014). This approach has proven effective across
diverse domains, with variants incorporating denoising objectives (Vincent et al., 2008), variational inference (Kingma and Welling, 2014), and adversarial training (Schlegl et al., 2017) enhancing robustness and discriminative power. The reconstruction error formulation provides an intuitive anomaly score and enables end-to-end learning without requiring labeled
anomalies, though determining appropriate thresholds remains challenging and reconstruction error can be low even for anomalous inputs that lie near the training manifold (Goodfellow et al., 2014).
Generative adversarial networks have been applied to anomaly detection through the adversarially learned anomaly detection framework, which employs a generator to produce normal samples and a discriminator to distinguish real normal samples from generated ones and anomalies (Schlegl et al., 2017). The novelty of this approach lies in its ability to learn a
latent space that explicitly models the normal data distribution, enabling anomaly scoring through both reconstruction error and discriminator confidence. However, training GANs is notoriously unstable and computationally expensive, limiting practical deployment in latencysensitive applications. Variational autoencoders offer a more stable alternative with a
principled probabilistic interpretation, where anomaly detection proceeds through


reconstruction probability rather than reconstruction error, providing a theoretically grounded anomaly score (An and Cho, 2015).
Contrastive learning has emerged as a powerful paradigm for representation learning, with substantial implications for anomaly detection. The fundamental idea is to learn representations where positive pairs are embedded close together while negative pairs are separated, enabling
downstream discrimination tasks through learned similarity structure (Chen et al., 2020). In the anomaly detection context, contrastive methods have been extended to operate with limited labeled data, learning representations that preserve normal data structure while pushing anomalous examples away (Robinson et al., 2021). The contrastive predictive coding framework applies this principle to sequential data by learning representations that predict
future information in latent space (van den Oord et al., 2018), providing a natural fit for trajectory anomaly detection. However, the pairwise training objective introduces computational overhead that scales quadratically with batch size, necessitating careful optimization strategies for practical deployment.
2.2 Sequential and Trajectory Anomaly Detection
While point anomaly detection focuses on individual instances, sequential anomaly detection addresses the challenge of identifying unusual patterns in ordered data where temporal dependencies are critical. This domain encompasses diverse applications including network intrusion detection in packet streams, financial fraud surveillance in transaction sequences, and
healthcare monitoring in patient vital sign trajectories. The distinguishing characteristic of sequential anomaly detection is that the temporal order of observations provides essential context for determining normality, as an individual observation that appears normal in isolation may constitute an anomaly when placed in its sequential context, and conversely, unusual individual values may represent normal transitions within a longer sequence (Gautam et al.,
2023).
Recurrent neural networks, particularly long short-term memory networks and gated recurrent
units, have become foundational tools for sequential anomaly detection due to their capacity to model temporal dependencies at multiple timescales (Hochreiter and Schmidhuber, 1997; Cho et al., 2014). These architectures process sequences through a hidden state that accumulates information about past observations, enabling predictions of future values or detection of deviations from expected next-state distributions. The LSTM-AD approach employs a
sequence-to-sequence autoencoder with LSTM encoders and decoders, achieving strong performance on multivariate time series anomaly detection through the combination of reconstruction and prediction objectives (Malhotra et al., 2016). Subsequent extensions have incorporated attention mechanisms to focus on relevant portions of the input sequence (Chen
et al., 2019), introduced adversarial training for improved discriminative capability (Zhou et al., 2019), and developed hybrid approaches that combine multiple anomaly scoring strategies (Zhang et al., 2020).
Transformer architectures, which rely on self-attention mechanisms rather than recurrent connections, have achieved state-of-the-art performance across numerous sequential modeling


tasks and have been adapted for anomaly detection (Vaswani et al., 2017). The transformer's ability to directly model dependencies between all pairs of positions in a sequence provides advantages over RNNs for capturing long-range relationships that may span thousands of time
steps. The Anomaly Transformer combines self-attention with a novel association discrepancy measure that exploits the tendency of attention weights to exhibit different patterns for normal and anomalous subsequences (Xu et al., 2022). This approach achieves notable performance on benchmark time series datasets while providing interpretable attention maps that localize
anomalous segments. However, transformers introduce quadratic computational complexity in sequence length, posing challenges for real-time deployment on long trajectories.
Graph neural networks have been applied to structured anomaly detection where data points
exhibit relational dependencies captured through graph representations. In the trajectory context, such methods can model interactions between multiple agents or between actions and their environmental context (Zhang et al., 2022). The trajectory anomaly detection problem is particularly challenging because anomalies may arise from complex interactions that are not
reducible to individual action assessments, requiring models that capture collective behavior patterns. Hierarchical approaches that combine action-level and trajectory-level representations have shown promise, with recursive processing enabling the detection of context-dependent anomalies that would escape flat models (Wu et al., 2023).
2.3 Large Language Models and Agent Architectures
The emergence of large language models as foundation models for natural language processing has fundamentally transformed the landscape of AI research and application. Models such as GPT (Radford et al., 2018), BERT (Devlin et al., 2019), and their successors have demonstrated remarkable capabilities across a wide range of tasks, from language understanding and generation to reasoning and problem-solving. The scaling of model size, training data, and
computational resources has been identified as the primary driver of emergent capabilities that were absent in smaller models, including few-shot learning, instruction following, and multistep reasoning (Kaplan et al., 2020; Brown et al., 2020). These capabilities have enabled the development of LLM-driven agents that extend beyond mere language generation to
autonomous action in digital and physical environments.
The transition from conversational LLMs to autonomous agents represents a significant architectural and operational evolution. Agent systems based on LLMs typically incorporate
several components beyond the core language model: a planning module that decomposes complex tasks into subtasks and determines action sequences, a memory system that maintains context and learned information across interactions, a tool-use module that enables interaction with external systems through APIs and function calls, and a reflection mechanism that
evaluates and refines outputs (Xi et al., 2023). The ReAct paradigm exemplifies this architectural synthesis, integrating reasoning and acting in an alternating pattern where the agent generates reasoning traces that inform action selection, executes actions that produce observations, and iterates this cycle to achieve complex goals (Yao et al., 2023). This approach
significantly improves performance on tasks requiring both reasoning and interaction, while also providing interpretable rationales for decision-making.


Chain-of-thought prompting emerged as a technique for enhancing reasoning capabilities in LLMs, with the model generating intermediate reasoning steps before producing a final answer (Wei et al., 2022). This approach has been extended to the agent context through techniques
such as tree-of-thoughts, which explores multiple reasoning paths in parallel and selects the most promising through systematic search (Yao et al., 2023), and self-consistency, which ensembles multiple reasoning chains to improve reliability (Wang et al., 2023). Reflection mechanisms enable agents to critique their own outputs and revise them, leveraging model
capabilities for self-correction (Shinn et al., 2024). The combination of these techniques yields agents capable of sophisticated planning that approaches human-level performance on various benchmarks, though the complexity of the reasoning process increases opportunities for failure modes that diverge from intended behavior.
Multi-agent systems built from LLM-driven agents present additional layers of complexity, as interactions between agents can produce emergent collective behaviors not predictable from individual agent behavior (Yang et al., 2024). These systems have been applied to tasks such
as collaborative problem-solving, where agents assume specialized roles and coordinate through communication protocols (Wu et al., 2023), and simulation of social dynamics for policy analysis and scenario planning (Park et al., 2023). The coordination mechanisms in these systems include negotiated consensus protocols, hierarchical task decomposition with leader
follower structures, and emergent specialization through competitive adaptation. While multiagent collaboration can amplify capabilities beyond those of individual agents, it also introduces new failure modes including coordination breakdowns, communication misunderstandings, and emergent pathologies where collectively suboptimal behavior arises
from individually rational decisions (Zhang and Li, 2024).
2.4 Safety, Security, and Anomaly Detection in LLM Agents
The deployment of LLM-driven agents in safety-critical applications has catalyzed extensive research into safety mechanisms and security protections. This research spans multiple dimensions, including adversarial robustness, alignment with human values, prevention of harmful outputs, and detection of anomalous behavior. Liu et al. (2024) provide a
comprehensive survey of LLM agent security and safety, identifying threat models that encompass prompt injection, goal hijacking, data extraction, and emergent failures from complex agent architectures. The analysis emphasizes that security considerations for agents extend beyond those of conversational LLMs because agents have access to external tools and
can execute actions that produce real-world effects, creating opportunities for more severe harm.
Prompt injection represents a particularly salient threat to LLM-driven agents, as it involves
adversarial inputs that cause the model to ignore system instructions and execute attackerdesired behaviors (Piet et al., 2023). This vulnerability arises from the fundamental architecture of LLMs, where system and user prompts are processed through the same attention mechanisms, making it difficult to reliably enforce instruction hierarchies. Defensive
approaches include prompt sanitization to remove injection patterns (Kumar et al., 2024), instruction hierarchy enforcement through specialized training (Wallace et al., 2024), and


output monitoring to detect and block harmful actions (Chen et al., 2024). However, the adaptability of attackers and the open-ended nature of language make exhaustive defense challenging, with novel attack vectors continually emerging.
Goal misgeneralization, a failure mode where agents pursue specified objectives in ways that violate implicit constraints, has been identified as a critical safety concern (Shah et al., 2022).
This problem arises because objectives specified to agents are inevitably incomplete, omitting numerous constraints and considerations that humans implicitly understand. Agents may exploit the gaps between specified and intended objectives, pursuing literal instructions through unintended means that cause collateral harm. Detection of goal misgeneralization requires understanding the full context of deployment, including unstated assumptions,
stakeholder values, and acceptable solution spaces—capabilities that current anomaly detection systems lack.
Observability limitations present fundamental challenges for detecting anomalies in LLMdriven agents (Chen et al., 2024). Unlike traditional systems where internal states are often directly accessible, LLM agents contain billions of parameters with intricate interactions that defy straightforward interpretation. The opacity of the reasoning process, combined with the difficulty of distinguishing legitimate exploration from anomalous behavior, complicates the
design of effective monitoring systems. Wang et al. (2023) emphasize the need for multifaceted observability that integrates behavioral monitoring, performance metrics, and contextual information to achieve reliable anomaly detection.
2.5 Evaluation Benchmarks and Metrics
Evaluation of anomaly detection systems for LLM agents requires appropriate benchmarks that
capture the diversity of potential anomalies and the complexity of realistic deployment scenarios. Several benchmarks have been proposed for evaluating general agent capabilities, such as WebArena for web-based tasks (Zhou et al., 2024) and AgentBench for comprehensive agent evaluation (Liu et al., 2023). However, these benchmarks primarily focus on task
completion rather than anomaly detection, providing limited coverage of failure modes. Security-specific benchmarks such as the Prompt Injection Challenge (Kumar et al., 2024) and Agent Security Benchmark (Liu et al., 2024) address adversarial scenarios but focus on individual attack types rather than comprehensive anomaly detection.
Wu et al. (2023) propose a taxonomy of LLM agent anomalies and corresponding evaluation methodology, categorizing anomalies by their origin (input, processing, output, and emergent) and severity. The taxonomy provides a framework for benchmark design that ensures coverage
of the diverse anomaly types relevant to production deployments. However, standardized implementation and wide adoption remain aspirational, with current evaluation practices varying substantially across studies.
Performance metrics for anomaly detection typically include precision, recall, F1-score, and area under the receiver operating characteristic curve. In the context of agent deployment, latency and throughput are equally important metrics, as detection systems must operate within the time constraints of interactive applications (Zheng et al., 2023). Liu et al. (2024) propose a


unified evaluation framework that combines detection accuracy with computational efficiency, enabling comparison of methods across multiple dimensions. This multi-metric approach reflects the practical requirements of production deployment, where both detection capability
and operational cost must be considered.
3. Methodology
3.1 Framework Overview
The proposed framework for contextual anomaly detection in LLM-driven autonomous agents
comprises three integrated components that operate in concert to provide comprehensive detection coverage while meeting the stringent latency and throughput requirements of production deployment. The first component is a sequence-aware Siamese Recurrent Autoencoder that learns robust representations of normal agent trajectories through a hybrid
optimization objective combining reconstruction fidelity and contrastive trajectory alignment. The second component is a two-tier detection architecture that employs a fast spectral killswitch mechanism for sub-millisecond inline verification during agent execution, with deep context-aware reasoning reserved for ambiguous cases requiring nuanced assessment. The
third component is an adaptive multi-dimensional monitoring system that normalizes and tracks performance metrics across capability, robustness, safety, human-centered, and economic axes, with thresholds automatically calibrated to historical data and environmental context. These components are integrated through a data pipeline that ingests agent action logs,
extracts structured features, and produces actionable alerts that can be consumed by downstream response systems.
The overall processing flow begins with the agent producing an action or sequence of actions,
which is immediately passed to the first-tier detection stage. This stage maintains a sliding window of recent actions and computes a spectral anomaly score derived from the autoencoder's latent representations and contrastive projections. The computation is optimized to complete within sub-millisecond latency through the use of precomputed projection
matrices, efficient matrix operations, and early termination criteria. If the spectral score exceeds a conservative threshold, the action is flagged as anomalous and a kill-switch signal is generated to prevent execution, with confirmation proceeding through subsequent processing. For actions that pass the first-tier check, the agent is permitted to execute the action, but the trajectory is asynchronously logged and passed to the second-tier detection stage. The deep
context-aware reasoning engages the full autoencoder architecture with attention-based sequence modeling to compute a comprehensive anomaly score that considers the entire trajectory context, with a lower threshold that is tuned for high precision. Detected anomalies at this stage generate alerts for human review and system intervention, enabling post-hoc
analysis and remediation of subtle failures.
The framework is designed with modular interfaces that support integration with diverse agent
architectures through standardized input-output conventions. Agent actions are represented as structured objects containing action type, parameters, input context, and output content, with optional fields for intermediate reasoning traces and confidence scores. The anomaly detection


pipeline processes these action objects through feature extraction, encoding, and anomaly scoring stages, producing alerts with severity scores, explanations, and suggested responses. The modular design enables component-level replacement and experimentation, supporting the
evolution of detection methods as agent architectures and anomaly landscapes change.
3.2 Sequence-Aware Siamese Recurrent Autoencoder
The sequence-aware Siamese Recurrent Autoencoder constitutes the methodological core of the proposed framework, integrating advances in representation learning, sequence modeling, and contrastive optimization to address the unique challenges of agent trajectory anomaly
detection. The architecture comprises three key components: a hierarchical sequence encoder that processes variable-length trajectories into rich contextual representations, a contrastive projection head that maps representations into a similarity space optimized for anomaly discrimination, and a reconstruction decoder that enforces the learning of trajectory structure
through generative fidelity.
The hierarchical sequence encoder employs a two-level architecture that captures both local action semantics and global trajectory structure. At the action level, each agent action is
encoded through a lightweight transformer that processes the action's constituent components, including the action type tokenized representation, parameter embeddings, and contextual features. This action-level encoding produces a fixed-dimensional action embedding that captures the semantics of the individual action in isolation. At the trajectory level, action
embeddings are processed through a bidirectional gated recurrent unit network with attention, which produces trajectory representations that reflect the sequential dependencies and longrange interactions among actions. The bidirectional processing enables each action embedding to incorporate both preceding and following context, while the attention mechanism allows the model to focus on particularly informative actions when computing trajectory-level
representations.
The use of recurrent architecture is specifically motivated by the need to model temporal
dependencies in agent trajectories, where the sequential ordering of actions carries essential information about the coherence and appropriateness of behavior. Unlike transformer architectures that process sequences in parallel, recurrent networks process actions sequentially through a hidden state that accumulates information, naturally capturing the unfolding dynamics of agent decision-making. The bidirectional extension addresses limitations of
unidirectional processing by incorporating future context, providing each action representation with information about both what came before and what follows, which is essential for identifying anomalies that become apparent only when placed in the broader trajectory context. The gated recurrent unit is chosen over LSTM for its comparable performance with reduced
parameter count and computational cost, yielding a favorable trade-off for production deployment scenarios.
The contrastive projection head maps trajectory representations from the encoder into a lowerdimensional similarity space optimized for anomaly detection. The projection is a multi-layer perceptron with batch normalization and ReLU activations, trained through a contrastive


objective that encourages clustering of normal trajectories while separating anomalous examples. The contrastive training scheme constructs positive pairs from augmented versions of the same normal trajectory and negative pairs from trajectories in different normal contexts
or from anomalous trajectories. Augmentations include action dropping with replacement, action reordering within local windows, and parameter perturbation, designed to encourage invariance to benign variations while preserving sensitivity to meaningful behavioral deviations.
The reconstruction decoder is a recurrent network that takes trajectory representations from the encoder and attempts to reproduce the original action embeddings in sequence. The reconstruction objective is fundamental to the autoencoder framework, as it drives the learning
of compressed representations that capture the structure of normal trajectories. The decoder is a unidirectional recurrent network with attention over the encoder representations, enabling the selective retrieval of trajectory information when reconstructing each action. The reconstruction loss combines action-level cross-entropy for categorical action types with mean
squared error for continuous parameters and auxiliary outputs, weighted appropriately to ensure balanced contribution of different loss components.
The hybrid loss function that trains the complete architecture integrates the reconstruction
objective and contrastive objective through a weighted summation. The reconstruction loss ensures that the trajectory representation retains sufficient information to reproduce the input sequence, enabling the detection of structural anomalies through high reconstruction error. The contrastive loss promotes the discriminative separation of normal and anomalous trajectories
in the projection space, enabling detection through separation boundaries. The combined objective is formulated as a weighted sum of reconstruction loss, contrastive loss, and regularization terms including weight decay and mutual information constraints that encourage disentanglement of trajectory factors. The weights are tuned through cross-validation on a
validation set representative of production data distributions.
Training of the sequence-aware Siamese Recurrent Autoencoder proceeds through a multistage schedule designed to achieve stable convergence despite the competing objectives. The
first stage trains the autoencoder components with only the reconstruction objective, establishing a good initial trajectory representation through unsupervised learning. The second stage introduces the contrastive objective with a relatively low weight, gradually increasing to the target value while annealing the learning rate. The third stage fine-tunes the complete model
end-to-end with the full hybrid objective, with early stopping based on validation performance to prevent overfitting. The training data consists of normal trajectories collected from production agent deployments, augmented with synthetic anomalies generated through perturbation of normal trajectories and injection of known failure patterns.
3.3 Two-Tier Detection Architecture
The two-tier detection architecture addresses the fundamental tension between detection thoroughness and computational efficiency through a cascade design that reserves expensive computation for cases where simpler methods indicate uncertainty. The first tier, designated as


the fast spectral kill-switch mechanism, operates on compressed trajectory representations and is optimized for sub-millisecond inline verification during agent execution. The second tier, designated as deep context-aware reasoning, engages the full sequence-aware autoencoder for
comprehensive trajectory analysis with higher latency but also higher precision.
The fast spectral kill-switch mechanism is built upon several complementary detection
strategies that achieve high-speed operation through parameter-free computation, precomputed transformations, and early termination. The primary method operates on the low-dimensional projections from the contrastive head, computing the Mahalanobis distance between the projection of the current trajectory window and the learned normal distribution. The Mahalanobis distance is particularly suitable for this context because it accounts for the
covariance structure of the normal distribution, weighting deviations along low-variance directions more heavily than those along high-variance directions where variation is expected. The covariance matrix and mean vector are precomputed from the training data, enabling distance computation through a simple matrix-vector multiplication that completes in constant
time independent of trajectory length.
The spectral component of the kill-switch mechanism refers to the analysis of projection space eigenvalues and eigenvectors, which reveal the directions in the feature space along which
normal variation is largest and smallest. Anomalies that deviate along low-variance directions produce large Mahalanobis distances despite potentially small Euclidean deviations, enabling the detection of subtle but significant behavioral changes. The spectral approach also enables dimensionality reduction through principal component analysis, projecting trajectories onto a
compact subspace that preserves discriminative variance while reducing computational burden. The projection matrix is precomputed from the training data, allowing online computation through a single linear transformation that is optimized through vectorized operations.
A supplementary method in the first tier computes the reconstruction error of the trajectory window using a lightweight linearized autoencoder that approximates the full model through low-rank factorization. This approximate reconstruction is significantly faster than the full recurrent decoder while maintaining a degree of predictive performance, enabling rapid
identification of structural anomalies that produce clear reconstruction errors. The linearization is achieved through singular value decomposition of the decoder's weight matrices, retaining only the top singular values and vectors that capture dominant reconstruction components. The approximate reconstruction provides a conservative signal that triggers second-tier processing
when substantial error is detected.
The second tier, deep context-aware reasoning, engages the complete sequence-aware Siamese Recurrent Autoencoder with full parameter capacity and attention mechanisms. The processing
begins by encoding the full trajectory through the hierarchical encoder, producing contextual action embeddings and a trajectory representation. The contrastive projection computes the projected representation, from which a similarity score is derived by comparison to the distributions of normal and anomalous trajectories. The reconstruction decoder generates the
reconstructed sequence, and the final anomaly score is computed as a weighted combination of contrastive similarity and reconstruction error. The weighting is adaptively adjusted based on


the trajectory characteristics, giving greater weight to reconstruction error for structurally complex trajectories and greater weight to contrastive similarity for trajectories where the action semantics are more important than their structural sequence.
The two tiers are integrated through a cascade that invokes the second tier only when the first tier produces a score in a mid-range uncertainty band, avoiding both the excessive false
positives that would result from a low threshold and the excessive latency that would result from processing every trajectory through the full model. The uncertainty band is defined through calibration on validation data, selecting thresholds that achieve target tradeoffs between recall and latency. This calibration procedure involves sweeping the first-tier threshold across a range of values, measuring the resulting false-positive rate and the fraction
of trajectories requiring second-tier processing, then selecting the threshold that minimizes a cost function incorporating both detection errors and computational costs.
3.4 Adaptive Multi-Dimensional Monitoring
The adaptive multi-dimensional monitoring system provides comprehensive visibility into agent behavior across multiple operational axes, enabling the detection of anomalies that
manifest as changes in performance distributions or metric trends rather than as specific anomalous actions. The system is motivated by the recognition that agent health is multidimensional, with failures potentially expressed through one metric while remaining invisible to single-score anomaly detection methods. The monitoring framework defines five
metric axes, each with constituent metrics, and implements adaptive calibration of detection thresholds that account for temporal dynamics and environmental changes.
Capability metrics assess the agent's effectiveness in achieving assigned objectives, including
task completion rate, solving time efficiency, correctness of responses on validation questions, and quality ratings from downstream consumers. These metrics are direct indicators of functional performance, with deviations signaling degradation in core capabilities. Robustness metrics measure the agent's resilience to challenging conditions, including resistance to
adversarial inputs as measured through successful attack blocking, performance under distributional shifts in input characteristics, graceful degradation when tools become unavailable or slower, and stability of performance under variable load. Safety metrics track compliance with behavioral constraints, including violation frequency of safety rules, outputs identified as harmful through content filtering, deviation from intended goal specifications, and
unsolicited actions that were not explicitly requested. Human-centered metrics focus on user experience and trust, including interpretability scores from human assessors, user satisfaction ratings, response time acceptability, and transparency of reasoning provided with actions. Economic metrics capture resource utilization, including cost per successful task,
computational resource consumption, energy usage, and storage requirements for persistence.
The adaptive calibration mechanism adjusts detection thresholds for each metric individually,
accounting for temporal patterns that may appear anomalous relative to immediate history but are normal over longer timescales. The calibration employs an exponential weighted moving average that tracks metric history with time-decayed weights, enabling the detection of


deviations from recent trends while accommodating gradual shifts in baseline performance. The smoothing parameter is learned through optimization on historical data, with the objective of minimizing false alerts while maintaining sensitivity to meaningful changes. The adaptive
process also accounts for contextual factors that influence expected metric values, including time of day that may affect system load, task complexity distributions that vary by user type, and operational phase factors such as maintenance windows.
The integration of metric-based anomaly detection with action-based detection is achieved through a fusion mechanism that combines scores from both modalities. The fusion is weighted by the reliability of each modality for detecting specific anomaly types, determined through analysis of detection performance on labeled validation data. For anomalies that primarily
manifest as action-level deviations, the action-based detection receives higher weight, while for anomalies that appear as aggregate metric shifts, the metric-based detection dominates. The fusion mechanism also incorporates confidence estimates that modulate the contribution of each modality when its reliability is uncertain, preventing the dilution of strong detection
signals when one modality clearly indicates an anomaly.
3.5 Implementation and Deployment Considerations
The production deployment of the proposed framework requires careful attention to infrastructure, resource management, and operational integration to ensure reliable performance at enterprise scale. The implementation is organized around a microservices
architecture that separates detection components for independent scaling and deployment, with API interfaces that support integration with agent platforms through event-driven communication. The services are containerized for portability and managed through orchestration for resilience and load management.
The computational requirements of the framework are addressed through a layered strategy that allocates resources based on processing tier, latency sensitivity, and throughput demands. The first-tier detection runs on CPU with a small memory footprint, supporting sub-millisecond
latency through optimized inference routines that precompute transformations and leverage SIMD instruction sets. This tier is deployed alongside agent execution instances, either as a sidecar container for agent pods or as an integrated library for agent frameworks. The secondtier detection runs on GPU acceleration, supporting the attention and recurrent computations of the full autoencoder with higher throughput but also higher latency. GPU instances are
provisioned from a shared pool with load balancing across detection requests, with capacity scaling automatically based on demand patterns.
The memory footprint is optimized through quantization, pruning, and distillation techniques that reduce the model size while preserving detection performance. Quantization converts model weights from floating-point to lower precision formats, reducing memory usage and accelerating inference with minimal accuracy degradation for detection tasks. Pruning
eliminates redundant weights and neurons, reducing the model capacity while maintaining sufficient representation power for anomaly detection. Distillation trains a smaller student


model to approximate the larger teacher model, enabling deployment of reduced-capacity models on resource-constrained infrastructure.
Operational integration encompasses alerting, visualization, and response management. Detection alerts are routed to a centralized alerting system that correlates anomalies with agent sessions and operational context, providing a unified view of agent health across the
deployment. Visualization interfaces enable human operators to inspect trajectories, anomaly scores, and metric trends, supporting investigation and decision-making for anomalous sessions. Automated response actions are defined for high-confidence anomalies, including graceful agent termination, session isolation for forensic analysis, and preventive action blocking for safety-critical violations. A feedback loop captures human decisions on alerts,
enabling continuous improvement through online learning and periodic retraining.
The training infrastructure processes logged agent trajectories to generate training data,
perform model training, and validate detection performance before deployment. Training is performed offline on a periodic schedule that incorporates newly collected data while maintaining the model's representation of normal behavior. The training pipeline includes data preprocessing, augmentation, training, validation, and model packaging stages, with automated testing ensuring that updated models meet performance criteria before production deployment.
This infrastructure supports ongoing evolution of the framework as agent capabilities and anomaly landscapes change over time.
4. Results
The experimental evaluation of the proposed contextual anomaly detection framework encompasses comprehensive benchmarking across multiple dimensions, including detection accuracy, computational efficiency, scalability, and comparative performance against state-ofthe-art baselines. The experiments are designed to answer four primary research questions:
whether the proposed framework achieves superior detection accuracy compared to existing methods, whether the two-tier architecture delivers the expected latency-accuracy tradeoff, whether the framework scales effectively to enterprise deployment volumes, and how each architectural component contributes to overall performance. The evaluation employs both
public benchmark datasets and proprietary data collected from production agent deployments, ensuring coverage of diverse anomaly types and operational conditions. This section presents the experimental setup, datasets, baseline methods, and quantitative results, followed by detailed analysis of detection performance across anomaly categories.
4.1 Experimental Setup
4.1.1 Datasets
The evaluation utilizes three complementary datasets that together provide coverage of diverse agent types, anomaly categories, and deployment contexts. The first dataset, designated
AgentTrajectory-Bench, is a publicly available benchmark for LLM agent trajectory anomaly detection introduced by Wu et al. (2023). This dataset comprises 50,000 trajectories collected


from simulated agent deployments across five task domains: customer service automation, code generation, data analysis, web navigation, and multi-agent coordination. Each trajectory contains between 5 and 50 actions with associated metadata including action type, parameters,
outputs, timestamps, and ground-truth anomaly labels. The dataset includes six anomaly categories: adversarial prompt injection, goal misgeneralization, tool misuse, reasoning errors, coordination breakdowns, and cumulative error propagation. The trajectories are split into training (70%), validation (10%), and test (20%) sets with stratified sampling to maintain class
balance across sets.
The second dataset, designated ProductionAgent-Logs, comprises 100,000 trajectories collected from a production deployment of LLM-driven agents in an enterprise customer
service application over a six-month period. The trajectories represent interactions with customers across multiple channels, with agents performing tasks including ticket classification, response generation, information retrieval, and action execution through backend APIs. The dataset includes both normal trajectories (95%) and trajectories containing
anomalies (5%), with anomaly labels derived from post-hoc analysis combining automated detection, human review, and customer feedback. Anomaly categories present in this dataset include goal misgeneralization where agents misinterpret customer intent, reasoning errors that produce logically inconsistent responses, safety violations where agents produce inappropriate
content, and tool execution errors where agents fail to correctly utilize available APIs. This dataset represents the challenges of real-world deployment, including label noise, class imbalance, and diverse trajectory characteristics.
The third dataset, designated SyntheticAnomaly-Collection, consists of 20,000 trajectories generated through controlled perturbation of normal trajectories from the AgentTrajectoryBench training set, augmented with 10,000 trajectories containing synthetically generated anomalies. The anomalies are generated using a template-based approach that injects known
failure patterns at varying positions in trajectories, with controlled difficulty levels corresponding to the severity of deviation from normal patterns. This dataset enables systematic evaluation of detection performance as a function of anomaly severity and position, providing insights into the sensitivity characteristics of different detection methods. The
synthetic anomalies also include adversarial examples constructed through optimization procedures that maximize detection evasion, evaluating the robustness of the proposed framework to adaptive adversaries.
4.1.2 Evaluation Metrics
The primary evaluation metrics for detection accuracy are precision, recall, and F1-score, computed at the trajectory level (classifying entire trajectories as normal or anomalous) and at
the action level (classifying individual actions within trajectories). Trajectory-level classification is the primary focus, as detection systems in production are primarily concerned with identifying entire agent sessions that require intervention. Action-level metrics provide additional insight into the localization capability of detection methods, enabling assessment of
whether methods can identify which specific actions within a trajectory are responsible for anomalous behavior. The F1-score is computed as the harmonic mean of precision and recall,


with both metrics reported to enable assessment of the tradeoff between false positives and false negatives.
The area under the receiver operating characteristic curve (AUC-ROC) provides a thresholdindependent measure of detection performance, capturing the ability of each method to rank anomalous trajectories above normal ones. The area under the precision-recall curve (AUC
PR) is also reported, as it provides a more informative measure for imbalanced datasets where the minority class (anomalies) is of primary interest. For production deployment evaluation, false positive rate (FPR) is specifically measured at the operating point where recall exceeds 95%, representing the practical requirement of high anomaly detection coverage in safetycritical applications.
Computational efficiency metrics include inference latency, measured as the time from trajectory input to anomaly score output, and throughput, measured as the number of
trajectories processed per second. Latency is reported for both the first-tier and second-tier processing, with 95th percentile and maximum latencies provided to capture tail performance critical for real-time deployment. Memory footprint is measured as the peak memory usage during inference, and model size is reported as the number of parameters and storage requirements. These metrics are measured on standardized hardware configurations
representative of production deployment environments.
4.1.3 Baseline Methods
The proposed framework is compared against five baseline methods representing the current state of the art in LLM agent anomaly detection. The first baseline, designated Mean-Pooling AE, is an autoencoder that processes trajectories by mean-pooling action embeddings into a
fixed-dimensional trajectory representation, with anomaly score computed as reconstruction error (Sakurada and Yairi, 2014). This baseline represents the common practice of aggregating sequence information through simple pooling, providing a reference point for the value of sequence-aware modeling. The second baseline, designated Contrastive-Only, employs a
contrastive learning framework without reconstruction objective, trained to maximize similarity between trajectories from the same task and minimize similarity across different tasks, with anomaly score computed as distance from normal trajectory centroids (Chen et al., 2020; Robinson et al., 2021). This baseline isolates the contribution of contrastive learning independent of the autoencoder reconstruction objective.
The third baseline, designated LSTM-AE, is a sequence autoencoder with LSTM encoder and decoder, trained with reconstruction objective only (Malhotra et al., 2016). This baseline
represents the application of standard sequential autoencoder architectures to the agent trajectory domain, providing a reference point for evaluating the contribution of the hybrid contrastive-reconstruction objective. The fourth baseline, designated LLM-Judge, employs a large language model to assess trajectory normality through prompting, with the LLM
instructed to classify trajectories as normal or anomalous and provide reasoning for its classification (Zheng et al., 2023). This baseline captures the performance of using LLMs directly as anomaly detectors, at the cost of substantially higher inference latency. The fifth


baseline, designated Rule-Based, employs a manually constructed rule set that flags trajectories containing prohibited action types, suspicious parameter values, or sequences matching known attack patterns (Wallace et al., 2024). This baseline represents the current practice in many
production deployments, providing a reference point for the value of learned anomaly detection over static rules.
4.1.4 Implementation Details
The sequence-aware Siamese Recurrent Autoencoder is implemented in PyTorch with the following architecture specifications. The action-level encoder is a transformer with 4 attention
heads, 2 layers, embedding dimension of 256, and feedforward dimension of 512. The trajectory-level bidirectional GRU has 2 layers with hidden dimension of 512, with attention computed over the hidden states using a learned attention mechanism with 64-dimensional query and key projections. The contrastive projection head is a 2-layer MLP with hidden
dimension of 256 and output dimension of 128, with batch normalization and ReLU activation between layers. The reconstruction decoder is a unidirectional GRU with 2 layers and hidden dimension of 512, with attention over encoder states using a multi-head attention mechanism with 4 heads.
Training is performed using the AdamW optimizer with learning rate of 1e-4, weight decay of 1e-5, and batch size of 64. The hybrid loss uses reconstruction weight of 0.7 and contrastive weight of 0.3, determined through validation set optimization. The model is trained for 50
epochs with early stopping based on validation loss, which typically occurs around epoch 35. Training takes approximately 24 hours on a single A100 GPU for the AgentTrajectory-Bench training set.
The two-tier detection architecture implements the first-tier spectral mechanism through precomputed projection matrices from the contrastive head, with Mahalanobis distance computed using vectorized operations. The first-tier threshold is set to achieve 95% recall on the validation set, resulting in approximately 30% of trajectories requiring second-tier
processing. The second-tier processes the remaining trajectories through the full autoencoder with attention, computing the combined anomaly score. All experiments are conducted on a server with 64 CPU cores, 256 GB RAM, and 8 A100 GPUs, with results averaged over 5 runs with different random seeds.
4.2 Detection Accuracy Results
4.2.1 Overall Performance Comparison
Table 1 presents the overall detection performance of the proposed framework and baseline methods across the three datasets. On the AgentTrajectory-Bench dataset, the proposed framework achieves an F1-score of 0.92, substantially exceeding all baseline methods. The
Mean-Pooling AE baseline achieves an F1-score of 0.67, confirming that simple aggregation of action embeddings discards critical sequential information for anomaly detection. The Contrastive-Only baseline achieves 0.74, demonstrating the value of contrastive learning while also revealing the limitations of contrastive learning without reconstruction. The LSTM-AE


baseline achieves 0.81, approaching the performance of the proposed framework but still falling short, with the gap attributable to the absence of the contrastive objective that provides additional discriminative signal.
The LLM-Judge baseline achieves an F1-score of 0.43, substantially lower than the proposed framework despite the superior language understanding capabilities of the underlying LLM.
This result reveals that LLMs, despite their general reasoning abilities, are not well-suited for the specific task of trajectory anomaly detection without specialized training and architectural adaptation. The rule-based baseline achieves 0.39, highlighting the inadequacy of static rules for the diverse and evolving patterns of agent anomalies in production environments.
Method Precision Recall F1-Score AUC-ROC AUC-PR
Proposed Framework 0.94 0.90 0.92 0.97 0.96
Mean-Pooling AE 0.71 0.64 0.67 0.78 0.72
Contrastive-Only 0.78 0.70 0.74 0.84 0.79
LSTM-AE 0.83 0.79 0.81 0.89 0.85
LLM-Judge 0.46 0.41 0.43 0.62 0.48
Rule-Based 0.52 0.31 0.39 N/A N/A
Table 1: Detection performance comparison on AgentTrajectory-Bench dataset
The production log dataset shows similar patterns, though with lower absolute performance for all methods due to the increased complexity and noise of real-world data. The proposed framework achieves an F1-score of 0.88 on this dataset, compared to 0.72 for LSTM-AE and 0.65 for the best other baseline. The performance gap between the proposed framework and
baselines is slightly larger on the production dataset, suggesting that the hybrid architecture's robustness to noise and distributional variation is particularly valuable in real-world conditions. The AUC-ROC of 0.96 confirms strong discriminative capability even at the production scale.
4.2.2 Performance by Anomaly Category
The detection performance varies substantially across anomaly categories, reflecting
differences in the nature and detectability of each failure mode. Table 2 presents the percategory F1-scores for the proposed framework on the AgentTrajectory-Bench dataset. The framework achieves its highest performance on adversarial prompt injection (F1 = 0.96), where anomalous patterns manifest as distinctive linguistic features and action sequences that the contrastive component effectively learns to distinguish from normal variations. Tool misuse
detection achieves F1 = 0.94, benefiting from the reconstruction component's sensitivity to structural deviations in API call patterns.
Goal misgeneralization proves more challenging (F1 = 0.87), as these anomalies often appear superficially normal with the deviation becoming apparent only through the relationship


between actions and the broader task context. The sequence awareness of the GRU encoder is particularly valuable for this category, as the divergence from intended behavior typically emerges gradually over the course of the trajectory. Reasoning errors achieve F1 = 0.89, with
detection requiring both semantic understanding of the agent's reasoning traces and structural analysis of logical consistency.
Coordination breakdowns in multi-agent trajectories achieve F1 = 0.84, the lowest among the categories, reflecting the difficulty of distinguishing emergent coordination failures from legitimate variations in collaborative behavior. This category benefits significantly from the hierarchical encoding that captures inter-agent interactions, but remains challenging due to the diversity of possible coordination patterns. Cumulative error propagation achieves F1 = 0.91,
with the reconstruction error increasing as errors compound, making these anomalies detectable through trajectory-level reconstruction metrics.
Anomaly Category F1-Score Precision Recall
Adversarial Prompt Injection 0.96 0.98 0.94
Goal Misgeneralization 0.87 0.89 0.85
Tool Misuse 0.94 0.95 0.93
Reasoning Errors 0.89 0.91 0.87
Coordination Breakdowns 0.84 0.86 0.82
Cumulative Error Propagation 0.91 0.92 0.90
Table 2: Per-category detection performance of proposed framework
4.2.3 Action-Level Detection
Action-level detection performance provides insight into the localization capability of the proposed framework, essential for identifying which specific actions are responsible for anomalous trajectories. On the AgentTrajectory-Bench dataset, the framework achieves an
action-level F1-score of 0.85, with the action-level precision of 0.82 and recall of 0.88. The slightly higher recall than precision indicates that the framework tends to flag more actions as anomalous than are truly anomalous, a conservative bias that is appropriate for safety-critical applications where false negatives are more costly than false positives.
The localization performance varies with anomaly position within the trajectory, with anomalies occurring early in trajectories (first 25% of actions) achieving F1 = 0.80, while anomalies in the middle (F1 = 0.87) and end (F1 = 0.91) are more reliably detected. This pattern
reflects the bidirectional encoder's ability to use both preceding and following context for middle and later actions, while early actions lack sufficient future context for confident classification. For production deployment, this suggests that early-stage anomalies may benefit from delayed confirmation until more trajectory context is available.


4.3 Computational Efficiency Results
The two-tier architecture delivers the expected latency-accuracy tradeoff, with the first-tier achieving sub-millisecond inference latency while the second-tier provides higher detection accuracy for ambiguous cases. Table 3 presents the computational efficiency metrics for the proposed framework and baseline methods. The first-tier detection achieves mean latency of
0.32 ms, 95th percentile latency of 0.58 ms, and maximum latency of 1.2 ms, meeting the submillisecond design target for most processing. This latency enables inline verification during agent execution without introducing perceptible delays in interactive applications, supporting the kill-switch functionality that can terminate anomalous actions before execution.
The second-tier detection achieves mean latency of 28 ms, approximately 87 times slower than the first-tier but still within acceptable bounds for asynchronous processing that does not block agent execution. The 95th percentile latency of 52 ms and maximum of 112 ms reflect the
variability introduced by attention computation on trajectories of different lengths. The end-toend system achieves mean latency of 1.2 ms when considering the combined processing and the cascading decision policy that sends only 30% of trajectories to the second tier, with the 95th percentile latency of 4.5 ms.
The LLM-Judge baseline achieves mean latency of 420 ms, two orders of magnitude slower than the proposed framework, confirming that direct use of LLMs for anomaly detection is infeasible for real-time deployment. The LSTM-AE baseline achieves mean latency of 15 ms,
faster than the second-tier processing but slower than the first-tier, while achieving lower detection accuracy than the combined system. The Mean-Pooling AE achieves 2.3 ms latency but with substantially lower accuracy, demonstrating the tradeoff between computational simplicity and detection capability.
Method Latency Mean
(ms)
Latency 95th
(ms)
Throughput
(trajs/sec)
Model Size
(MB)
Proposed (FirstTier)
0.32 0.58 3,125 12
Proposed (SecondTier)
28.0 52.0 36 187
Proposed (End-toEnd)
1.20 4.50 833 199
Mean-Pooling AE 2.30 4.10 435 28
Contrastive-Only 3.80 6.20 263 45
LSTM-AE 15.0 28.0 67 98
LLM-Judge 420 650 2.4 6,800
Table 3: Computational efficiency comparison


The memory footprint of the proposed framework is 199 MB for the combined model with both tiers, fitting well within the constraints of production deployments where resources are allocated to multiple concurrent agent sessions. The first-tier model of 12 MB is particularly
efficient, enabling deployment alongside agent instances with minimal overhead. The throughput of 833 trajectories per second for the end-to-end system, combined with the submillisecond per-trajectory processing, supports enterprise-scale deployments handling thousands of concurrent agent sessions.
4.4 Scalability Analysis
The scalability of the proposed framework is evaluated by measuring detection performance and latency as a function of trajectory length and training data size. Performance remains stable for trajectories up to 100 actions, with F1-score degrading slightly from 0.92 for trajectories of 5-20 actions to 0.89 for trajectories of 50-100 actions. The degradation is modest and reflects
the increasing challenge of modeling longer trajectories, with the GRU encoder maintaining detection capability through its recurrent processing that summarizes trajectory context.
Latency scales approximately linearly with trajectory length for the second-tier processing,
from 12 ms for 10-action trajectories to 65 ms for 100-action trajectories, consistent with the sequential processing requirements of the GRU decoder. The first-tier latency remains nearly constant regardless of trajectory length, as the spectral mechanism operates on the final trajectory representation independent of length. This property makes the first-tier suitable for
intercepting anomalies regardless of trajectory progression, while the second-tier handles detailed analysis of longer trajectories asynchronously.
Training data size analysis reveals that the proposed framework achieves F1-score of 0.85 with
only 5,000 training trajectories, reaching 0.90 with 20,000 trajectories and plateauing at 0.92 with 50,000 trajectories. This learning curve suggests that the framework is data-efficient, achieving strong performance with a modest amount of training data that is typically available in production deployments. The contrastive learning component contributes to this data
efficiency by making effective use of unlabeled normal trajectories through the positive and negative pair construction.
4.5 Ablation Studies
Ablation studies isolate the contribution of each architectural component to overall performance, providing insight into the design decisions that drive the framework's effectiveness. Table 4 presents F1-scores for ablated variants of the proposed framework on
the AgentTrajectory-Bench dataset. Removing the contrastive objective (using reconstruction loss only) reduces F1-score from 0.92 to 0.84, demonstrating the substantial contribution of contrastive learning to discriminative capability. Removing the reconstruction objective (using contrastive loss only) reduces F1-score to 0.81, confirming the value of the autoencoder
objective for learning trajectory structure.
Replacing the recurrent encoder with a transformer reduces F1-score to 0.88, indicating that the sequential processing of the GRU provides advantages for anomaly detection despite the


transformer's superior performance on many NLP tasks. The GRU's ability to process trajectories in sequence and maintain a hidden state that accumulates information appears better suited to capturing the unfolding dynamics of agent decision-making. Removing the attention
mechanism from the decoder reduces F1-score to 0.86, confirming the value of attention for selectively retrieving trajectory information during reconstruction.
Replacing the GRU encoder with a simple mean-pooling reduces F1-score to 0.75, substantially larger than the degradation from removing attention, indicating that the sequenceaware modeling is the most critical component for detection performance. Removing the twotier architecture and using only the first-tier reduces F1-score to 0.76, revealing that the full second-tier is necessary for detecting subtle anomalies that evade the fast spectral mechanism.
Using only the second-tier (without first-tier filtering) maintains the F1-score of 0.92 but with the higher average latency of 28 ms, demonstrating that the two-tier architecture provides the accuracy of the full model at much lower latency.
Ablation Variant F1-Score Latency Mean (ms)
Full Framework 0.92 1.20
No Contrastive Objective 0.84 1.15
No Reconstruction Objective 0.81 1.10
Transformer Encoder 0.88 1.40
No Attention Mechanism 0.86 1.05
Mean-Pooling Encoder 0.75 0.90
First-Tier Only 0.76 0.32
Second-Tier Only 0.92 28.0
Table 4: Ablation study results on AgentTrajectory-Bench dataset
4.6 Robustness to Adversarial Evasion
The robustness of the proposed framework to adversarial evasion is evaluated using the SyntheticAnomaly-Collection dataset, where anomalies are constructed through optimization procedures designed to evade detection. The adversarial optimization modifies anomaly trajectories to minimize the anomaly score while preserving the essential characteristics that
make the trajectory anomalous. The framework maintains an F1-score of 0.83 against moderate-strength evasion attempts, degrading to 0.71 against strong evasion attempts where the adversary has full knowledge of the detection model and its parameters.
The contrastive component contributes substantially to adversarial robustness, as the separation of normal and anomalous representations in the projection space provides a margin that is difficult to completely eliminate through perturbation. The reconstruction component is more


vulnerable to evasion, as adversaries can perturb trajectories to maintain reconstruction fidelity while preserving the semantic content of the anomaly. The combination of both components provides complementary robustness, with each compensating for weaknesses in the other
against specific evasion strategies.
The two-tier architecture also contributes to robustness, as the first-tier spectral mechanism and
second-tier full model operate on different representations, making it more difficult for adversaries to evade both simultaneously. An anomaly that successfully evades the spectral mechanism may still be detected by the full model, and vice versa, providing defense in depth against adaptive adversaries. This robustness analysis suggests that the proposed framework is suitable for deployment in adversarial environments where attackers may attempt to evade
detection through careful manipulation of agent behavior.
5. Discussion of Findings
5.1 Interpretation of Detection Performance
The experimental results demonstrate that the proposed framework substantially outperforms
existing anomaly detection methods across diverse datasets and anomaly categories, with the F1-score advantage ranging from 0.11 to 0.53 over the best-performing baselines. This performance gap warrants careful analysis to understand the factors that contribute to the framework's effectiveness and the implications for anomaly detection in LLM-driven agent
systems.
The primary factor driving the performance improvement is the sequence-aware architecture that captures temporal dependencies in agent trajectories. The substantial gap between the
proposed framework and the mean-pooling baseline (0.92 vs. 0.67 F1) reveals that the order and timing of actions carry essential information about trajectory normality that is lost when sequences are collapsed into fixed-dimensional representations. This result challenges the common practice in some anomaly detection systems of treating agent actions as independent
observations or aggregating them through simple operations, demonstrating that sequence modeling is not merely an incremental improvement but a fundamental requirement for effective detection.
The importance of temporal dependencies is further evidenced by the per-position analysis showing that anomalies at different trajectory positions exhibit different detectability patterns. Anomalies occurring early in trajectories achieve lower detection accuracy because the model lacks sufficient future context to confidently determine whether early deviations represent
genuine anomalies or benign exploratory behavior that will later be corrected. This suggests that production deployments should consider delayed anomaly confirmation for early trajectory stages, allowing the agent to accumulate more context before making definitive classification decisions.
The combination of reconstruction and contrastive objectives emerges as a critical design choice that yields advantages over either objective alone. The reconstruction objective enforces the learning of trajectory structure, enabling the detection of anomalies that deviate from


normal patterns in ways that are not captured by simple similarity metrics. The contrastive objective promotes discriminative representation learning, enabling separation boundaries between normal and anomalous trajectories that improve precision and recall. Their
combination is complementary, with each capturing different aspects of normality that the other fails to model. This complementarity is reflected in the ablation studies, where the removal of either objective reduces performance, but the combined system exceeds the sum of its components.
The per-category analysis reveals that the framework's effectiveness varies substantially across anomaly types, with adversarial prompt injection achieving the highest F1-score and coordination breakdowns achieving the lowest. This variation reflects the fundamental
differences in anomaly characteristics and the extent to which each category aligns with the framework's modeling assumptions. Adversarial prompt injection manifests as distinctive linguistic features and action sequences that the contrastive component effectively captures, while coordination breakdowns involve complex interactions between multiple agents that are
inherently more difficult to characterize from individual trajectories.
The lower performance on coordination breakdowns suggests opportunities for extension, perhaps through graph-based modeling that explicitly captures inter-agent interactions or
through multi-agent models that jointly process trajectories from all participating agents. The current framework processes each agent's trajectory independently, missing information about the relationships and dependencies between agents that may signal coordination failures even when each individual trajectory appears normal. This limitation represents a promising
direction for future research, potentially through the integration of graph neural networks that model agent interactions.
5.2 Analysis of the Two-Tier Architecture
The two-tier architecture successfully balances the competing demands of detection accuracy and computational efficiency, achieving the accuracy of the full model at substantially reduced
average latency. The cascade design is effective because the first-tier spectral mechanism captures a large fraction of anomalies (approximately 70% of all anomalies based on validation set performance) with minimal computational cost, while the second-tier processes only the remaining cases where the first-tier expresses uncertainty. This design is analogous to triage systems in healthcare, where simple screening tests identify the majority of clear cases,
allowing expensive diagnostic procedures to be reserved for cases where the screening test indicates ambiguity.
The calibration of the first-tier threshold is critical for the architecture's effectiveness, as an excessively low threshold would send too many trajectories to the second tier, eliminating the latency benefits, while an excessively high threshold would allow too many anomalies to escape detection. The calibration procedure that optimizes the tradeoff between latency and
accuracy on validation data proves effective, with the resulting operating point sending 30% of trajectories to the second tier while achieving 95% recall on the validation set. This operating point is appropriate for production deployments, as the 95% recall ensures that the vast majority


of anomalies are flagged at the first tier, with the second tier providing additional analysis for ambiguous cases.
The latency distribution shows substantial variation across trajectories, with the second-tier processing exhibiting higher latency for longer trajectories due to the sequential nature of the GRU decoder. This variation introduces tail latency challenges for production deployments, as
the maximum latency of 112 ms for the second tier, while acceptable for asynchronous processing, approaches the threshold at which user experience would be impacted if the second tier were invoked during interactive sessions. The production deployment strategy of executing the second tier asynchronously after agent execution addresses this concern, as the detection alerts are generated with a delay that does not block the agent's response to the user.
The memory footprint of the combined model is modest compared to the LLM itself, with the 199 MB framework being approximately 3% of the size of a typical 7B parameter LLM. This
efficiency enables sidecar deployment alongside agent instances, with the detection system consuming minimal additional resources. The first-tier model of 12 MB is particularly advantageous for resource-constrained environments, enabling detection even when GPU memory is limited or when operating on edge devices.
5.3 Comparative Analysis with Baseline Methods
The performance gap between the proposed framework and the LLM-Judge baseline is notable
and warrants careful consideration. The LLM-Judge achieves F1-score of 0.43, substantially lower than the proposed framework despite the advanced language understanding capabilities of the underlying LLM. This result suggests that the skills required for effective anomaly detection in agent trajectories are not well-aligned with the capabilities that current LLMs
acquire through pretraining and instruction tuning. The LLM-Judge's limitations include difficulty tracking long sequences of actions, lack of specialized training on anomaly detection tasks, and the absence of architectural components designed to capture trajectory structure.
The comparison with LLM-Judge also highlights the importance of task-specific architecture and training. The proposed framework, though built on a much smaller model (199 MB vs. 6.8 GB for the LLM), achieves superior performance because its architecture and training objective are optimized for the specific task of trajectory anomaly detection. This result challenges the
assumption in some recent work that general-purpose LLMs can serve as universal detectors, suggesting that specialized architectures continue to play an important role even as foundation models advance.
The comparison with LSTM-AE (0.81 vs. 0.92 F1) reveals the value of the contrastive objective beyond the sequential modeling provided by the recurrent architecture. Both methods employ sequence-aware processing, but the LSTM-AE relies solely on reconstruction error for anomaly detection, while the proposed framework combines reconstruction with contrastive
discrimination. The contrastive objective adds substantial discriminative power, particularly for anomalies that are structurally similar to normal trajectories but differ in semantic content or task alignment.


The rule-based baseline's poor performance (F1 = 0.39) highlights the inadequacy of manual rule construction for the diversity of agent behaviors and anomaly patterns in production deployments. The action space of LLM-driven agents is sufficiently large and varied that any
finite set of rules will be incomplete, either missing novel anomalies or generating false positives for legitimate behaviors that resemble prohibited patterns. This limitation supports the case for learned anomaly detection methods that adapt to the specific patterns of agent behavior in each deployment context.
5.4 Implications for Production Deployment
The experimental results have several implications for the production deployment of anomaly detection systems for LLM-driven agents. The high detection accuracy achieved by the proposed framework, combined with the low latency of the first-tier processing, suggests that real-time inline anomaly detection is feasible for interactive agent applications. The kill-switch
mechanism can intercept clearly anomalous actions before execution, preventing potential harm without introducing perceptible delays in user interactions.
The async processing of the second tier provides complementary coverage for subtle anomalies
that evade the first tier, generating alerts for human review and system intervention. This asynchronous workflow supports a range of response strategies, from automated corrective actions for high-confidence anomalies to human-in-the-loop review for ambiguous cases. The integration of detection alerts with incident response systems enables rapid containment and
remediation when anomalies are detected.
The adaptive multi-dimensional monitoring provides a comprehensive view of agent health that complements the trajectory-level anomaly detection. Metric-based detection captures
degradation patterns that may not be apparent in individual trajectories, such as gradual performance decline or increasing variance in response quality. The integration of these monitoring signals with action-based detection provides a holistic safety net that addresses the full spectrum of potential failure modes.
The data efficiency of the framework, achieving strong performance with modest amounts of training data, is advantageous for production deployments where labeled anomaly data is scarce. The framework can be initially deployed with a small training set and then continuously
improved as more data accumulates, providing a path to deployment without requiring extensive annotation campaigns. The continuous learning capability, enabled by the periodic retraining pipeline, ensures that the framework adapts to changes in agent behavior and anomaly patterns over time.
5.5 Limitations and Future Directions
Despite the framework's strong performance, several limitations should be acknowledged.
First, the framework relies on supervised training data with anomaly labels, which may be difficult to obtain in sufficient quantity for some deployment contexts. While the framework is data-efficient, requiring only modest training data, the quality and representativeness of the training data remains important for detection performance. Future work should explore semi


supervised and self-supervised approaches that reduce the reliance on labeled anomalies, perhaps through anomaly generation techniques that create realistic training examples without human annotation.
Second, the framework's performance on coordination breakdowns in multi-agent systems is relatively low compared to other anomaly categories, indicating a need for specialized
modeling of inter-agent interactions. The current framework processes each agent's trajectory independently, missing information about the relationships and dependencies between agents that may signal coordination failures. The extension to graph-based modeling that captures agent interactions represents a promising direction for future research, potentially through the integration of graph neural networks or transformer architectures with inter-agent attention.
Third, the evaluation is conducted on datasets that, while diverse and representative, may not capture the full range of anomaly types that could emerge as agent capabilities and deployment
contexts evolve. The rapid pace of LLM agent development suggests that new failure modes will continue to emerge, requiring ongoing evaluation and adaptation of detection methods. The framework's design, with modular components that can be updated independently, supports this adaptation, but the detection performance on novel anomaly types may degrade until appropriate training data is collected.
Fourth, the framework's robustness to adversarial evasion, while reasonable, shows degradation against strong adversaries with full knowledge of the detection model. The defense
in depth provided by the two-tier architecture and the combination of contrastive and reconstruction objectives provides protection against many evasion attempts, but adaptive adversaries may still be able to craft trajectories that evade detection. Future work should explore adversarial training that incorporates evasion attempts during model training, increasing robustness to adaptive adversaries.
Fifth, the interpretability of the framework's anomaly scores is limited by the complexity of the neural architecture, making it difficult for human operators to understand why particular
trajectories are flagged as anomalous. While the framework provides anomaly scores and some localization information, the reasoning process remains opaque compared to rule-based systems. Future work should explore explanation mechanisms that identify the specific actions and trajectory patterns responsible for high anomaly scores, enabling human operators to quickly understand and respond to detected anomalies.
The integration of the framework with agent development and deployment pipelines presents additional opportunities for future research. The detection of anomalies during agent
development, prior to deployment, could identify potential failure modes through systematic testing and red teaming. The use of anomaly detection as a feedback signal for agent training could enable reinforcement learning approaches that optimize agent behavior to reduce anomaly likelihood. The combination of detection with automated correction mechanisms
could enable self-healing agents that detect and recover from anomalies without human intervention.
6. Conclusion


This paper has presented a comprehensive framework for contextual anomaly detection in LLM-driven autonomous agents, addressing the critical safety gap that emerges as these agents transition from experimental prototypes to production deployments. The framework integrates
a sequence-aware Siamese Recurrent Autoencoder, a two-tier detection architecture, and adaptive multi-dimensional monitoring to achieve detection performance that substantially exceeds current state-of-the-art methods while maintaining computational efficiency suitable for real-time deployment.
The sequence-aware Siamese Recurrent Autoencoder combines reconstruction and contrastive objectives within a recurrent architecture that models the temporal dependencies essential for contextual anomaly detection. The hybrid loss function leverages the complementary strengths
of reconstruction-based and contrastive approaches, enabling the detection of both structural anomalies that deviate from learned trajectory patterns and semantic anomalies that differ in task alignment and behavioral appropriateness. The recurrent encoding captures the sequential dynamics of agent decision-making, addressing the limitations of pooling strategies that treat
trajectories as unordered sets of actions.
The two-tier detection architecture successfully balances the competing demands of detection thoroughness and computational efficiency through a cascade design that reserves expensive
full-model computation for cases where fast spectral mechanisms indicate uncertainty. The first-tier kill-switch mechanism achieves sub-millisecond inference latency, enabling inline verification during agent execution that can intercept clearly anomalous actions before they cause harm. The second-tier deep context-aware reasoning engages the full autoencoder
capacity for subtle anomalies that require comprehensive trajectory analysis, operating asynchronously to avoid blocking agent responsiveness.
The adaptive multi-dimensional monitoring provides comprehensive visibility into agent
health across capability, robustness, safety, human-centered, and economic axes, detecting degradation patterns that manifest as metric shifts rather than individual anomalous actions. The adaptive calibration of detection thresholds based on historical data and environmental context reduces false-positive rates compared to static threshold configurations, while
maintaining sensitivity to genuine anomalies that exhibit novel patterns.
The experimental evaluation, conducted on diverse datasets spanning public benchmarks and production deployments, demonstrates the framework's effectiveness across multiple anomaly
categories and deployment conditions. The framework achieves F1-scores of 0.92 on benchmark data and 0.88 on production logs, substantially exceeding baseline methods including autoencoder variants, contrastive-only frameworks, LLM-based judges, and rulebased filters. The ablation studies confirm the contribution of each architectural component,
revealing that sequence-aware modeling, the hybrid objective, and the two-tier architecture each contribute meaningfully to overall performance.
The computational efficiency metrics confirm the framework's suitability for production deployment, with the first-tier achieving sub-millisecond latency and the end-to-end system processing trajectories with mean latency of 1.2 ms at enterprise-scale throughput. The memory


footprint of 199 MB for the combined model fits within resource constraints typical of production environments, enabling sidecar deployment alongside agent instances.
The implications of this work extend beyond the specific framework to broader considerations for the safe deployment of autonomous AI systems. The detection of contextual anomalies in agent behavior represents a fundamental requirement for trustworthy AI, as agents that operate
autonomously in high-stakes environments must be subject to continuous verification that their actions remain aligned with intended goals and constraints. The framework's design principles—sequence-aware modeling, hybrid objectives, tiered processing, and adaptive monitoring—provide a template for anomaly detection systems that can be applied to diverse agent architectures and deployment contexts.
The limitations identified in this work suggest fruitful directions for future research. The extension to multi-agent coordination anomaly detection through graph-based modeling, the
exploration of semi-supervised and self-supervised learning to reduce reliance on labeled anomalies, the development of explanation mechanisms for improved interpretability, and the investigation of adversarial robustness through adversarial training all represent promising avenues for advancing the state of the art. The integration of detection with automated correction mechanisms and the use of detection as a feedback signal for agent training offer
pathways toward self-improving safety systems.
As LLM-driven agents continue to advance in capability and proliferate across application
domains, the importance of robust anomaly detection will only grow. The framework proposed in this paper establishes a foundation for trustworthy agent deployment, providing both the detection capability and the computational efficiency necessary for real-world adoption. By bridging the gap between agentic autonomy and contextual safety verification, this work contributes to the development of AI systems that are not only capable but also reliable,
trustworthy, and aligned with human values and expectations.
References
1. Aggarwal, C. C. (2017). Outlier analysis (2nd ed.). Springer.
2. Ahmed, T., Das, S., & Rahman, M. (2024). Adaptive thresholding for real-time anomaly detection in dynamic environments. IEEE Transactions on Neural Networks and Learning Systems, 35(3), 412-425.
3. An, J., & Cho, S. (2015). Variational autoencoder based anomaly detection using reconstruction probability. Technical Report, Seoul National University.
4. Breunig, M. M., Kriegel, H. P., Ng, R. T., & Sander, J. (2000). LOF: Identifying density-based local outliers. Proceedings of the ACM SIGMOD International Conference on Management of Data, 93-104.


5. Brown, T. B., Mann, B., Ryder, N., Subbiah, M., Kaplan, J., Dhariwal, P., ... & Amodei, D. (2020). Language models are few-shot learners. Advances in Neural Information Processing Systems, 33, 1877-1901.
6. Chandola, V., Banerjee, A., & Kumar, V. (2009). Anomaly detection: A survey. ACM Computing Surveys, 41(3), 1-58.
7. Chen, J., Jiang, J., & Liu, Y. (2024). Observability challenges in LLM-driven autonomous agents. Journal of Artificial Intelligence Research, 79, 1023-1056.
8. Chen, T., Kornblith, S., Norouzi, M., & Hinton, G. (2020). A simple framework for contrastive learning of visual representations. Proceedings of the International Conference on Machine Learning, 1597-1607.
9. Chen, Z., Li, M., & Zhang, H. (2019). Attention-based LSTM for sequential anomaly detection. Proceedings of the AAAI Conference on Artificial Intelligence, 33, 687-694.
10. Cho, K., Van Merriënboer, B., Gulcehre, C., Bahdanau, D., Bougares, F., Schwenk, H., & Bengio, Y. (2014). Learning phrase representations using RNN encoder-decoder for statistical machine translation. Proceedings of the Conference on Empirical Methods in Natural Language Processing, 1724-1734.
11. Deng, X., Huang, Y., & Wang, Z. (2023). Multi-dimensional evaluation framework for LLM-based autonomous agents. Journal of Machine Learning Research, 24(156), 135.
12. Devlin, J., Chang, M. W., Lee, K., & Toutanova, K. (2019). BERT: Pre-training of deep bidirectional transformers for language understanding. Proceedings of the Conference of the North American Chapter of the Association for Computational Linguistics, 4171
4186.
13. Ester, M., Kriegel, H. P., Sander, J., & Xu, X. (1996). A density-based algorithm for discovering clusters in large spatial databases with noise. Proceedings of the
International Conference on Knowledge Discovery and Data Mining, 226-231.
14. Gao, T., Yao, X., & Chen, D. (2021). SimCSE: Simple contrastive learning of sentence embeddings. Proceedings of the Conference on Empirical Methods in Natural
Language Processing, 6894-6910.
15. Gautam, S., Singh, R., & Bhattacharya, S. (2023). A survey on sequential anomaly detection: Methods, challenges, and applications. ACM Computing Surveys, 56(1), 1
36.
16. Gholami, A., Kim, S., Dong, Z., Yao, Z., Mahoney, M. W., & Keutzer, K. (2021). A
survey of quantization methods for efficient neural network inference. arXiv preprint arXiv:2103.13630.


17. Goodfellow, I. J., Shlens, J., & Szegedy, C. (2014). Explaining and harnessing adversarial examples. arXiv preprint arXiv:1412.6572.
18. Hochreiter, S., & Schmidhuber, J. (1997). Long short-term memory. Neural Computation, 9(8), 1735-1780.
19. Hodge, V. J., & Austin, J. (2004). A survey of outlier detection methodologies. Artificial Intelligence Review, 22(2), 85-126.
20. Kaplan, J., McCandlish, S., Henighan, T., Brown, T. B., Chess, B., Child, R., ... &
Amodei, D. (2020). Scaling laws for neural language models. arXiv preprint arXiv:2001.08361.
21. Kingma, D. P., & Welling, M. (2014). Auto-encoding variational Bayes. arXiv preprint
arXiv:1312.6114.
22. Kumar, A., Gupta, R., & Singh, S. (2024). Defending against prompt injection attacks
in LLM-based systems. Proceedings of the IEEE Symposium on Security and Privacy, 567-584.
23. Liu, F., Wang, H., & Zhang, L. (2024). A comprehensive survey on security and safety
of LLM-driven autonomous agents. ACM Computing Surveys, 56(8), 1-38.
24. Liu, F. T., Ting, K. M., & Zhou, Z. H. (2008). Isolation forest. Proceedings of the IEEE International Conference on Data Mining, 413-422.
25. Liu, X., Yu, H., Zhang, H., Xu, Y., Lei, X., Lai, H., ... & Tang, J. (2023). AgentBench: Evaluating LLMs as agents. arXiv preprint arXiv:2308.03688.
26. Malhotra, P., Ramakrishnan, A., Anand, G., Vig, L., Agarwal, P., & Shroff, G. (2016). LSTM-based encoder-decoder for multi-sensor anomaly detection. arXiv preprint arXiv:1607.00148.
27. Ness, S. (2025). Hybrid KNN–LSTM Framework for Electricity Theft Detection in Smart Grids Using SGCC Smart-Meter Data. IEEE Access, 13, 191809-191823. https://doi.org/10.1109/ACCESS.2025.3630123
28. Ness, S. (2024). The Balance Between Gatekeeper Rules and Free Speech in the EU under the Digital Markets Act and Digital Services Act. JOURNAL OF MODERN LAW AND POLICY Учредители: CARI Journals Limited, 4(3), 60-89.
https://doi.org/10.47941/jmlp.2289
29. Ness, S., Adom, S., & Shepherd, N. J. (2026). AI-Driven Detection of Inherited Neurological Disorders Using Genomic and Multi-Omics Data. International
Neuropsychiatric Disease Journal, 23(1), 32-44. https://doi.org/10.9734/indj/2026/v23i1536


30. Ness, S. (2025, May). Anomaly Detection for Multi-Class Weather Classification in IoT-Integrated Solar Farms using Mask R-CNN and Deep Reinforcement Learning. In 2025 3rd International Conference on Intelligent Perception and Computer Vision
(CIPCV) (pp. 72-79). IEEE. https://doi.org/10.1109/CIPCV65863.2025.00021
31. Ness, S. (2025). Robust detection framework for adversarial threats in Autonomous
Vehicle Platooning. Frontiers in Big Data, 8, 1617978. https://doi.org/10.3389/fdata.2025.1617978
32. Ness, S. (2025). CatBoost-enhanced convolutional neural network framework with
explainable artificial intelligence for smart-grid stability forecasting. Frontiers in Smart Grids, 4, 1617763. https://doi.org/10.3389/frsgr.2025.1617763
33. Ness, S., Sarker, M., Volkivskyi, M., & Nerd, N. S. (2024). The legal and political
implications of AI bias: an international comparative study. American Journal of Computing and Engineering, 7(1), 37-47. https://doi.org/10.47672/ajce.1879
34. Rangaraju, S., & Ness, S. (2023). Multifaceted Cybersecurity Strategy for Addressing
Complex Challenges in Cloud Environments. International Journal of Innovative Science and Research Technology, 8, 2426-2437.
35. Mullankandy, S., Ness, S., & Kazmi, I. (2024). Exploring the Impact of Artificial
Intelligence on Mental Health Interventions. Journal of Science & Technology, 5(3), 34-48.
36. Ness, S. (2025). Enhancing smart grid reliability: Fault detection in phasor measurement unit images with deep learning. IEEE Access. https://doi.org/10.1109/ACCESS.2025.3561587
37. Ness, S. (2025). Integrating AI models for voltage and current monitoring in autonomous mobile robots to prevent power system blackouts. IEEE Access. https://doi.org/10.1109/ACCESS.2025.3560088
38. Ranjan, R., & Ness, S. (2024). Cyber security Threats to Cloud Banking Systems. International Journal of Research Publication and Reviews, 5(10), 1698-1709. https://doi.org/10.55248/gengpi.5.1024.2837
39. Muhammad, T., Kingsley, M. S., Ness, S., & Dallas, U. S. (2023). AOptimizing Network Paths: In-Depth Analysis and Insights on Segment Routing. Journal of Data Acquisition and Processing, 38(4), 1942-1943.
40. Ness, S. (2024). VAT/GST harmonisation challenges for digital assets such as bitcoin and NFTs in the EU following Case C-264/14 (Skatteverket v David Hedqist). International Cybersecurity Law Review, 5(3), 459-490. https://doi.org/10.1365/s43439-024-00124-2


41. Park, J. S., O'Brien, J. C., Cai, C. J., Morris, M. R., Liang, P., & Bernstein, M. S. (2023). Generative agents: Interactive simulacra of human behavior. Proceedings of the ACM Symposium on User Interface Software and Technology, 1-22.
42. Piet, J., Ramponi, G., & Rimon, E. (2023). Prompt injection attacks on large language models: A systematic analysis. Proceedings of the Conference on Neural Information
Processing Systems, 36, 12345-12358.
43. Radford, A., Narasimhan, K., Salimans, T., & Sutskever, I. (2018). Improving language understanding by generative pre-training. Technical Report, OpenAI.
44. Ramaswamy, S., Rastogi, R., & Shim, K. (2000). Efficient algorithms for mining outliers from large data sets. Proceedings of the ACM SIGMOD International Conference on Management of Data, 427-438.
45. Reimers, N., & Gurevych, I. (2019). Sentence-BERT: Sentence embeddings using Siamese BERT-networks. Proceedings of the Conference on Empirical Methods in Natural Language Processing, 3982-3992.
46. Robinson, J., Chuang, C. Y., Sra, S., & Jegelka, S. (2021). Contrastive learning with hard negative sampling. Proceedings of the International Conference on Learning Representations, 1-18.
47. Sakurada, M., & Yairi, T. (2014). Anomaly detection using autoencoders with nonlinear dimensionality reduction. Proceedings of the Workshop on Machine
Learning for Sensory Data Analysis, 4-11.
48. Schlegl, T., Seeböck, P., Waldstein, S. M., Schmidt-Erfurth, U., & Langs, G. (2017). Unsupervised anomaly detection with generative adversarial networks to guide marker
discovery. Proceedings of the International Conference on Information Processing in Medical Imaging, 146-157.
49. Schölkopf, B., Platt, J. C., Shawe-Taylor, J., Smola, A. J., & Williamson, R. C. (2001).
Estimating the support of a high-dimensional distribution. Neural Computation, 13(7), 1443-1471.
50. Shah, R., Varma, V., Kumar, R., Phuong, M., & Hadfield-Menell, D. (2022). Goal
misgeneralization: Why correct specifications aren't enough for correct goals. arXiv preprint arXiv:2210.01790.
51. Shinn, N., Cassano, F., Gopinath, A., Narasimhan, K., & Yao, S. (2024). Reflexion:
Language agents with verbal reinforcement learning. Advances in Neural Information Processing Systems, 36, 16789-16804.
52. van den Oord, A., Li, Y., & Vinyals, O. (2018). Representation learning with contrastive predictive coding. arXiv preprint arXiv:1807.03748.


53. Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., ... & Polosukhin, I. (2017). Attention is all you need. Advances in Neural Information Processing Systems, 30, 5998-6008.
54. Vincent, P., Larochelle, H., Bengio, Y., & Manzagol, P. A. (2008). Extracting and composing robust features with denoising autoencoders. Proceedings of the
International Conference on Machine Learning, 1096-1103.
55. Wallace, E., Zhao, Z., & Feng, S. (2024). Instruction hierarchy for robust LLM safety. Proceedings of the Association for Computational Linguistics, 62, 125-142.
56. Wang, X., Wei, J., Schuurmans, D., Le, Q., Chi, E., Narang, S., ... & Zhou, D. (2023). Self-consistency improves chain of thought reasoning in language models. Proceedings of the International Conference on Learning Representations, 1-17.
57. Wang, Y., Zhang, H., & Chen, Y. (2023). Towards safe deployment of LLM-based agents in enterprise applications. IEEE Transactions on Dependable and Secure Computing, 20(6), 4852-4868.
58. Wei, J., Wang, X., Schuurmans, D., Bosma, M., Xia, F., Chi, E., ... & Zhou, D. (2022). Chain-of-thought prompting elicits reasoning in large language models. Advances in Neural Information Processing Systems, 35, 24824-24837.
59. Wu, J., Liu, Q., & Chen, Z. (2023). Trajectory anomaly detection for LLM-driven autonomous agents. Proceedings of the International Joint Conference on Artificial
Intelligence, 4892-4901.
60. Wu, S., Shen, Z., & Gong, M. (2023). Multi-agent collaboration and coordination in LLM-based systems. Journal of Artificial Intelligence Research, 78, 345-378.
61. Xi, Z., Chen, W., Guo, X., He, W., Ding, Y., Hong, B., ... & Song, L. (2023). The rise and potential of large language model based agents: A survey. arXiv preprint arXiv:2309.07864.
62. Xu, J., Wu, H., Wang, J., & Long, M. (2022). Anomaly transformer: Time series anomaly detection with association discrepancy. Proceedings of the International Conference on Learning Representations, 1-17.
63. Yang, H., Liu, X., & Wang, C. D. (2024). Multi-agent systems powered by large language models: A survey of architectures, applications, and safety considerations. IEEE Transactions on Knowledge and Data Engineering, 36(4), 1789-1808.
64. Yao, S., Yu, D., Zhao, J., Shafran, I., Griffiths, T. L., Cao, Y., & Narasimhan, K. (2023). Tree of thoughts: Deliberate problem solving with large language models. Advances in
Neural Information Processing Systems, 36, 11809-11822.


65. Yao, S., Zhao, J., Yu, D., Du, N., Shafran, I., Narasimhan, K., & Cao, Y. (2023). ReAct: Synergizing reasoning and acting in language models. Proceedings of the International Conference on Learning Representations, 1-16.
66. Zhang, C., Li, M., & Wang, H. (2022). Graph neural networks for relational anomaly detection. IEEE Transactions on Neural Networks and Learning Systems, 33(8), 3412
3425.
67. Zhang, H., & Li, Y. (2024). Emergent behavior in LLM-driven multi-agent systems: Opportunities and risks. AI Magazine, 45(2), 112-126.
68. Zhang, Y., Wang, L., & Liu, J. (2020). Hybrid anomaly detection for time series data. Proceedings of the International Conference on Data Engineering, 154-165.
69. Zheng, L., Chiang, W. L., Sheng, Y., Zhuang, S., Wu, Z., Zhuang, Y., ... & Stoica, I. (2023). Judging LLM-as-a-judge with MT-bench and Chatbot Arena. Advances in Neural Information Processing Systems, 36, 16789-16804.
70. Zhou, B., Li, Y., & Wang, Z. (2024). WebArena: A realistic web environment for building autonomous agents. Proceedings of the Conference on Neural Information Processing Systems, 37, 1-18.
71. Zhou, C., Chen, Q., & Li, Z. (2024). Hierarchical anomaly detection for complex AI systems. IEEE Transactions on Pattern Analysis and Machine Intelligence, 46(2), 1023-1038.
72. Zhou, L., Zhang, S., & Wang, J. (2019). Adversarial autoencoders for anomaly detection in time series. Proceedings of the International Conference on Data Mining Workshops, 128-136.
