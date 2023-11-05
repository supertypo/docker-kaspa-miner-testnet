FROM debian:stable-slim

WORKDIR /app

ENV PATH=/app:$PATH

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    wget \
    ca-certificates && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/tmrlvi/kaspa-miner/releases/download/v0.2.1-GPU-0.7/kaspa-miner-v0.2.1-GPU-0.7-default-linux-gnu-amd64.tgz -O -\
  | tar -xz --strip-components=1 -C /app && \
  ln -s /app/kaspa-miner* /app/kaspa-miner

USER nobody

CMD ["kaspa-miner", "-p", "16210", "-t", "1", "-a", "kaspatest:qrxxd84m37wc09awj8g69pz7s6j923fk4jhsm8a4khpdpgxe5mzqv2u0je8ku"]

