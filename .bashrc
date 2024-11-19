alias wezterm='flatpak run org.wezfurlong.wezterm'
alias ls='ls -l'
. "$HOME/.cargo/env"
eval "$(/bin/brew shellenv)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# python
alias python='python3'

# Vulkan env variables
export VULKAN_SDK=~/vulkan/vulkansdk-linux-x86_64-1.3.296.0/1.3.296.0/x86_64
export PATH="$VULKAN_SDK/bin:$PATH"
export LD_LIBRARY_PATH="$VULKAN_SDK/lib"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"
export VK_ADD_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

# DirectXShaderCompiler
export PATH=~/vulkan/DirectXShaderCompiler/builds/bin:$PATH
export PATH=~/vulkan/glslang/install/bin:$PATH
export LD_LIBRARY_PATH=~/vulkan/DirectXShaderCompiler/builds/lib:$LD_LIBRARY_PATH

# flickering shadows if we use AMDVLK so use RADV driver: https://github.com/bevyengine/bevy/issues/16185
export AMD_VULKAN_ICD=RADV
