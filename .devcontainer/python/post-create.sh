#!/usr/bin/env bash
set -euo pipefail

source /opt/conda/etc/profile.d/conda.sh
conda activate python

python -m ipykernel install \
  --user \
  --name python \
  --display-name "Python (Conda)"
