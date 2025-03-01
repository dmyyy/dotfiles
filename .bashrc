# needed for building things that require x11.pc (wezterm)
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# flickering shadows in Bevy if we use AMDVLK so use RADV driver: https://github.com/bevyengine/bevy/issues/16185
export AMD_VULKAN_ICD=RADV

# nvm installation for node
export NVM_DIR="$HOME/.nvm"
