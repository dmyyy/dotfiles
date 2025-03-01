# Clean Install Checklist 

# fonts

```
sudo ln -s ~/.fonts /usr/share/fonts/fontfiles
sudo fc-cache -fv
```

# rust

- install rust
```
sudo apt install librust-alsa-dev

sudo apt install openssl
sudo apt install libssl-dev 
```

- install linkers/compilers/debuggers
```
sudo apt install clang mold lld llvm
sudo apt install lldb
```

- install rust-analyzer from source
```
git clone https://github.com/rust-lang/rust-analyzer.git && cd rust-analyzer
cargo xtask install
```
- update rust-analyzer
    - remove `.cargo/bin/rust-analyzer`
    - rebuild `~/rust/rust-analyzer`

- fix bevy not building
```
sudo apt install librust-alsa-dev
sudo apt install libudev-dev
```

# neovim
```
cargo install bob-nvim
bob install latest
bob use latest
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install fzf
sudo apt install lua5.1
sudo apt install lua5.1 liblua5.1-0-dev
```

- [luarocks](https://luarocks.org/)
- [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu)

# fish plugins
```
curl -sS https://starship.rs/install.sh | sh
```

