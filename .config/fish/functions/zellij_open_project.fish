# setup zellij tab for coding
function zellij_open_project
    # open last diagnostic recorded by bacon
    set -l BACON_LOCATIONS (head -n 1 .bacon-locations)
    zellij run -n "─" -i -c -- hx "$BACON_LOCATIONS"

    # start bacon
    zellij run -- bacon -ws
    zellij action resize increase left
    zellij action resize increase left
    zellij action resize increase left

    # swap journal and btop
    zellij action move-pane left
    zellij action move-focus right

    zellij_update_tab_name
end
