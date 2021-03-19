#----------------------------------------------
# Container to build Python Protobuf libraries
#----------------------------------------------
FROM gcc:latest as python_protobuf
RUN set -eux; \
    sha256='7e8c58a14950ac7a727864d5c521f48c81feb66ff7df325487fc930c9aa50d8b'; \
    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.15.6/protobuf-python-3.15.6.tar.gz; \
    echo "$sha256 protobuf-python-3.15.6.tar.gz" | sha256sum --strict --check -; \
    tar xvzf protobuf-python-3.15.6.tar.gz;
WORKDIR /protobuf-3.15.6
RUN ./configure
RUN make install
WORKDIR /usr/local/lib
RUN tar cvzf libproto.tgz libproto*

FROM scratch
COPY --from=python_protobuf /usr/local/lib/libproto.tgz /usr/local/lib/libproto.tgz
COPY --from=python_protobuf /protobuf-python-3.15.6.tar.gz /protobuf-python-3.15.6.tar.gz
