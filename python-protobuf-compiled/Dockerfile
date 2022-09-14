#----------------------------------------------
# Container to build Python Protobuf libraries
#----------------------------------------------
FROM gcc:latest as python_protobuf
RUN set -eux; \
    sha256='a014a0108e18c06a0c0308d92cdcae6ee106e4b02dd2ab1ff7073c4c80153aea'; \
    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v21.6/protobuf-python-4.21.6.tar.gz; \
    echo "$sha256 protobuf-python-4.21.6.tar.gz" | sha256sum --strict --check -; \
    tar xvzf protobuf-python-4.21.6.tar.gz;
WORKDIR /protobuf-4.21.6
RUN ./configure
RUN make install
WORKDIR /usr/local/lib
RUN tar cvzf libproto.tgz libproto*

FROM scratch
COPY --from=python_protobuf /usr/local/lib/libproto.tgz /usr/local/lib/libproto.tgz
COPY --from=python_protobuf /protobuf-python-4.21.6.tar.gz /protobuf-python-4.21.6.tar.gz
