# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes to install via `comfy node install`.
# Unknown-registry custom nodes:
# Could not resolve unknown registry custom node `UnetLoaderGGUF` because no aux_id (GitHub repo) was provided — skipped.

# download models into comfyui
RUN comfy model download --url https://huggingface.co/jayn7/Z-Image-Turbo-GGUF/blob/main/z_image_turbo-Q8_0.gguf --relative-path models/diffusion_models --filename z_image_turbo-Q8_0.gguf
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
# COPY input/ /comfyui/input/
