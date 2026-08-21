FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG MINICONDA_VERSION=py313_25.9.1-3
ARG TARGETARCH

ENV CONDA_DIR=/opt/conda

# Install Conda and create only the environment needed for Python notebooks.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && case "${TARGETARCH}" in \
        amd64) conda_arch=x86_64 ;; \
        arm64) conda_arch=aarch64 ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac \
    && curl -fsSL \
        "https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-${conda_arch}.sh" \
        -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p "${CONDA_DIR}" \
    && rm /tmp/miniconda.sh \
    && rm -rf /var/lib/apt/lists/*

COPY environment.yml /tmp/environment.yml

RUN "${CONDA_DIR}/bin/conda" env create -f /tmp/environment.yml \
    && rm /tmp/environment.yml \
    && "${CONDA_DIR}/bin/conda" clean -afy

ENV PATH=${CONDA_DIR}/envs/python/bin:${CONDA_DIR}/bin:${PATH}
ENV CONDA_DEFAULT_ENV=python
