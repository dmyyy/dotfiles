#  setup zellij journal
function zellij_journal
    # journal
    daily_journal
    cd journal
    zellij run -n "─" -i -c -- hx $DAILY_JOURNAL
end
