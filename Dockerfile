FROM nvidia/cuda:12.6.1-runtime-ubuntu22.04

COPY ./init.sh init.sh
RUN chmod +x init.sh

RUN apt-get update && apt-get install -y wget python3.10 python3-pip python3.10-venv git nvidia-cuda-toolkit nvidia-driver-550 nvidia-container-toolkit

ENTRYPOINT ["sh", "/init.sh"]

EXPOSE 8188