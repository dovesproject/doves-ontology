# MONDO Extract

The MONDO Extract was created from the MONDO ontology located at:

https://data.bioontology.org/ontologies/MONDO/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb&download_format=rdf

The extract was performed using the following ROBOT commands:

```
robot extract --input /tmp/mondo.xrdf  --branch-from-term MONDO:0700096 --method MIREOT --intermediates all  --annotate-with-source true   annotate --ontology-iri "http://purl.obolibrary.org/obo/mondo-extract.owl" remove --term "http://www.geneontology.org/formats/oboInOwl#hasDbXref" --term http://purl.obolibrary.org/obo/mondo#exactMatch --term "http://purl.obolibrary.org/obo/mondo#excluded_subClassOf" --term "http://data.bioontology.org/metadata/treeView" --term "http://www.geneontology.org/formats/oboInOwl#inSubset"  --select self --axioms annotation  --signature true --trim true  --output /tmp/mondo-extract.owl -v
```
