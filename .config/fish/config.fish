# no greeting
set -g fish_greeting

if status is-interactive
    # needed for bevy explorer setup
    set PKG_CONFIG_PATH /opt/homebrew/opt/ffmpeg@6/lib/pkgconfig

    # allow fish paths to work in cargo commands
    set PATH $HOME/.cargo/bin $PATH

    # set fish as the default shell
    set SHELL /opt/homebrew/bin/fish
    # set helix as default editor
    set EDITOR $HOME/.cargo/bin/hx

    # ghostty depends on this to find config folder
    set XDG_CONFIG_HOME $HOME/.config

    # llvm
    set LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set PATH "$(brew --prefix)/opt/llvm/bin:$PATH" $PATH

    # zellij
    abbr z 'zellij --layout ~/.config/zellij/layouts/default.kdl --config ~/.config/zellij/config.kdl'

    # neovim
    set -U fish_user_paths $HOME/.local/share/bob/nvim-bin $fish_user_paths

    # enable starshp
    starship init fish | source

    # bash aliases
    abbr cl clear
    abbr cat bat
    abbr ls 'eza -l --git --git-repos --header --group-directories-first --icons=always  --time-style=\'+%Y-%m-%d   %H:%M\''
    abbr tree 'tree -C -L 2'

    # cargo aliases
    abbr ca 'cargo add'
    abbr cr 'RUSTFLAGS=-Awarnings cargo run -q'
    abbr cb 'RUSTFLAGS=-Awarnings cargo build -q'
    abbr cc 'cargo check'
    abbr cre 'RUSTFLAGS=-Awarnings cargo run -q --example'
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

    # y shell wrapper that allows changing current working dir on yazi exit
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"

        update_tab_name
    end

    # run yazi on startup
    if test "$YAZI" = true
        y
        update_tab_name
    end

    # rename zellij tab (when we open up a floating zellij tab)
    # if test "$DASHBOARD" != true
    #     update_tab_name
    # end
end

# haskell install
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/dmy/.ghcup/bin # ghcup-env

# doesn't play nicely w/ helix
# pokeget random
# eza -l --git --git-repos --header
