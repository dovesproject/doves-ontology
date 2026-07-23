# DOVeS Ontology

The **Digital medicine Outcomes Value Set (DOVeS)** ontology provides a set of
ontologically structured healthcare outcomes — clinical, operational, economic,
technical, and others — tailored to digital medicine and digital therapeutic
applications. It is intended to help stakeholders describe, compare, and discover
digital health tools (DHTs) according to the outcomes those tools aim to influence.

## Background

DOVeS was developed with input from industry, healthcare providers, payers,
regulatory bodies, and patients, coordinated through the ADviCE consortium. The
class hierarchy was derived from a four-generation outcomes taxonomy together with
data drawn from 185 digital health vendors, and it was field tested with a further
40 independent vendors between December 2022 and May 2023. The ontology is authored
in the Web Ontology Language (OWL) using Protégé.

DOVeS reuses two external ontologies:

- **Mondo Disease Ontology** — for disease and condition outcomes.
- **Ontology of Adverse Events (OAE)** — for adverse-event outcomes.

## Repository contents

| Path | Description |
| --- | --- |
| `ontologies/root-ontology.owl` | The root DOVeS ontology, which imports the modules below. |
| `ontologies/mondo-human-disease-extract.owl` | MIREOT extract of the human-disease branch of Mondo. |
| `ontologies/AdverseEventExtract.owl` | Extract of the Ontology of Adverse Events. |
| `ontologies/icd.owl` | ICD-related classes used by the ontology. |
| `ontologies/catalog-v001.xml` | Protégé XML catalog mapping import IRIs to local files. |
| `notes/` | Notes on how the imported extracts were produced (e.g. the ROBOT commands used for the Mondo extract). |
| `queries/` | SPARQL queries used for quality checking (e.g. finding duplicate labels and outcome classes missing the expected "Outcome" label suffix). |
| `sources/` | Source data used in building the ontology (PROMs, ICD/CCS procedure codes, and the Mondo hierarchy). |
| `LICENSE` | License file. |

## Identifiers

- Ontology IRI: `https://w3id.org/doves/doves-ontology`
- Class IRIs use the `https://purl.org/doves/` namespace with UUID local names.

## Availability

DOVeS is publicly available on GitHub and on
[BioPortal](https://bioportal.bioontology.org/).

## License

The DOVeS ontology content is released under
[Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0),
as declared in the ontology. Repository code and files are covered by the BSD
2-Clause License in [`LICENSE`](LICENSE).

## Citation

> Rosner B, Horridge M, Austria G, Lee T, Auerbach A. An Ontology for Digital
> Medicine Outcomes: Development of the Digital Medicine Outcomes Value Set (DOVeS).
> *JMIR Med Inform*. 2025 Feb 6;13:e67589. doi:10.2196/67589. PMID: 39914801.

Article: <https://pubmed.ncbi.nlm.nih.gov/39914801/>
