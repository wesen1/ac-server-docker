FROM debian:buster-slim
COPY ./copy-server-files.sh /copy-server-files.sh
RUN apt-get update && \
    apt-get install -y libsdl1.2debian libcurl4 && \
    /copy-server-files.sh && \
    rm /copy-server-files.sh && \
    chmod +x /ac-server/server.sh
WORKDIR /ac-server
ENTRYPOINT [ "./server.sh" ]
