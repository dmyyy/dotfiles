# rust
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export PATH=$PATH:/.cargo/bin

# golang
export PATH=$PATH:/usr/local/go/bin

# bob - neovim package manager
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

export HELIX_RUNTIME=~/git/helix/runtime

source $HOME/.bashrc

fish
. "$HOME/.cargo/env"
