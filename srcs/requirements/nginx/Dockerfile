FROM debian:12-slim

WORKDIR /test/

RUN touch file1 file2 && mkdir dir1 .hidden-dir1

ENTRYPOINT ["ls"]