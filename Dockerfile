FROM ubuntu:18.04

RUN useradd -m -s /bin/bash -d /home/ga ga
RUN echo ga:ga | chpasswd

WORKDIR /home/ga
RUN mkdir actions-runner
WORKDIR /home/ga/actions-runner

RUN apt-get update
RUN apt-get curl
RUN apt-get vim

RUN curl -O -L https://github.com/actions/runner/releases/download/v2.273.0/actions-runner-linux-x64-2.273.0.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.273.0.tar.gz

RUN ./bin/installdependencies.sh

CMD ["/bin/bash"]
