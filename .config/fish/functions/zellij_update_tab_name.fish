function zellij_update_tab_name
    if set -q ZELLIJ
        set tab_name $(basename $PWD)
        eval zellij action rename-tab $tab_name
    end
end
