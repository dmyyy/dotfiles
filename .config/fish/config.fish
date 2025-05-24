if status is-interactive
    # allow fish paths to work in cargo commands
    set PATH $HOME/.cargo/bin $PATH

    # wezterm nightly
    set PATH $HOME/rust/wezterm/target/release/wezterm $PATH

    set PATH $HOME/helix-25.01.1-x86_64-linux $PATH

    # Commands to run in interactive sessions can go here
    source ~/.bash_aliases

    # enable starshp
    starship init fish | source
end
