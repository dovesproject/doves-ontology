#!/usr/bin/env bash
#
# Regenerate the Mondo human-disease extract used by the DOVeS ontology.
#
# This downloads the Mondo Disease Ontology from BioPortal and produces a
# MIREOT extract rooted at the "human disease" branch (MONDO:0700096), then
# strips cross-references and other annotations that DOVeS does not use.
#
# Requirements:
#   - ROBOT (http://robot.obolibrary.org/) available on the PATH.
#   - A BioPortal API key, provided via the BIOPORTAL_API_KEY environment
#     variable. Get one from https://bioportal.bioontology.org/account.
#
# Usage:
#   BIOPORTAL_API_KEY=xxxxxxxx ./scripts/build-mondo-extract.sh
#
# The result is written to ontologies/mondo-human-disease-extract.owl.

set -euo pipefail

if [[ -z "${BIOPORTAL_API_KEY:-}" ]]; then
    echo "error: BIOPORTAL_API_KEY is not set." >&2
    echo "Get a key from https://bioportal.bioontology.org/account and run:" >&2
    echo "  BIOPORTAL_API_KEY=xxxxxxxx $0" >&2
    exit 1
fi

if ! command -v robot >/dev/null 2>&1; then
    echo "error: 'robot' not found on PATH. Install ROBOT: http://robot.obolibrary.org/" >&2
    exit 1
fi

# Repository root (this script lives in scripts/).
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ROOT_TERM="MONDO:0700096"                 # human disease
OUTPUT="${REPO_ROOT}/ontologies/mondo-human-disease-extract.owl"
ONTOLOGY_IRI="http://purl.obolibrary.org/obo/mondo-extract.owl"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "${WORKDIR}"' EXIT

MONDO_SOURCE="${WORKDIR}/mondo.xrdf"

echo "Downloading Mondo from BioPortal..."
curl -fsSL \
    "https://data.bioontology.org/ontologies/MONDO/download?apikey=${BIOPORTAL_API_KEY}&download_format=rdf" \
    -o "${MONDO_SOURCE}"

echo "Extracting ${ROOT_TERM} branch via MIREOT..."
robot extract \
        --input "${MONDO_SOURCE}" \
        --branch-from-term "${ROOT_TERM}" \
        --method MIREOT \
        --intermediates all \
        --annotate-with-source true \
    annotate \
        --ontology-iri "${ONTOLOGY_IRI}" \
    remove \
        --term "http://www.geneontology.org/formats/oboInOwl#hasDbXref" \
        --term "http://purl.obolibrary.org/obo/mondo#exactMatch" \
        --term "http://purl.obolibrary.org/obo/mondo#excluded_subClassOf" \
        --term "http://data.bioontology.org/metadata/treeView" \
        --term "http://www.geneontology.org/formats/oboInOwl#inSubset" \
        --select self \
        --axioms annotation \
        --signature true \
        --trim true \
    --output "${OUTPUT}" \
    -v

echo "Wrote ${OUTPUT}"
