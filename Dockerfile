FROM alpine:3.11.3

RUN apk add --no-cache openssl

WORKDIR /app

COPY debug-https-endpoint.sh .

ENTRYPOINT ["/bin/sh", "debug-https-endpoint.sh"]
