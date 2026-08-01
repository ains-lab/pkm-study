---
source_type: zotero
zotero_item_key: YL2E58Q7
zotero_attachment_keys: ["H3567Z7T"]
attachment_filenames: ["Lu 등 - 2026 - Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge gr.pdf"]
item_type: journalArticle
title: "Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge graph completion"
authors:
  - "Lu, Yiqin"
  - "Zhang, Yang"
  - "Qin, Jiancheng"
  - "Chen, Jiarui"
  - "Mao, Zhongshu"
published: "2026-05-20"
publication: "PeerJ Computer Science"
volume: "12"
pages: "e3879"
doi: "10.7717/peerj-cs.3879"
issn: "2376-5992"
url: "https://peerj.com/articles/cs-3879"
language: "en"
accessed: "2026-07-22T04:40:18Z"
library_catalog: "DOI.org (Crossref)"
rights: "https://creativecommons.org/licenses/by/4.0/"
citation_key: "Lu2026_YL2E58Q7"
zotero_collections: ["NK7LTLD6"]
ingested: 2026-07-22
metadata_status: complete
sha256: "62d9c9150f7b3c54ccf45b1ff5f01b7dd64e746d0af9481d8713aed0a0bce1bd"
---
# Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge graph completion

## Zotero Metadata

- Zotero Item Key: YL2E58Q7
- Item Type: journalArticle
- Citation Key: Lu2026_YL2E58Q7
- Authors: Lu, Yiqin; Zhang, Yang; Qin, Jiancheng; Chen, Jiarui; Mao, Zhongshu
- Published: 2026-05-20
- Publication: PeerJ Computer Science
- Volume: 12
- Pages: e3879
- DOI: 10.7717/peerj-cs.3879
- ISSN: 2376-5992
- URL: https://peerj.com/articles/cs-3879
- Language: en
- Accessed: 2026-07-22T04:40:18Z
- Library Catalog: DOI.org (Crossref)
- Rights: https://creativecommons.org/licenses/by/4.0/
- Collection Keys: NK7LTLD6
- Attachment Keys: H3567Z7T
- Attachment Filenames: Lu 등 - 2026 - Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge gr.pdf

## Abstract

Critical Information Infrastructures (CIIs) underpin a nation’s socio-economic systems and are increasingly targeted by sophisticated cyberattacks. Current models often fail to capture the dynamic interplay between CII management strategies and evolving cyber threats, resulting in defensive measures that lag behind attack developments. To bridge this gap, we propose Requirement–Cyber Threat Intelligence Knowledge Graph Plus (RCTI+), an enhanced knowledge graph that integrates cyber threat intelligence (CTI) with cybersecurity management requirements into a heterogeneous attributed graph, which explicitly characterizes the relationships between management strategies and CTI. To conduct reasoning over RCTI+, we introduce Structure-Enhanced BERT (SeBert), a structure-enhanced pre-trained language model (PLM) with a dual-stage framework: (1) Graph Neural Networks (GNNs) extract structural representations, and (2) a PLM encodes textual attributes while capturing the mutual information between semantic and structural features. This hybrid approach produces rich contextual embeddings that capture both semantic content and topological structure. Extensive experiments on RCTI+, FB15k-237, and WN18RR demonstrate that SeBert achieves state-of-the-art performance and exhibits strong generalization across datasets. The RCTI+ is publicly available at: https://github.com/weiyongyy/RCTI-plus.

## Extracted Text

Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge graph completion
Yiqin Lu1, Yang Zhang2,3, Jiancheng Qin1, Jiarui Chen1 and Zhongshu Mao1
1 School of Electronic and Information Engineering, South China University of Technology, GuangZhou, GuangDong, China 2 School of Computer Science and Engineering, South China University of Technology, GuangZhou, GuangDong, China 3 School of Artificial Intelligence, South China Normal University, GuangZhou, GuangDong, China
ABSTRACT
Critical Information Infrastructures (CIIs) underpin a nation’s socio-economic systems and are increasingly targeted by sophisticated cyberattacks. Current models often fail to capture the dynamic interplay between CII management strategies and evolving cyber threats, resulting in defensive measures that lag behind attack developments. To bridge this gap, we propose Requirement–Cyber Threat Intelligence Knowledge Graph Plus (RCTI+), an enhanced knowledge graph that integrates cyber threat intelligence (CTI) with cybersecurity management requirements into a heterogeneous attributed graph, which explicitly characterizes the relationships between management strategies and CTI. To conduct reasoning over RCTI+, we introduce Structure-Enhanced BERT (SeBert), a structure-enhanced pre-trained language model (PLM) with a dual-stage framework: (1) Graph Neural Networks (GNNs) extract structural representations, and (2) a PLM encodes textual attributes while capturing the mutual information between semantic and structural features. This hybrid approach produces rich contextual embeddings that capture both semantic content and topological structure. Extensive experiments on RCTI+, FB15k-237, and WN18RR demonstrate that SeBert achieves state-of-the-art performance and exhibits strong generalization across datasets. The RCTI+ is publicly available at: https://github.com/weiyongyy/RCTI-plus.
Subjects Algorithms and Analysis of Algorithms, Artificial Intelligence, Databases, Embedded Computing, Security and Privacy Keywords Critical information infrastructure, Cyber threat intelligence, Knowledge graph completion, Pre-trained language model, Graph neural network
INTRODUCTION
Critical Information Infrastructures (CIIs) underpin national stability and socio-economic security and have become primary targets of increasingly sophisticated cyberattacks. The evolving threat landscape requires cybersecurity management mechanisms that can systematically integrate threat intelligence with organizational security requirements to support timely and informed decision-making. Constructing a knowledge graph (KG) that unifies Cyber Threat Intelligence (CTI) with cybersecurity management requirements
How to cite this article Lu Y, Zhang Y, Qin J, Chen J, Mao Z. 2026. Structure-enhanced pre-trained language model for requirement-cyber threat intelligence knowledge graph completion. PeerJ Comput. Sci. 12:e3879 DOI 10.7717/peerj-cs.3879
Submitted 30 July 2025 Accepted 1 April 2026 Published 20 May 2026
Corresponding author Yang Zhang, cszhangyang@mail.scut.edu.cn
Academic editor Ankit Vishnoi
Additional Information and Declarations can be found on page 20
DOI 10.7717/peerj-cs.3879
Copyright 2026 Lu et al.
Distributed under Creative Commons CC-BY 4.0


