# RunPod ComfyUI Worker with Qwen-Image-2512 models
FROM runpod/worker-comfyui:5.7.1-base

# Download Qwen-Image-2512 models using comfy-cli
# 1. Text Encoder (8.7GB)
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors \
  --relative-path models/text_encoders \
  --filename qwen_2.5_vl_7b_fp8_scaled.safetensors

# 2. Diffusion Model fp8 (19GB)
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_2512_fp8_e4m3fn.safetensors \
  --relative-path models/diffusion_models \
  --filename qwen_image_2512_fp8_e4m3fn.safetensors

# 3. VAE (242MB)
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors \
  --relative-path models/vae \
  --filename qwen_image_vae.safetensors

# 4. Lightning LoRA (1.6GB)
RUN comfy model download \
  --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors \
  --relative-path models/loras \
  --filename Qwen-Image-Lightning-4steps-V1.0.safetensors
