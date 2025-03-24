FROM nvidia/cuda:12.6.2-runtime-ubuntu22.04

COPY ./init.sh init.sh
RUN chmod +x init.sh

RUN apt-get update && apt-get install -y wget python3 python3-pip python3-venv git nvidia-container-toolkit

ENTRYPOINT ["/init.sh"]

EXPOSE 8188