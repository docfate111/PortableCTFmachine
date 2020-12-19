#!/bin/sh
docker build -f Folder/Dockerfile -t ctf:latest .
docker run -it --rm --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/home ctf:latest
