FROM traffmonetizer/cli_v2:latest AS upstream

FROM alpine:3.22

RUN apk add --no-cache busybox-extras && mkdir -p /www && printf 'hello' > /www/index.html

COPY --from=upstream /usr/local/bin/cli /usr/local/bin/cli
COPY --chmod=755 entrypoint.sh /usr/local/bin/traffmonetizer-entrypoint

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/traffmonetizer-entrypoint"]