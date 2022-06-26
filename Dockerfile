FROM alpine

WORKDIR /app

ENV PATH=/app:$PATH

RUN apk --no-cache add dumb-init

RUN wget https://github.com/elichai/kaspa-miner/releases/download/v0.2.1/kaspa-miner-v0.2.1-linux-musl-amd64 -O kaspa-miner 2>&1 && \
  chmod 755 kaspa-miner

USER nobody

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["kaspa-miner", "-p", "16210", "-t", "1", "-a", "kaspatest:qrxxd84m37wc09awj8g69pz7s6j923fk4jhsm8a4khpdpgxe5mzqv2u0je8ku"]

