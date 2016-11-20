# Release testing image
#
# VERSION 1.0
FROM ubuntu:16.04
MAINTAINER LFE Maintainers <maintainers@lfe.io>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

COPY tmp/olp /opt/olp
ENV ERL_LIBS=$ERL_LIBS:/opt/olp/lib
ENV PATH $PATH:/opt/olp/bin:`find /opt/olp -maxdepth 1 -type d -name "*erts-*"`/bin

RUN echo 'PATH=$PATH:`find /opt/olp -maxdepth 1 -type d -name "*erts-*"`/bin' >> /root/.bashlferc
RUN echo 'PATH=$PATH:/opt/olp/bin' >> /root/.bashlferc
RUN echo 'alias erl="erl -boot /opt/olp/bin/start_clean"' >> /root/.bashlferc
RUN echo 'alias lfe="lfe -boot /opt/olp/bin/start_clean"' >> /root/.bashlferc
RUN echo 'source /root/.bashlferc' >> /root/.bashrc

CMD . /root/.bashlferc && \
  /opt/olp/bin/lfe \
    -boot /opt/olp/bin/start_clean
