#  setup zellij home tab
function zellij_home
    # journal
    daily_journal
    cd journal
    zellij run -n "❖ " -i -c -- hx $DAILY_JOURNAL

    # btop - diagnostics dashboard
    zellij run -- btop
    zellij action resize increase left
    zellij action resize increase left
    zellij action resize increase left

    # swap journal and btop
    zellij action move-pane left
    zellij action move-focus right
end