provides a structured representation framework for modeling the relationships between threats, vulnerabilities, and defensive strategies. Such integration enables efficient incident analysis, facilitates the identification of relevant management measures, and supports the development of proactive defense strategies, thereby enhancing the resilience and security posture of CIIs. Cybersecurity professionals disseminate diverse CTI sources, including Common Vulnerabilities and Exposures (CVE) (Corporation, 2020), Common Attack Pattern Enumeration and Classification (CAPEC) (Corporation, 2022a), Common Weakness Enumeration (CWE) (Corporation, 2022b), STIX (OASIS, 2022), and other publicly available resources. Building on these foundations, researchers have developed multiple cyber threat KGs (Shang et al., 2024b; Li et al., 2024; Sun et al., 2020; Liu, Guo & Gu, 2025). Shang et al. (2024b) propose the Cyber Threat Intelligence Ontology (CVTIO) to construct CVTIKG for the Internet of Vehicles. Li et al. (2024) leverage over 440 security reports to build CS13K, facilitating proactive data modeling and attack path analysis. Liu, Guo & Gu (2025) further construct a KG linking CVE, CWE, and CAPEC, enhancing the understanding of vulnerabilities and threats. Despite these advancements, existing cybersecurity KGs primarily focus on entity-level relationships and threat semantics, with limited integration of cybersecurity management requirements and actionable defense strategies tailored to CIIs. Consequently, the security protection of CIIs still largely relies on manual analysis and expert-driven decision-making, resulting in reactive defense mechanisms. To address these limitations, Chen et al. (2023b) propose CIPKG, a Threat–Defense KG that systematically links cyberattacks with corresponding defense strategies. Building upon this framework, Zhang et al. (2023) construct RCTI, a Requirement–Cyber Threat Intelligence KG that integrates management requirements with CTI and introduces algorithms for automatic mapping between attacks and relevant management knowledge. Despite its contributions, RCTI exhibits several limitations. First, its entities lack textual attributes, impeding the application of language models. Second, discrepancies between CTI and management requirements in structural topology and attribute information constrain the performance of embedding-based models. These challenges underscore the necessity of a unified modeling framework capable of jointly capturing structural topology and textual semantics to achieve comprehensive graph representations and robust reasoning performance. In this work, we present RCTI+, an enhanced Requirement–Cyber Threat Intelligence KG that incorporates textual attributes, enabling comprehensive representation of both structural and semantic information. We further propose Structure-Enhanced BERT (SeBert), a structure-enhanced pre-trained language (PLM) model to perform reasoning over RCTI+. SeBert operates in two stages: (1) learning structural representations via a Graph Neural Network (GNN), and (2) a PLM encodes textual attributes while explicitly aligning semantic embeddings with structural representations through mutual information modeling. This design enables effective integration of structural and textual information within a unified representation space, facilitating robust reasoning over heterogeneous KGs.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 2/24


The key contributions of this article are summarized as follows:
. We construct RCTI+, a heterogeneous attributed KG that integrates CTI with cybersecurity management requirements, establishing an explicit linking framework between cyberattacks and corresponding security management strategies.
. To effectively model the heterogeneous information in RCTI+, we propose SeBert, a novel structure-enhanced PLM model. SeBert jointly learns topological structures and semantic representations, enabling unified modeling of CTI and management requirements and facilitating comprehensive knowledge representation and robust graph reasoning.
. We conduct extensive experiments on RCTI+ and two public benchmark datasets. The results demonstrate that SeBert outperforms the second-best method by 19% on RCTI+ in reasoning performance. Furthermore, SeBert exhibits strong generalization capability across datasets, confirming its robustness and applicability in diverse scenarios.
The remainder of this article is structured as follows. ‘Related Work’ reviews related work. ‘RCTI+ Construction’ describes the construction of the RCTI+ KG. ‘Methodology’ details the architecture and components of the SeBert. ‘Experiments’ presents and analyzes experimental results. Finally, ‘Conclusion and Future Work’ concludes the article with key findings and suggestions for future research directions.
RELATED WORK
Cybersecurity knowledge graphs and datasets
Cybersecurity KGs are developed to unify heterogeneous cybersecurity knowledge into a structured representation, enabling more comprehensive and efficient support for downstream tasks including attack detection (Shang et al., 2024b; Sun et al., 2020; Liu, Guo & Gu, 2025), traceability (Li et al., 2024), and defense strategy formulation (Chen et al., 2023b; Zhang et al., 2023).
For instance, Shang et al. (2024b) develop CVTIKG, a KG that integrates Advanced Persistent Threat (APT) data, vulnerabilities, hacking activities, and Internet of Vehicles (IoV) threat intelligence. This comprehensive framework aims to enhance threat understanding and mitigation within the IoV domain. Similarly, Li et al. (2024) manually curate the CS13K cybersecurity KG, derived from over 440 publicly accessible security reports, to facilitate proactive cybersecurity data modeling and improve attack path discovery. Additionally, Liu, Guo & Gu (2025) construct a security KG to analyze the connection between CVE, CWE, and CAPEC. Chen et al. (2023b) introduce the CIPKG which extends existing management ontology frameworks to incorporate defensive mechanisms. This framework systematically addresses cross-sectoral and temporal information asymmetries inherent in critical infrastructure protection workflows. Similarly, Zhang et al. (2023) develop the Requirement-Cyber Threat Intelligence (RCTI) to establish a direct correlation between governmental management requirements and CTI, enabling systematic mapping from cyber threats to corresponding management strategies.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 3/24


Building upon RCTI (Zhang et al., 2023), this study further incorporates rich textual descriptive attributes into the KG framework to enhance contextual representation. By integrating structural relationships with semantic information, the proposed approach improves security reasoning capability and supports more comprehensive threatmanagement analysis.
Embedding-based methods
Embedding-based methods are widely adopted for knowledge graph completion (KGC). These approaches map entities and relations into a low-dimensional vector space, where semantic information is captured through geometric transformations (ZhangSun et al., 2025). Early translational models, such as TransE (Bordes, Usunier & Garcia-Durán, 2013), represent relations as vector translations, while extensions like TransH (Wang et al., 2014) and TransR (Lin et al., 2015) introduce projection mechanisms to handle more complex relational patterns. Other representative methods, including DistMult (Yang et al., 2015), ComplEx (Trouillon et al., 2016), and RESCAL (Nickel, Tresp & Kriegel, 2011), employ bilinear or tensor factorization techniques to model richer entity–relation interactions. Recent studies further introduce dynamic sparse embeddings and relation-aware representations (Nandi, Kaur & Singla, 2024) to enhance robustness, while hybrid models combining structural and contrastive learning (Lin et al., 2024) have demonstrated strong performance, particularly on sparse or heterogeneous graphs.
GNN-based methods
Graph neural network (GNN)-based methods iteratively aggregate information from neighboring nodes, allowing each node representation to incorporate both local neighborhood features and higher-order structural dependencies within the graph. Early models, such as GCN (Kipf & Welling, 2017), apply spectral-based convolutions to encode graph topology, while R-GCN (Schlichtkrull et al., 2018) extends this approach to multi-relational graphs by employing distinct weight matrices for each relation type, generating optimized relational representations for multi-relational KG. RGAT (Zhang et al., 2020b) further integrates attention mechanisms into the multi-relational propagation framework, enhancing information aggregation efficiency and mitigating the oversmoothing problem commonly observed in GNNs. Subsequent works have focused on capturing richer graph semantics and multi-hop dependencies. KBGAT (Nathani et al., 2019) addresses the limitation of isolated triple processing by constructing relational clusters and modeling multi-hop relational dependencies. SE-GNN (Li et al., 2021) improves neighborhood information aggregation through distinct propagation mechanisms for nodes, edges, and triples, enabling more comprehensive contextual representations. CompGCN (Vashishth et al., 2020) proposes a unified framework to jointly learn vector representations of both nodes and relations, enhancing performance through integrated representation learning. Finally, EGNN (Zhang et al., 2023) extends conventional GNNs by incorporating explicit edge representations, further improving the expressiveness of graph embeddings.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 4/24


