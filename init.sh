#!/bin/sh

# Create and activate virtual environment
mkdir -p /env
cd /env
if [ ! -d "comfy" ]; then
    python3 -m venv comfy
fi
. ./comfy/bin/activate

# Clone ComfyUI if not already cloned
if [ ! -d "ComfyUI" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git ComfyUI
fi

# Download model and lora
if [ ! -f "ComfyUI/models/checkpoints/sd_xl_base_1.0.safetensors" ]; then
    wget -P ComfyUI/models/checkpoints https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
fi

if [ ! -f "ComfyUI/models/loras/PS1Redmond-PS1Game-Playstation1Graphics.safetensors" ]; then
    wget -P ComfyUI/models/loras https://huggingface.co/artificialguybr/ps1redmond-ps1-game-graphics-lora-for-sdxl/resolve/main/PS1Redmond-PS1Game-Playstation1Graphics.safetensors
fi

# Install dependencies
cd ComfyUI
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu126
pip3 install -r requirements.txt

# Run ComfyUI
python3 main.py --listen 0.0.0.0