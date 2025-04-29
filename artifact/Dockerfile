FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  cmake \
  autoconf \
  python3 \
  python3-pip \
  python3-venv \
  python-is-python3 \
  libgmp-dev \
  libmpfr-dev \
  libmpc-dev \
  zlib1g-dev \
  libboost-all-dev

# The artifact will be under /artifact
WORKDIR /artifact

# Clone repository
RUN git clone --recurse-submodules https://github.com/sebastiaanbrand/q-sylvan-benchmarks.git
WORKDIR /artifact/q-sylvan-benchmarks

# Install python dependencies in virtual environment
RUN python -m venv .venv && \
  . .venv/bin/activate && \
  pip install -r requirements.txt

# Compile all tools
RUN ./compile_all.sh

ENTRYPOINT ["/bin/bash"]