Text-based methods
Text-based methods infer new knowledge by leveraging the textual attributes associated with graph elements, which encode rich prior semantic information. As a result, these approaches have emerged as effective solutions for addressing challenges such as the cold-start problem and long-tail distributions in KGs. Representative approaches include KG-BERT (Yao, Mao & Luo, 2019), Pretrain-KGC (Zhang et al., 2020a), ShallowKGC (Jia & Yao, 2024), and StAR (Wang et al., 2021), which utilize PLM to extract and process textual information embedded within triples. These approaches cast the prediction task as either a classification or query-based problem, which facilitates more effective KGC. Additionally, extensive research has been conducted to explore the integration of graph structures and textual information. For instance, Bibi, Maqbool & Rana (2024) improved source code retrieval by developing a joint framework that combines bidirectional long short-term memory (Bi-LSTM) (Huang, Xu & Yu, 2015) and GNN. TextGCL (Zhao & Song, 2023) addresses text classification through a pipeline that integrates PLM and GNN algorithms. Huang et al. (2024) employed a GNN as an adapter to enhance collaboration with large language models (LLMs). Similarly, G2P2 (Wen & Fang, 2023) combined transformers and GNNs to investigate text classification algorithms under resource-constrained conditions. G2L-KGC (Zhang & Lu, 2025) integrates structural and semantic reasoning by employing GNNs for candidate generation and LLM for fine-grained refinement. However, these approaches are not well-suited for the heterogeneous text-attributed graph (TAG) completion task, as some fail to accommodate heterogeneous graphs (Bibi, Maqbool & Rana, 2024; Zhao & Song, 2023), while others disregard relational information (Huang et al., 2024; Wen & Fang, 2023). To overcome these limitations, this article introduces SeBert, a framework designed to simultaneously capture textual and structural information for TAG. By effectively integrating these two modalities, SeBert constructs a more comprehensive representation, improving the accuracy of the prediction.
RCTI+ CONSTRUCTION
RCTI (Zhang et al., 2023) is a pioneering framework that integrates security management requirements and CTI data to construct a KG aimed at identifying management vulnerabilities and enhancing the resilience and security posture of CIIs. Due to the absence of textual attributes in RCTI (Zhang et al., 2023), its reasoning capability is restricted to purely embedding-based approaches, limiting its ability to leverage semantic information. To address this limitation, we extend the RCTI by incorporating textual descriptions for all entities, as illustrated in Fig. 1. Specifically, the textual information for the Doc, Title, and Req entities is derived from 23 official management documents included in the national cybersecurity standards of the People’s Republic of China. Consequently, these nodes contain attributes such as document titles, section headings, and detailed management requirements in Chinese. For the CVE, CWE, and CAPEC entities, the attributes are obtained from node names and descriptive texts, with data directly obtained from their official websites (Corporation, 2020, 2022b, 2022a). In RCTI+, the linkage between management knowledge and CTI is established through
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 5/24


3,603 manually constructed reason of edges between Req and CAPEC, which are defined in the same way as in RCTI (Zhang et al., 2023). RCTI+ is a heterogeneous TAG that integrates CTI with security management requirements, thereby establishing their interconnections and providing a more comprehensive representation of cybersecurity KG. The KG contains 16,819 entities, including 9,831 with English descriptions and 6,988 with Chinese descriptions. Detailed Schema of RCTI+ is presented in Tables 1 and 2. This enhancement not only enriches the attributes of the original RCTI but also extends its applicability to multilingual
Figure 1 Construction of RCTI+. The ontology framework of RCTI+ is based on that of RCTI (Zhang et al., 2023), with textual attribute information incorporated for all entities and relations. Specifically, the textual descriptions of the entities Doc, Title, and Req are derived from 23 official management documents specified in the cybersecurity standards of the People’s Republic of China. For the CVE, CWE, and CAPEC entities, the attributes are extracted from the corresponding node names and descriptive texts, all obtained from their respective official websites.
Full-size

DOI: 10.7717/peerj-cs.3879/fig-1
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 6/24


cybersecurity analysis and reasoning. Moreover, within the field of KGs, RCTI+ can serve as a cross-lingual resource supporting diverse research directions, such as PLMs, GNNs, and hybrid approaches, thereby making it a versatile resource for cybersecurity reasoning and KGC.
METHODOLOGY
The RCTI+ comprises two major components: CTI data and management requirement data. These two data types exhibit substantial differences in both topology and attribute characteristics. For example, CTI data is highly interconnected and predominantly described in English, whereas management requirement data follows a tree-structured topology with attributes primarily written in Chinese. In addition, the links between management requirement nodes and CAPEC entities are manually constructed and relatively sparse. Consequently, it is difficult for either a purely embedding-based model or a purely text-based model to effectively capture and reason over such complex and heterogeneous graph. To address this challenge, we propose the SeBert model, which integrates GNN and BERT (Devlin et al., 2018) to jointly encode the structural and textual information of nodes and relations, thereby producing a comprehensive fused representation that enables effective reasoning. The architecture of the SeBert model is illustrated in Fig. 2. SeBert adopts a two-step framework. In Step 1, a GNN encodes graph structural representations and fuses head–relation–tail information to obtain structural embeddings, denoted as headg and
Table 1 The node schema of RCTI+.
Entity #Num Language Content
CWE 890 English Common Weakness Enumeration
CAPEC 579 English Common Attack Pattern Enumeration and Classification
CVE 8,362 English Common Vulnerabilities and Exposures
Doc 23 Chinese Management documents (e.g., national standards, policy documents)
Title 1,982 Chinese The section headings within the documents
Req 4,983 Chinese Cybersecurity management requirements as specified in the documents
Table 2 The relation schema of RCTI+.
Relation #Num Language Content
Reason of 3,603 English Management vulnerabilities addressed by CAPEC
Capec has cve 11 English CAPEC attack patterns map to relevant CVE vulnerabilities
Cwe has cve 5,375 English The specific vulnerabilities associated with a given weakness
Capec has cwe 1,013 English Each attack pattern is mapped to the CWE weakness type(s)
Has title 1,978 English The titles of a document
Has requirement 4,983 English The requirements of a title
Cwe has capec 1,062 English CWE weakness type(s) is mapped to the attack pattern
Cve has cwe 5,375 English Maps vulnerability to its underlying weakness type
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 7/24


tailg. In Step 2, BERT (Devlin et al., 2018) is employed to learn the semantic
representations of each triple, denoted as hrb and tb. Contrastive learning is further applied to capture the mutual information between semantic and structural representations, thereby aligning semantic embeddings with structural context. Gray components indicate modules that are frozen during the corresponding training stage. The resulting hybrid representations are ultimately utilized for the KGC task to infer new knowledge.
Problem formulation
A KG is formally represented as G 1⁄4 ðE; RÞ, where E and R denote the sets of entities and relations in the graph, respectively, with the condition jRj > 1. Each entity and relation is associated with textual descriptions, denoted as edes and rdes. Each triple ðh; hdes; r; rdes; t; tdesÞ 2 E R E serves as a ground truth instance, where h and t are entities in E, r is a relation in R, hdes and tdes are descriptions in edes. The task of SeBert is to predict new triples based on the existing graph.
Figure 2 Overall framework of the proposed SeBert model. In Step 1, a GNN encodes graph structural representations and fuses head–relation–tail information to obtain structural embeddings (left, green lines). In Step 2, BERT learns semantic representations while maximizing the mutual information between semantic and structural features, generating hybrid embeddings that integrate both types of information (right, red lines). Gray components denote modules frozen during the corresponding
training stage. Full-size

DOI: 10.7717/peerj-cs.3879/fig-2
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 8/24


Pre-training structural representations GNN module
The structural information of the graph is encoded using a GNN. In this work, we adopt SE-GNN (Li et al., 2021) as the structural encoder. SE-GNN is an effective model for KGC that employs distinct propagation mechanisms for entities, relations, and triples, thereby optimizing neighborhood aggregation and comprehensively capturing graph structural information. The model maintains a favorable balance between representational capacity and computational efficiency. The algorithm of SE-GNN (Li et al., 2021) can be briefly formulated as follows:
el 1⁄4 GNNðeÞ
rl 1⁄4 GNNðrÞ (1)
where el 2 RjEj d and rl 2 R2jRj d denote the entity and relation representations after propagating through l layers, respectively. Here, d denotes the dimension of the embeddings, which is set to 768 to align with the hidden layer representations of the PLM model. This alignment ensures that both structural and semantic information can be effectively integrated, facilitating the learning of mutual information between these two modalities. 2jRj indicates that for each relation in the KG, an inverse relation is additionally introduced. This approach is consistent with most KGC methods (Wang et al., 2022; Vashishth et al., 2020; Zhang et al., 2023; Li et al., 2021).
Fusion module
In PLMs, it is a common practice to first integrate the head entity information with the relational information to form a unified head representation (Wang et al., 2021, 2022), which enhances computational efficiency. Following this approach, we employ a fusion module Fuðel; rlÞ ! ðheadg; tailgÞðheadg; tailg 2 RjEj dÞ to combine the head and relational representations. Specifically, the structural representations hl and rl are concatenated for convolutional processing, as demonstrated in the following equation:
headg 1⁄4 r BatchNorm Conv catðhl; rlÞ (2)
where r denotes the activation function, which is subsequently subjected to a linear transformation via a fully connected layer, as described by the following formula:
headg 1⁄4 FC BatchNorm headg (3)
Given the self-normalization property of BERT representations (Devlin et al., 2018), we further normalize the structural representations to enhance the learning of semantic-structural mutual information. The resulting final structural representation is as follows:
headg 1⁄4 rðBatchNormðheadgÞÞ
tailg 1⁄4 BatchNormðtlÞ (4)
where headg denotes the head representation of the triple after the fusion of the head and relation, tailg is the representation of the tail entitiy, and g signifies the structural information.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 9/24


