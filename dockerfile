FROM ubuntu:xenial

############################################################
# Common steps (must be the same in the CPU and GPU images)

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    iputils-ping \
    git \
    python2.7 \	
    python-pip \	
    python-dev \	
    python-software-properties \	
    python-tk \
    software-properties-common \
    build-essential \
    cmake \
    libhdf5-dev \
    swig \
    wget \
    curl

## Python 3.6
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update -y  && \
    apt-get install python3.6 -y \
        python3.6-venv \
        python3.6-dev \
        python3-pip \
        python3-software-properties

# Set Python3.6 as the default python3 version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6

### Without this Python thinks we're ASCII and unicode chars fail
ENV LANG C.UTF-8

## Python packages
RUN pip2 install -U pip
RUN pip3 install -U pip

RUN pip2 install -U \
      numpy \
      scipy \
      matplotlib \
      tqdm \
      wheel \
      statsmodels
RUN python3 -m pip install -U \
      numpy \
      scipy \
      matplotlib \
      tqdm \
      wheel \
      statsmodels
