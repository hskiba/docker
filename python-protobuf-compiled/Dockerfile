#----------------------------------------------
# Container to build Python Protobuf libraries
#----------------------------------------------
FROM gcc:latest as python_protobuf
RUN set -eux; \
    sha256='7f1b19ff546e1f7417361c70028e6da7a4978eaac254e8cc67a570f6459ff9dd'; \
    curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.16.0/protobuf-python-3.16.0.tar.gz; \
    echo "$sha256 protobuf-python-3.16.0.tar.gz" | sha256sum --strict --check -; \
    tar xvzf protobuf-python-3.16.0.tar.gz;
WORKDIR /protobuf-3.16.0
RUN ./configure
RUN make install
WORKDIR /usr/local/lib
RUN tar cvzf libproto.tgz libproto*

FROM scratch
COPY --from=python_protobuf /usr/local/lib/libproto.tgz /usr/local/lib/libproto.tgz
COPY --from=python_protobuf /protobuf-python-3.16.0.tar.gz /protobuf-python-3.16.0.tar.gz
