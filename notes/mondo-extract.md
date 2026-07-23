# MONDO Extract

The Mondo human-disease extract (`ontologies/mondo-human-disease-extract.owl`)
is a MIREOT extract of the human-disease branch of the Mondo Disease Ontology,
rooted at `MONDO:0700096`, with cross-references and unused annotations removed.

To regenerate it, run:

```
BIOPORTAL_API_KEY=xxxxxxxx ./scripts/build-mondo-extract.sh
```

The script downloads Mondo from BioPortal and runs the ROBOT `extract` /
`annotate` / `remove` pipeline. See [`scripts/build-mondo-extract.sh`](../scripts/build-mondo-extract.sh)
for the exact commands.
