FROM ubuntu:20.04

RUN apt -y update 
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install cmake build-essential

WORKDIR /helloworld_app

COPY . .

RUN cmake -B ./build && cmake --build ./build

CMD ["./build/src/HelloWorldProject_run"]