Structural information loss
The Binary Cross-Entropy Loss (Li et al., 2021) is employed as the loss function for the structural pre-training step:
Lg 1⁄4 1
N
X
t
1ðtailgÞ logð ðheadg; tailgÞÞ þ ð1 1ðtailgÞÞ logð1 ðheadg; tailgÞÞ (5)
where 1ðtailgÞ 2 f0; 1g denotes the indicator function, which outputs 1 for a positive triple and 0 for a negative triple. ðhead; tailÞ denotes the structural information scoring function, designed to encourage similarity between the fused representations of the head and tail. It is defined as follows:
ðhead; tailÞ 1⁄4 Sigmoidðhead tailTÞ: (6)
With adequate training, the resulting headg and tailg encapsulate rich structural information. This structural representation is then utilized in the subsequent stage for learning the mutual information between the structural and semantic features.
Training fusion representations
During this phase, we aim to learn both semantic information and the mutual information between structural and textual representations, leveraging BERT (Devlin et al., 2018) as the foundational model. The process of hybrid representation learning is divided into two key components: (1) Semantic Learning, where BERT captures the textual attributes within the KG, and (2) Semantic-Structural Mutual Information Learning, where the model integrates structural insights with semantic features to enhance KGC.
Semantic learning
Given a triple, the textual descriptions of the head entity and the relation are concatenated using the special tokens [CLS] and [SEP], following prior work (Wang et al., 2022, 2021).
headdes 1⁄4 1⁄2CLS hdes1⁄2SEP rdes1⁄2SEP
taildes 1⁄4 1⁄2CLS tdes1⁄2SEP : (7)
Subsequently, BERT (Devlin et al., 2018) is used to compute the representations for the head and the tail descriptions.
headb 1⁄4 BERTðheaddesÞ
tailb 1⁄4 BERTðtaildesÞ: (8)
The semantic representations of the head and tail entities, denoted as headb and tailb, are obtained by applying mean pooling followed by L2 normalization (Gao, Yao & Chen, 2021; Wang et al., 2022). For each head entity headi, there is exactly one positive sample taili, while all other tailjðj 61⁄4 iÞ within the same batch are treated as negative samples. To
encourage separation between positive and negative pairs, the InfoNCE objective with an additive margin (Yang et al., 2019) is employed to optimize the textual representations. The corresponding formula for the loss function is as follows:
Lb 1⁄4 log eðfðheadb; tailbÞ cÞ=s
eðfðheadb; tailbÞ cÞ=s þ PjBj
i1⁄41 ef headb; tailbi
ð Þ=s (9)
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 10/24


where s denotes the temperature parameter, while c > 0 serves to encourage the model to enhance the score of the positive triple. jBj denotes the triples in batch, and fðhead; tailÞ represents the score function for the head and tail, encouraging similar representations for the head and tail of the triple for head and tail. The corresponding formula is as follows:
fðhead; tailÞ 1⁄4 head tailT: (10)
Semantic-structural mutual information loss
Mutual information (MI) measures the amount of information shared between two random variables. By maximizing MI, locally consistent elements are encouraged to obtain similar representations (Hjelm et al., 2018).
MIðX; YÞ 1⁄4 X
ðx; yÞ2X Y
pðx; yÞlog pðx; yÞ
pðxÞpðyÞ : (11)
In this work, we maximize the MI between the structural and semantic representations of the same node, thereby embedding structural information into its corresponding semantic representation and effectively bridging the structural–semantic gap in heterogeneous graphs. Building on this idea, we design a structural–semantic mutual information loss, which encourages the structural and semantic representations of the same graph element to align, while ensuring their distinction from those of other elements. The mutual information loss is defined and computed as follows:
Li 1⁄4 log eðfðheadg ; headbÞ cÞ=s
eðfðheadg ; headbÞ cÞ=sþPjBj
i1⁄41 ef headg ; headbi
ð Þ=s log eðfðtailg ; tailbÞ cÞ=s
eðfðtailg ;tailbÞ cÞ=sþPjBj
i1⁄41 ef tailg ; tailbi
ð Þ=s: (12)
To jointly train the hybrid model, we combine both the semantic loss and the mutual information loss. This combination allows SeBert to simultaneously learn both the semantic and structural information, which enables the model to generate fusion representations that capture the rich information from both modalities. The total loss function for the SeBert model is defined as:
L 1⁄4 Lb þ Li: (13)
Finally, during the prediction phase, both the trained GNN and BERT (Devlin et al., 2018) modules are jointly utilized to infer new triples.
scoreb 1⁄4 NormðfðBERTðheaddes; TbÞÞÞ
scoreg 1⁄4 Normð ðFusionðGNNðheadgÞÞ; TgÞÞ (14)
where Tb and Tg denote the representations of all entities within the GNN and BERT (Devlin et al., 2018) modules, respectively. The mixed score for the prediction phase is formulated as follows:
Score 1⁄4 kscoreb þ ð1 kÞscoreg: (15)
Here, k is a hyperparameter that balances the contribution of structural and semantic information in the computation of the maximum score. For clarity, the symbols and their definitions are given in Table A1. The algorithm for SeBert is presented in Algorithm 1.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 11/24


