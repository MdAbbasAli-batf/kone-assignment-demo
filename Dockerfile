FROM ubuntu:20.04

RUN apt -y update 
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install cmake build-essential

WORKDIR /helloworld_app

COPY . .

WORKDIR /helloworld_app/build

RUN cmake .. && cmake --build . --parallel 3

CMD ["./src/HelloWorldProject_run"]