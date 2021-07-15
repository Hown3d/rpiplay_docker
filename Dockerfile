FROM arm64v8/debian:stable AS builder


WORKDIR /work


RUN apt-get update && apt-get install --no-install-recommends -y git cmake libavahi-compat-libdnssd-dev libplist-dev libssl-dev g++ make ca-certificates
# Get RPiPlay source code

RUN git clone https://github.com/FD-/RPiPlay.git rpiplay
RUN mkdir -p rpiplay/build

WORKDIR /work/rpiplay/build 

RUN cmake .. && make


FROM arm64v8/debian:stable
COPY --from=builder /work/rpiplay/build/rpiplay /rpiplay/

RUN apt-get update && apt-get install --no-install-recommends -y libavahi-compat-libdnssd-dev libplist-dev libssl-dev

WORKDIR /rpiplay

COPY ./docker_entry.sh .

RUN chmod +x docker_entry.sh

ENTRYPOINT ["bash","-c","./docker_entry.sh"]
