#----------------------------------------------
# Container to build Python Protobuf libraries
#----------------------------------------------
FROM gcc:latest as python_protobuf
RUN set -eux; \
    sha256='63c5828825ceee13a8053a31074f114e1480dc5e3d1c2528d4156aa71e8ba515'; \
    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.20.3/protobuf-python-3.20.3.tar.gz; \
    echo "$sha256  protobuf-python-3.20.3.tar.gz" | sha256sum --strict --check -; \
    tar xvzf protobuf-python-3.20.3.tar.gz;
WORKDIR /protobuf-3.20.3
RUN ./configure
RUN make install
WORKDIR /usr/local/lib
RUN tar cvzf libproto.tgz libproto*

FROM scratch
COPY --from=python_protobuf /usr/local/lib/libproto.tgz /usr/local/lib/libproto.tgz
COPY --from=python_protobuf /protobuf-python-3.20.3.tar.gz /protobuf-python-3.20.3.tar.gz
