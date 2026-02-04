#  setup zellij journal
function zellij_journal
    # journal
    daily_journal
    cd journal
    zellij run -n journal -i -c -- hx $DAILY_JOURNAL
end
