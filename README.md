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
| `scripts/` | Scripts for regenerating imported extracts (e.g. the Mondo human-disease extract). |
| `LICENSE` | License file. |

## How it's built

DOVeS is authored directly in [Protégé](https://protege.stanford.edu/) rather
than produced by an automated build pipeline. The ontology is modular and is
assembled through OWL imports:

- **`root-ontology.owl`** holds the native DOVeS content — the outcomes taxonomy
  (asserted `rdfs:subClassOf` hierarchy), human-readable `rdfs:label`s and
  `IAO_0000115` definitions for the UUID-named classes, `rdfs:seeAlso` links back
  to source-ontology terms, and a small number of defined classes
  (`EquivalentClasses` with `has age group` / `has sex` restrictions) that a
  reasoner uses to classify outcomes along demographic dimensions.
- It imports **`mondo-human-disease-extract.owl`** (disease/condition outcomes)
  and **`AdverseEventExtract.owl`** (adverse-event outcomes).
- **`catalog-v001.xml`** is a Protégé XML catalog that maps each import IRI to its
  local file, so opening `root-ontology.owl` resolves the imports from this folder
  rather than the network.

### Regenerating the imported extracts

The Mondo human-disease extract is a MIREOT extract (rooted at `MONDO:0700096`)
produced with [ROBOT](http://robot.obolibrary.org/). To rebuild it you need ROBOT
on your `PATH` and a [BioPortal API key](https://bioportal.bioontology.org/account):

```
BIOPORTAL_API_KEY=xxxxxxxx ./scripts/build-mondo-extract.sh
```

This downloads Mondo from BioPortal, extracts the human-disease branch, strips
cross-references and unused annotations, and writes
`ontologies/mondo-human-disease-extract.owl`.

### Quality checks

The SPARQL queries in `queries/` are run manually against the ontology to catch
common authoring issues — classes with conflicting labels
(`duplicate-labels.sparql`) and outcome classes whose label is missing the
expected `Outcome` suffix (`missing-outcome-suffix.sparql`).

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
