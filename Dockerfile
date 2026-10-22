FROM traffmonetizer/cli_v2:latest AS upstream

FROM alpine:3.22

COPY --from=upstream /usr/local/bin/cli /usr/local/bin/cli
COPY --chmod=755 entrypoint.sh /usr/local/bin/traffmonetizer-entrypoint

ENTRYPOINT ["/usr/local/bin/traffmonetizer-entrypoint"]