FROM debian:buster-slim
COPY ./ac-server /ac-server
RUN apt-get update && \
    apt-get install -y libsdl1.2debian libcurl4 && \
    chmod +x /ac-server/server.sh
WORKDIR /ac-server
CMD ./server.sh
