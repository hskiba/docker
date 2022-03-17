#----------------------------------------------
# Container to build Python Protobuf libraries
#----------------------------------------------
FROM gcc:latest as python_protobuf
RUN set -eux; \
    sha256='2e57d47eba535822de3a17d08d5cdc32b0e9757317366c08ad3b717d1a4733f8'; \
    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protobuf-python-3.19.4.tar.gz; \
    echo "$sha256 protobuf-python-3.19.4.tar.gz" | sha256sum --strict --check -; \
    tar xvzf protobuf-python-3.19.4.tar.gz;
WORKDIR /protobuf-3.19.4
RUN ./configure
RUN make install
WORKDIR /usr/local/lib
RUN tar cvzf libproto.tgz libproto*

FROM scratch
COPY --from=python_protobuf /usr/local/lib/libproto.tgz /usr/local/lib/libproto.tgz
COPY --from=python_protobuf /protobuf-python-3.19.4.tar.gz /protobuf-python-3.19.4.tar.gz
