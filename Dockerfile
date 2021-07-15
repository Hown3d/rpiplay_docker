FROM arm64v8/debian:stable AS builder

RUN apt-get update && apt-get install -y git cmake libavahi-compat-libdnssd-dev libplist-dev libssl-dev g++ wget zip

WORKDIR /work


# Get RPiPlay source code
RUN git clone https://github.com/FD-/RPiPlay.git rpiplay && cd rpiplay && mkdir build && cd build && cmake .. && make


FROM arm64v8/debian:stable
COPY --from=builder /work/RPiPlay/build /rpiplay/

RUN apt-get update && apt-get install -y libavahi-compat-libdnssd-dev libplist-dev libssl-dev

WORKDIR /rpiplay

COPY ./docker_entry.sh .

RUN chmod +x docker_entry.sh

ENTRYPOINT ["bash","-c","./docker_entry.sh"]
