# no greeting
set -g fish_greeting

if status is-interactive
    # set fish as the default shell
    set SHELL /opt/homebrew/bin/fish

    # python
    abbr py python3
    pyenv init - fish | source

    # UPDATE PATH env var
    set PATH ~/.local/bin $PATH
    # helix
    set PATH $HOME/rust/helix/target/release $PATH
    # allow fish paths to work in cargo commands
    set PATH $HOME/.cargo/bin $PATH
    # llvm
    set PATH "$(brew --prefix)/opt/llvm/bin:$PATH" $PATH
    set PATH $HOME/.cargo/bin $PATH
    # yazi
    set PATH /usr/local/bin/yazi $PATH
    set PATH /usr/local/bin/ya $PATH

    # helix editor
    # 
    # set helix as default editor
    # set EDITOR $HOME/.cargo/bin/hx
    set EDITOR ~/rust/helix/target/release/hx
    set HELIX_RUNTIME ~/rust/helix/runtime

    # FIXME: this doesn't work I think... ghostty uses one in Library
    # ghostty depends on this to find config folder
    set XDG_CONFIG_HOME $HOME/.config

    # llvm
    set LDFLAGS -L/opt/homebrew/opt/llvm/lib

    # zellij
    abbr z 'zellij --layout ~/.config/zellij/layouts/default.kdl --config ~/.config/zellij/config.kdl'

    # neovim
    set -U fish_user_paths $HOME/.local/share/bob/nvim-bin $fish_user_paths

    # bash aliases
    abbr cl clear
    abbr cat bat
    abbr ls 'eza -l --git --git-repos --header --group-directories-first --icons=always  --time-style=\'+%Y-%m-%d   %H:%M\''
    abbr tree 'tree -C -L 2'

    # cargo aliases
    abbr ca 'cargo add'
    abbr cr 'cargo lrun'
    abbr cb 'cargo lbuild'
    abbr cc 'cargo lcheck'
    abbr cre 'cargo run --example'
    abbr ctls 'RUSTFLAGS=-Awarnings cargo test -q -- --list'
    abbr ct 'RUSTFLAGS=-Awarnings cargo test -q -- --nocapture'

    # lazygit
    abbr lg lazygit

    # git aliases
    abbr gs 'git status -sb'
    abbr gp 'git pull'
    abbr gP 'git push'
    abbr gf 'git fetch --all --prune'
    abbr gb 'git branch -av'
    abbr gc 'git checkout'
    abbr gl 'git log --oneline --graph --decorate --all'
    abbr gr 'git remote -v'
    abbr gaa 'git add -A'
    abbr gcm 'git commit -m'

    # starship init
    starship init fish | source

    # y shell wrapper that allows changing current working dir on yazi exit
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # run yazi on startup when opening a new zellij tab
    if test "$YAZI" = true
        y
    end
end

# haskell install
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/dmy/.ghcup/bin # ghcup-env