EXPERIMENTS Experimental setup
Datasets. The experiments are conducted on RCTI+ and two prominent public KGs:
FB15K-237 (Toutanova & Chen, 2015) and WN18RR (Dettmers et al., 2018). For the RCTI + dataset, 2,700 triples are randomly sampled as the validation set and another 2,700 triples as the test set, with the remaining triples used for training. Notably, the validation and test sets contain entities that do not appear in the training set, thereby increasing the difficulty of generalization. Compared with benchmark datasets, RCTI+ exhibits a sparser graph structure and greater structural heterogeneity, making the reasoning task more challenging. The statistical details of these datasets are summarized in Table 3.
Baselines. This study employs a variety of methodologies to conduct comparative experiments with SeBert. For embedding-based methods, we consider models such as TransE (Bordes, Usunier & Garcia-Durán, 2013), RotatE (Sun et al., 2019), DistMult (Yang et al., 2015), R-GCN (Schlichtkrull et al., 2018), ConE (Bai et al., 2021), MuRP (Balazevic, Allen & Hospedales, 2019), HyperGEL (Zeb et al., 2021), ConvE (Dettmers et al., 2018), ConvKB (Nguyen et al., 2018), KBGAT (Nathani et al., 2019), A2N (Bansal et al., 2019), CompGCN (Vashishth et al., 2020), SE-GNN (Li et al., 2021), EGNN (Zhang et al., 2023), MGTCA (Shang et al., 2024a) and StructurE (Zhang et al., 2022). For text-based methods, we use KG-BERT (Yao, Mao & Luo, 2019), StAR (Wang et al., 2021) and CSProm-KG(Chen et al., 2023a) as baseline models. To ensure fairness, all experiments are conducted using the best-performing hyperparameter settings reported in the original articles for each baseline model. In addition, all reported results are filtered, following the standard evaluation protocol.
Hyper-parameters and evaluation measures
We use bert-base-uncased for WN18RR and FB15k-237, and bert-base-multilingual-cased for RCTI+, along with their corresponding Hugging Face (https://huggingface.co/)
Algorithm 1 The pseudocode for SeBert.
Require: Original graph G, Initialization of GNN representations e and r, text description of graph elements hdes; rdes; tdes, and the BERT encoder Bert Ensure: loss
1: for Each Epoch do 2: for Each step do 3: el; rl 1⁄4 GNNðe; rÞ Encode with GNN encoder (Eq. (1)) 4: headg; tailg 1⁄4 Fuðh; r; tÞ Fusion GNN representaions (Eqs. (2)–(4)) 5: headdes; taildes Obtain the descriptions (Eq. (7))
6: headb 1⁄4 BertðheaddesÞ; tailb 1⁄4 BertðtaildesÞ Encode with text encoder (Eq. (8)) 7: lossg 1⁄4 BCEðheadg; tailg Þ Compute the stuctural loss (Eq. (5)) 8: lossb 1⁄4 Inf oNCEðheadb; tailbÞ Compute the semantic loss (Eq. (9))
9: lossi 1⁄4 Inf oNCEðheadg ; headbÞ þ Inf oNCEðtailg ; tailbÞ Compute the mutual information loss (Eq. (12)) 10: loss 1⁄4 lossb þ lossi Compute the loss for the fusion representation (Eq. (13)) 11: end for 12: end for
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 12/24


tokenizers. Input sequences are truncated or padded to a maximum length of 50 tokens, and mean pooling over token embeddings is applied to obtain fixed-size representations. All BERT (Devlin et al., 2018) parameters are fine-tuned during training, with a batch size of 200, a learning rate of 2 10 5, and 50 epochs. For the GNN used to pre-train structural representations, we set the batch size to 2,000, the learning rate to 2 10 3, and train for 1,000 epochs. The temperature coefficient is fixed at s 1⁄4 0:05. For WN18RR and RCTI+, we set c 1⁄4 0 and k 1⁄4 0:5, whereas for FB15k-237, we use c 1⁄4 0:1 and k 1⁄4 0:5. All other GNN-related hyperparameters follow the settings reported in SE-GNN (Li et al., 2021). All experiments are conducted on a single NVIDIA V100 GPU. For FB15k-237, 50 epochs require approximately 40 h; for WN18RR, around 9 h; and for RCTI+, around 5 h. The SeBert model contains approximately 230M parameters and requires about 24 GB of GPU memory when using a batch size of 160 and a maximum token length of 50. The evaluation metrics commonly utilized in KGC tasks are as follows: - Hit@k (for k 2 f1; 3; 10g), which measures the percentage of correct entities ranked among the top k candidates. - MRR, representing the mean reciprocal rank of all test triples. - MR, indicating the mean rank of correct entities.
Main results
SeBert is first evaluated on the RCTI+, with the results summarized in Table 4 and Fig. B1. The findings show that SeBert surpasses all baseline models and delivers more than a 19% improvement across all evaluation metrics compared with EGNN (Zhang et al., 2023). This substantial gain highlights the importance of incorporating textual descriptions and leveraging PLMs, both of which contribute to enhancing the completeness and accuracy of the KG. Overall, these results further validate the necessity of integrating semantic information and advanced language models into the RCTI+ graph. Furthermore, SeBert achieves competitive or superior performance on FB15k-237 and WN18RR, two standard KGC benchmarks with very different topological and semantic characteristics, with results presented in Tables 5 and 6. This suggests that the model’s design—especially the contrastive alignment of textual and structural features—enables it to generalize beyond the specific domain of cybersecurity. The results underscore SeBert’s robustness in adapting to different types of KGs, regardless of domain, language, or relational complexity. In summary, the experimental results support our hypothesis: the hybrid representations learned through structure-enhanced language models exhibit strong
Table 3 Summary statistics for baseline datasets.
Dataset #Entity #Relation #Train #Dev #Test Language
WN18RR 40,943 11 86,835 3,034 3,134 English
FB15K-237 14,541 237 272,115 17,535 20,466 English
RCTI+ 16,819 8 18,000 2,700 2,700 English & Chinese
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 13/24


robustness across sparse, multilingual, and structurally imbalanced KGs, and the hybrid approach consistently achieves higher accuracy than using either structural or textual methods alone.
Table 4 Experimental results of SeBert and baseline models on the RCTI+ dataset. Each entry represents the mean and standard deviation calculated across three independent trials.
Hit@10 Hit@3 Hit@1 MR MRR
TransE 0.181 0.072 0.011 4,873 0.002
DistMult 0.228 0.181 0.121 5,426 0.160
ConvE 0.304 0.209 0.137 3,620 0.192
R-GCN 0.111 0.088 0.006 7,204 0.159
KBGAT 0.264 0.217 0.174 1,525 0.206
CompGCN 0.319 0.227 0.156 3,350 0.209
EGNN 0.324 0.230 0.160 3,833 0.214
SeBert 0:378 0:005 0:281 0:003 0:207 0:002 1; 111 20 0:263 0:002
Table 5 Comparison between SeBert and baseline models on the FB15k-237 dataset. Results are reported as the mean over three runs.
FB15K-237
Hit@10 Hit@3 Hit@1 MR MRR
TransE1 0.441 0.376 0.198 323 2,300
RotatE 0.480 0.328 0.205 – 0.297
DistMult 0.446 0.301 0.199 512 0.281
ConvKB 0.421 – – – 0.243
ConvE 0.501 0.356 0.237 244 0.325
MuRP 0.518 0.367 0.243 – 0.335
HyperGEL 0.525 0.378 0.253 – 0.345
Rot-Pro 0.540 0.383 0.246 201 0.344
ConE 0.540 0.381 0.247 201 0.345
R-GCN 0.417 – 0.151 – 0.248
KBGAT2 0.331 – – 270 0.157
CompGCN 0.535 0.390 0.264 197 0.355
A2N 0.486 0.348 0.232 – 0.317
SE-GNN 0.549 0.399 0.271 157 0.365
EGNN 0.532 0.383 0.258 168 0.350
StructurE 0.546 0.390 0.252 160 0.351
PRGNN 0.557 – 0.273 139 0.368
StAR 0.482 0.322 0.205 117 0.296
CSProm-KG 0.538 0.393 0.269 – 0.358
SeBert 0:562 0:002 0:404 0:003 0:273 0:002 150 5 0:369 0:002
Not1esI:ndicates results reported by Wang et al. (2021).
2 Indicates results reevaluated by Li et al. (2021). The best performers for each metric are highlighted in bold.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 14/24


Ablation studies
Validity of the SeBert modules
To evaluate the independent contribution of each module in SeBert, we conduct experiments comparing the performance of a standalone GNN model, a standalone BERT model (Devlin et al., 2018), and the full SeBert model. The key distinction between BERT and SeBert is that SeBert additionally learns mutual information, which injects structural information into the language representations. The results are reported in Tables 7, 8 and 9. On the RCTI+, incorporating BERT (Devlin et al., 2018) leads to a substantial performance gain, primarily because the graph is sparse and provides limited structural information. In such settings, BERT’s ability to exploit rich textual descriptions becomes particularly valuable, resulting in a notable improvement in overall performance. Similarly, on the WN18RR and FB15k-237 datasets, which contain relatively dense graph structures, the GNN performs strongly by effectively leveraging the abundant structural information. However, SeBert achieves the best overall performance by jointly learning from both structural and semantic representations. This highlights the complementary strengths of GNNs and language models in different graph environments
Table 6 Comparison of SeBert and baseline models on the WN18RR dataset. Results are reported as the mean over three runs.
WN18RR
Hit@10 Hit@3 Hit@1 MR MRR
TransE1 0.532 0.441 0.043 2,300 0.243
DistMult 0.504 0.470 0.412 7,000 0.444
ConvKB 0.525 – – – 0.248
ConvE 0.520 0.440 0.400 4,187 0.430
MuRP 0.566 0.495 0.440 – 0.481
HyperGEL 0.577 0.501 0.445 – 0.488
Rot-Pro 0.577 0.482 0.397 2,815 0.457
ConE 0.579 0.515 0.453 – 0.494
KBGAT2 0.554 – – 1,921 0.412
CompGCN 0.572 0.509 0.446 3,533 0.484
A2N 0.510 0.460 0.420 – 0.450
SE-GNN 0.572 0.509 0.446 3,211 0.484
EGNN 0.548 0.489 0.435 2,828 0.474
StructurE 0.585 0.500 0.425 2,865 0.479
PRGNN 0.575 – 0.445 1,502 0.488
KG-BERT 0.524 0.302 0.041 97 0.216
CSProm-KG 0.678 0.596 0.522 – 0.575
MGTCA 0.593 0.525 0.475 – 0.511
SeBert 0:679 0:002 0:605 0:002 0:524 0:002 1053 4 0:578 0:002
Not1esI:ndicates results reported by Wang et al. (2021).
2 Indicates results reevaluated by Li et al. (2021). The best performers for each metric are highlighted in bold.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 15/24


and demonstrates the effectiveness of SeBert in integrating these two sources of information to improve KGC.
Ablation analysis of the fusion module
To validate the effectiveness of the fusion module, we replaced it in SeBert with three alternative operations: Add: ðheadg 1⁄4 h þ r; tailg 1⁄4 tÞ, Mul: ðheadg 1⁄4 h ̊r; tailg 1⁄4 tÞ, and Cat: ðheadg 1⁄4 WhðhjjtÞ; tailg 1⁄4 tÞ, where  ̊denotes the Hadamard product, || indicates concatenation, and Wh is a matrix of learnable parameters. As shown in Table 10, all three alternative strategies underperform compared with the proposed fusion module, among which the Add operation achieves the lowest accuracy. This suggests that simple summation fails to effectively integrate the structural information of h and r, and moreover, its operation is inconsistent with the internal mechanisms of GNNs. Cat achieved relatively better performance, as its mechanism is closer to that of the fusion module. Overall, these results confirm that the proposed fusion module more effectively combines the structural representations of head and relation entities, thereby providing richer structural information for subsequent mutual information learning.
k coefficient
We conducted an in-depth analysis of the hyperparameter k, which balances structural and semantic information in SeBert. As shown in Figs. 3 and 4, the optimal value of k varies
Table 9 Independent performance assessment of individual SeBert modules on FB15K-237.
MR MRR hit@1 hit@3 hit@10
GNN 170 0.361 0.266 0.395 0.555
BERT 172 0.322 0.229 0.353 0.509
SeBert 150 0.369 0.273 0.405 0.562
Note:
The best performers for each metric are highlighted in bold.
Table 7 Independent performance assessment of individual SeBert modules on RCTI+.
MR MRR Hit@1 Hit@3 Hit@10
GNN 4,672 0.204 0.159 0.220 0.290
BERT 1,232 0.224 0.168 0.241 0.330
SeBert 1,111 0.246 0.207 0.281 0.379
Note:
The best performers for each metric are highlighted in bold.
Table 8 Independent performance assessment of individual SeBert modules on WN18RR.
MR MRR Hit@1 Hit@3 Hit@10
GNN 4,619 0.421 0.387 0.429 0.491
BERT 1,054 0.568 0.504 0.604 0.679
SeBert 1,053 0.568 0.524 0.605 0.680
Note:
The best performers for each metric are highlighted in bold.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 16/24


considerably across datasets. For RCTI+ and WN18RR, lower values ðk 1⁄4 0:1Þ yield the best results, reflecting their simpler or tree-like structures where GNN-derived features dominate. In contrast, FB15k-237 achieves optimal performance at k 1⁄4 0:5, consistent with its dense relational structure that benefits equally from structural and semantic representations.
Case study
This case study provides an intuitive illustration of SeBert’s reasoning capabilities on the RCTI+ KG by integrating structural and semantic information, offering readers a deeper
Table 10 Ablation analysis of the fusion module on WN18RR. The best performers for each metric are highlighted in bold.
MR MRR Hit@1 Hit@3 Hit@10
Add 495 0.329 0.143 0.474 0.603
Mul 377 0.409 0.292 0.472 0.631
Cat 251 0.447 0.319 0.529 0.674
Fusion 1,053 0.579 0.524 0.605 0.680
Figure 3 The effect of the k on the RCTI+ dataset, SeBert achieves the best results at k 1⁄4 0:1. Full-size

DOI: 10.7717/peerj-cs.3879/fig-3
Figure 4 The effect of the k parameter on the Fb15k-237 dataset, SeBert achieves the best results at k 1⁄4 0:5.
Full-size

DOI: 10.7717/peerj-cs.3879/fig-4
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 17/24


understanding of the model’s effectiveness. Through a visual comparison with EGNN (Zhang et al., 2023), we demonstrate SeBert’s superior ability to infer more accurate and semantically meaningful associations, highlighting the advantages of its hybrid representation framework. In this case study, we selected CAPEC-55 as the target node. As shown in Fig. 5, SeBert outperformed EGNN (Zhang et al., 2023) in terms of the number of correctly predicted links. EGNN correctly identified five out of seven valid connections, while SeBert correctly predicted 14 out of 17 valid connections. This result demonstrates SeBert’s significant advantage in identifying meaningful associations between cybersecurity threats and management knowledge. A detailed analysis of the textual descriptions associated with predicted links reveals that the term “hash” occurs frequently across multiple descriptions. This indicates that, compared to embedding-based models such as EGNN (Zhang et al., 2023), SeBert’s integration of structural and semantic information allows it to leverage richer language cues, substantially improving prediction accuracy. However, the incorrect prediction for CAPEC 572 highlights a broader challenge for all PLM-based KGC methods: high textual similarity between entities can introduce semantic noise, potentially leading to false positives. Addressing this issue is crucial for improving the robustness of such models. Future work could explore attention mechanisms that dynamically weight tokens based on their discriminative power, or develop pre-processing techniques to reduce semantic noise from overly common terminology. Overall, compared to EGNN (Zhang et al., 2023), SeBert shows substantial improvements in both the quantity and quality of predicted links,
Figure 5 Comparative case study of SeBert and EGNN on CAPEC-55. Green lines indicate correctly predicted links, while red dashed lines denote incorrect predictions.
Full-size

DOI: 10.7717/peerj-cs.3879/fig-5
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 18/24


demonstrating its effectiveness in bridging the gap between CTI and security management strategies.
CONCLUSION AND FUTURE WORK
In this study, we first construct the enhanced Requirement–Cyber Threat Intelligence knowledge graph (RCTI+), which establishes explicit linkages between the management requirements of CIIs and CTI. RCTI+ incorporates rich structural and attribute information, providing essential support for downstream reasoning tasks. However, management requirements and CTI exhibit fundamentally different informational characteristics, necessitating a model capable of jointly capturing and integrating both types of information. In contrast to embedding-based approaches that emphasize topological signals and text-based methods that overlook structural dependencies, the proposed SeBert jointly models and fuses these complementary modalities within a unified representation framework. Experiments conducted on RCTI+ show that SeBert surpasses the second-best method by 19%, while evaluations on general benchmark datasets further validate its robust generalization performance. Overall, these results validate the importance of hybrid structural–semantic modeling and provide a promising direction for advancing KGC in complex and heterogeneous KGs. While the experimental results are encouraging, our case study reveals that PLMdespite its strength in capturing semantic information—may also introduce textual noise. Future work could explore token-level attention mechanisms, semantic noise reduction strategies, or the use of LLMs for more advanced reasoning. In addition, extending RCTI+ with broader cybersecurity resources—such as STIX (Chen et al., 2023b; OASIS, 2022) and real-world incident reports—could provide more comprehensive knowledge support (Nadella et al., 2025) for safeguarding CII, thereby enhancing its precision, resilience, and adaptability to emerging threats.
APPENDIX
Symbol table
Per-relation accuracy of SeBert on the RCTI+ dataset
On the RCTI+ dataset, we additionally evaluated the accuracy for each relation and summarized the results in Fig. B1. The relation CAPEC has CVE has 0 samples in the test set, while the accuracies of the other relations remain relatively stable.
Ethical and practical standards
FB15k-237 (Toutanova & Chen, 2015) and WN18RR (Dettmers et al., 2018) are publicly available and contain no sensitive information. RCTI+ is our novel framework; all referenced data are publicly accessible and contain no personal or corporate information. All training is conducted on a single NVIDIA V100 GPU. For FB15k-237, 50 epochs took 40 h; WN18RR 9 h; RCTI+ 5 h. SeBert has 230M parameters and requires 24 GB GPU memory with batch size 160 and max token length 50.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 19/24


ADDITIONAL INFORMATION AND DECLARATIONS
Funding
This work was supported by the National Key Research and Development Program of China (grant number 2020YFB1805300) and Research and Development Program in Key Areas of Guangdong Province, China (grant number 2019B010137001). The funders had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
Grant Disclosures
The following grant information was disclosed by the authors: National Key Research and Development Program of China: 2020YFB1805300. Research and Development Program in Key Areas of Guangdong Province, China: 2019B010137001.
Table A1 Symbol table.
Symbol Value Content
s 0.05 Temperature coefficient
k 0.1\0.5 Hyperparameter that balances the contribution of structural and semantic information
c 0\0.1 Margin value to encourage the model to enhance the score of the positive triple.
Structural information scoring function
f Semantic information scoring function
Hadamard product
|| concatenation operation
Figure B1 Per-relation accuracy of SeBert on the RCTI+ dataset.
Full-size

DOI: 10.7717/peerj-cs.3879/fig-6
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 20/24


Competing Interests
The authors declare that they have no competing interests.
Author Contributions
. Yiqin Lu analyzed the data, authored or reviewed drafts of the article, and approved the final draft. . Yang Zhang conceived and designed the experiments, performed the experiments, analyzed the data, prepared figures and/or tables, and approved the final draft. . Jiancheng Qin performed the computation work, authored or reviewed drafts of the article, and approved the final draft. . Jiarui Chen performed the experiments, prepared figures and/or tables, and approved the final draft. . Zhongshu Mao conceived and designed the experiments, performed the computation work, authored or reviewed drafts of the article, and approved the final draft.
Data Availability
The following information was supplied regarding data availability: The RCTI+ code and data is available at Zenodo: Zhang, Y. (2025). RCTI-plus knowledge graph [Data set]. Zenodo. https://doi.org/10.5281/zenodo.17411234. The CVE data and code is available at GitHub: https://github.com/CVEProject/ cvelistV5. The CWE data and code is available at MITRE: CWE: https://cwe.mitre.org/data/ archive.html (Version 4.2). The CAPEC is available at MITRE: https://capec.mitre.org/data/archive.html (Version 3.8).
Supplemental Information
Supplemental information for this article can be found online at http://dx.doi.org/10.7717/ peerj-cs.3879#supplemental-information.
REFERENCES
Bai Y, Ying Z, Ren H, Leskovec J. 2021. Modeling heterogeneous hierarchies with relation-specific hyperbolic cones. Advances in Neural Information Processing Systems 34:12316–12327 DOI 10.48550/arXiv.2110.14923.
Balazevic I, Allen C, Hospedales T. 2019. Multi-relational poincaré graph embeddings. Advances in Neural Information Processing Systems 32:4465–4475.
Bansal T, Juan D-C, Ravi S, McCallum A. 2019. A2N: attending to neighbors for knowledge graph inference. In: Proceedings of the 57th Annual Meeting of the Association for Computational Linguistics, 4387–4392.
Bibi N, Maqbool A, Rana T. 2024. Enhancing source code retrieval with joint bi-LSTM-GNN architecture: a comparative study with ChatGPT-LLM. Journal of King Saud
University-Computer and Information Sciences 36(2):101865 DOI 10.1016/j.jksuci.2023.101865.
Bordes A, Usunier N, Garcia-Durán A. 2013. Translating embeddings for modeling multi-relational data. In: NIPS2013.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 21/24


Chen J, Lu Y, Zhang Y, Huang F, Qin J. 2023b. A management knowledge graph approach for critical infrastructure protection: ontology design, information extraction and relation prediction. International Journal of Critical Infrastructure Protection 43(3):100634 DOI 10.1016/j.ijcip.2023.100634.
Chen C, Wang Y, Sun A, Li B, Lam K-Y. 2023a. Dipping PLMs sauce: bridging structure and text for effective knowledge graph completion via conditional soft prompting. ArXiv DOI 10.48550/arXiv.2307.01709.
Corporation M. 2020. CVE (version 20061101) and candidates as of 20220629. Available at https:// cve.mitre.org/data/downloads/allitems.html.
Corporation M. 2022a. Schema documentation—schema version 3.5. Website. Available at https:// capec.mitre.org/documents/schema/index.html.
Corporation M. 2022b. Schema documentation—schema version 6.8. Available at https://cwe. mitre.org/data/index.html.
Dettmers T, Minervini P, Stenetorp P, Riedel S. 2018. Convolutional 2D knowledge graph embeddings. In: Thirty-Second Aaai Conference on Artificial Intelligence/hirtieth Innovative Applications of Artificial Intelligence Conference/Eighth Aaai Symposium on Educational Advances in Artificial Intelligence, 1811–1818.
Devlin J, Chang M, Lee K, Toutanova K. 2018. BERT: pre-training of deep bidirectional transformers for language understanding. ArXiv DOI 10.48550/arXiv.1810.04805.
Gao T, Yao X, Chen D. 2021. SimCSE: simple contrastive learning of sentence embeddings. ArXiv DOI 10.48550/arXiv.2104.08821.
Hjelm RD, Fedorov A, Lavoie-Marchildon S, Grewal K, Bachman P, Trischler A, Bengio Y. 2018. Learning deep representations by mutual information estimation and maximization. ArXiv DOI 10.48550/arXiv.1808.06670.
Huang X, Han K, Yang Y, Bao D, Tao Q, Chai Z, Zhu Q. 2024. Can GNN be good adapter for LLMs? In: Proceedings of the ACM Web Conference 2024, 893–904.
Huang Z, Xu W, Yu K. 2015. Bidirectional LSTM-CRF models for sequence tagging. ArXiv DOI 10.48550/arXiv.1508.01991.
Jia N, Yao C. 2024. ShallowBKGC: a BERT-enhanced shallow neural network model for knowledge graph completion. PeerJ Computer Science 10(2):e2058 DOI 10.7717/peerj-cs.2058.
Kipf TN, Welling M. 2017. Semi-supervised classification with graph convolutional networks. In: ICLR, 2017.
Li R, Cao Y, Zhu Q, Bi G, Fang F, Liu Y, Li Q. 2021. How does knowledge graph embedding extrapolate to unseen data: a semantic evidence view. In: AAAI’22.
Li H, Shi Z, Pan C, Zhao D, Sun N. 2024. Cybersecurity knowledge graphs construction and quality assessment. Complex & Intelligent Systems 10(1):1201–1217 DOI 10.1007/s40747-023-01205-1.
Lin Y, Liu Z, Sun M, Liu Y, Zhu X. 2015. Learning entity and relation embeddings for knowledge graph completion. Proceedings of the AAAI Conference on Artificial Intelligence 29(1):1323–1329 DOI 10.1609/aaai.v29i1.9491.
Lin J, Wang L, Lu X, Hu Z, Zhang W, Lu W. 2024. Improving knowledge graph completion with structure-aware supervised contrastive learning. In: Al-Onaizan Y, Bansal M, Chen Y-N, eds. Proceedings of the 2024 Conference on Empirical Methods in Natural Language Processing. Miami, Florida, USA: Association for Computational Linguistics, 13948–13959.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 22/24


Liu X, Guo X, Gu W. 2025. SecKG2vec: a novel security knowledge graph relational reasoning method based on semantic and structural fusion embedding. Computers & Security 149(6):104192 DOI 10.1016/j.cose.2024.104192.
Nadella GS, Addula SR, Yadulla AR, Sajja GS, Meesala M, Maturi MH, Meduri K,
Gonaygunta H. 2025. Generative AI-enhanced cybersecurity framework for enterprise data privacy management. Computers 14(2):55 DOI 10.3390/computers14020055.
Nandi A, Kaur N, Singla PM. 2024. DynaSemble: dynamic ensembling of textual and structure-based models for knowledge graph completion. In: Ku L-W, Martins A, Srikumar V, eds. Proceedings of the 62nd Annual Meeting of the Association for Computational Linguistics (Volume 2: Short Papers). Bangkok, Thailand: Association for Computational Linguistics, 205–216.
Nathani D, Chauhan J, Sharma C, Kaul M. 2019. Learning attention-based embeddings for relation prediction in knowledge graphs. In: ACL 2019.
Nguyen DQ, Nguyen TD, Nguyen DQ, Phung D. 2018. A novel embedding model for knowledge base completion based on convolutional neural network. In: Proceedings of the 2018 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, Volume 2 (Short Papers). New Orleans, Louisiana: Association for Computational Linguistics, 327–333.
Nickel M, Tresp V, Kriegel HP. 2011. A three-way model for collective learning on
multi-relational data. In: Proceedings of the 28th International Conference on Machine Learning (ICML), 809–816.
OASIS. 2022. Introduction to stix. Website. Available at https://oasis-open.github.io/ctidocumentation/stix/intro.html.
Schlichtkrull M, Kipf TN, Bloem P, van den Berg R, Titov I, Welling M. 2018. Modeling relational data with graph convolutional networks. Lecture Notes in Computer Science 10843:593–607 DOI 10.1007/978-3-319-93417-4_38.
Shang W, Wang B, Zhu P, Ding L, Wang S. 2024b. A span-based multivariate information-aware embedding network for joint relational triplet extraction of threat intelligence. Knowledge-Based Systems 295(6):111829 DOI 10.1016/j.knosys.2024.111829.
Shang B, Zhao Y, Liu J, Wang D. 2024a. Mixed geometry message and trainable convolutional attention network for knowledge graph completion. Proceedings of the AAAI Conference on Artificial Intelligence 38(8):8966–8974 DOI 10.1609/aaai.v38i8.28745.
Sun Z, Deng ZH, Nie JY, Tang J. 2019. RotatE: knowledge graph embedding by relational rotation in complex space. In: 2019 ICLR.
Sun XQ, Wang ZL, Yang JH, Liu XR. 2020. Deepdom: malicious domain detection with scalable and heterogeneous graph convolutional networks. Computers& Security 99(4):102057 DOI 10.1016/j.cose.2020.102057.
Toutanova K, Chen D. 2015. Observed versus latent features for knowledge base and text
inference. In: Proceedings of the 3rd Workshop on Continuous Vector Space Models and their Compositionality, 57–66.
Trouillon T, Welbl J, Riedel S, Gaussier E, Bouchard G. 2016. Complex embeddings for simple link prediction. In: Proceedings of the 33rd International Conference on International Conference on Machine Learning—Volume 48, ICML’16, 2071–2080. Available at www.JMLR.org.
Vashishth S, Sanyal S, Nitin V, Talukdar PP. 2020. Composition-based multi-relational graph convolutional networks. ArXiv DOI 10.48550/arXiv.1911.03082.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 23/24


Wang B, Shen T, Long G, Zhou T, Wang Y, Chang Y. 2021. Structure-augmented text
representation learning for efficient knowledge graph completion. In: Proceedings of the Web Conference 2021, WWW ’21. New York, NY, USA: Association for Computing Machinery, 1737–1748.
Wang Z, Zhang J, Feng J, Chen Z. 2014. Knowledge graph embedding by translating on
hyperplanes. Proceedings of the AAAI Conference on Artificial Intelligence 28(1):1112–1119.
Wang L, Zhao W, Wei Z, Liu J. 2022. SimKGC: simple contrastive knowledge graph completion with pre-trained language models. ArXiv DOI 10.48550/arXiv.2203.02167.
Wen Z, Fang Y. 2023. Augmenting low-resource text classification with graph-grounded
pre-training and prompting. In: Proceedings of the 46th International ACM SIGIR Conference on Research and Development in Information Retrieval, 506–516.
Yang Y, Abrego GH, Yuan S, Guo M, Shen Q, Cer D, Sung Y-H, Strope B, Kurzweil R. 2019. Improving multilingual sentence embedding using bi-directional dual encoder with additive margin softmax. ArXiv DOI 10.48550/arXiv.1902.08564.
Yang B, Yih SW-t, He X, Gao J, Deng L. 2015. Embedding entities and relations for learning and inference in knowledge bases. In: Proceedings of the International Conference on Learning Representations (ICLR) 2015.
Yao L, Mao C, Luo Y. 2019. KG-BERT: BERT for knowledge graph completion. ArXiv DOI 10.48550/arXiv.1909.03193.
Zeb A, Haq AU, Chen J, Lei Z, Zhang D. 2021. Learning hyperbolic attention-based embeddings for link prediction in knowledge graphs. Knowledge-Based Systems 229:107369 DOI 10.1016/j.knosys.2021.107369.
Zhang Y, Chen J, Cheng Z, Shen X, Qin J, Han Y, Lu Y. 2023. Edge propagation for link prediction in requirement-cyber threat intelligence knowledge graph. Information Sciences 653:119770 DOI 10.1016/j.ins.2023.119770.
Zhang Z, Liu X, Zhang Y, Su Q, Sun X, He B. 2020a. Pretrain-KGE: learning knowledge representation from pretrained language models. In: FINDINGS.
Zhang Y, Lu Y. 2025. G2l-KGC: a GNN-to-LLM reasoning framework for coarse-to-fine
knowledge graph completion. In: 2025 8th International Conference on Machine Learning and Natural Language Processing (MLNLP).
Zhang Q, Wang R, Yang J, Xue L. 2022. Structural context-based knowledge graph embedding for link prediction. Neurocomputing 470:109–120 DOI 10.1016/j.neucom.2021.10.088.
Zhang Z, Zhuang F, Zhu H, Shi Z, Xiong H, He Q. 2020b. Relational graph neural network with hierarchical attention for knowledge graph completion. Proceedings of the AAAI Conference on Artificial Intelligence 34(5):9612–9619 DOI 10.1609/aaai.v34i05.6508.
ZhangSun J, Yang YX, Zou B, Peng Q, Xiao XX. 2025. Tuck-KGC: based on tensor
decomposition for diabetes knowledge graph completion model integrating Chinese and western medicine. PeerJ Computer Science 11(7):e2522 DOI 10.7717/peerj-cs.2522.
Zhao Y, Song X. 2023. TextGCL: graph contrastive learning for transductive text classification. In: 2023 International Joint Conference on Neural Networks (IJCNN). Piscataway: IEEE.
Lu et al. (2026), PeerJ Comput. Sci., DOI 10.7717/peerj-cs.3879 24/24
