FROM alpine:3.8
MAINTAINER imjcker helloalanturing@icloud.com

WORKDIR /
ENV FRP_VERSION 0.47.0
RUN set -x \
    && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir -p /frp \
    && tar -xzf frp_${FRP_VERSION}_linux_amd64.tar.gz -C /frp --strip-components=1 \
    && rm -f frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cd frp

VOLUME /frp

CMD /frp/$FRP -c /frp/$FRP.ini
