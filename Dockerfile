FROM alpine:3.18.12

# install python3, pip3 and perl
RUN apk add --no-cache \
 curl=8.12.1-r0 \
 unzip=6.0-r14 \
 python3=3.11.12-r1 \
 py3-pip=23.1.2-r0 \
 perl=5.36.2-r1 \
 exiftool=12.60-r0

# install sortphotos from release zip
RUN curl -L -o sortphotos.zip -s https://github.com/matthiasbalke/sortphotos/archive/refs/tags/2.0.0.zip && \
    unzip sortphotos.zip && \
    cd sortphotos-* && \
    pip3 install . && \
    cd .. && \
    rm -rf sortphotos.zip && \
    rm -rf sortphotos-*

# run as default user
USER 1000

ENTRYPOINT ["sortphotos"]
CMD ["--help"]
