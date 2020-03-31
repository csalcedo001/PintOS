# Image operating system
FROM ubuntu:latest

#Set bash as shell
SHELL ["/bin/bash", "-c"]

# Install required packages
RUN apt clean
RUN apt autoclean
RUN apt update && apt -y upgrade
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install sudo
RUN apt-get install make
RUN apt-get install -y vim gdb clang gcc qemu tree git linux-headers-generic

# Directory where our program will be executed
workdir /pint-os

#Copy contents of current folder to container directory
copy ./pintos/src/ /pint-os


# Enviromental Variables 
ENV PINTOS_HOME=/pint-os 
ENV GDB_MACROS=${PINTOS_HOME}/src/mis/gdb-macros
ENV PATH=$PINTOS_HOME/src/utils:${PATH}




