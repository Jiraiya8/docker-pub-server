FROM alpine/git:latest as git

WORKDIR /root/

RUN git clone https://github.com/dart-archive/pub_server.git

FROM dart:2.19.4 as build

ENV PUB_HOSTED_URL=https://pub.flutter-io.cn

COPY --from=git /root/pub_server /root/pub_server

WORKDIR /root/pub_server

RUN dart pub get && \
  dart compile exe --output /bin/pub_server example/example.dart

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /bin/pub_server /bin/

VOLUME [ "/root/package-db" ]
EXPOSE 8080

ENTRYPOINT ["/bin/pub_server"]

CMD ["-h", "0.0.0.0", "-p", "8080", "-d", "/root/package-db"]
