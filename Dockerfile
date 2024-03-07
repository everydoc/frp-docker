FROM alpine:3.8
MAINTAINER imjcker helloalanturing@icloud.com

WORKDIR /
ENV FRP_VERSION 0.54.0

ADD https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz /

RUN set -x \
    && mkdir -p /frp \
#    && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xzf frp_${FRP_VERSION}_linux_amd64.tar.gz -C /frp --strip-components=1 \
    && rm -f frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cd frp

ADD 404.html /frp/404.html
ADD frps.toml /frp/frps.toml
ADD frpc.toml /frp/frpc.toml

VOLUME /frp

CMD /frp/$FRP -c /frp/$FRP.toml
