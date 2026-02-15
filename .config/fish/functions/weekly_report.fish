# Uses AI to generate a weekly report
function weekly_report
    set -l DAILY_NOTES "$HOME/journal/daily"
    set -l CONTEXT_FILES

    # Look back at the last 7 days
    for i in (seq 1 7)
        set -l d_target (date -v-"$i"d +%Y-%m-%d)
        set -l y_target (date -v-"$i"d +%Y)
        set -l m_target (date -v-"$i"d +%m-%B)
        set -l p_target "$DAILY_NOTES/$y_target/$m_target/$d_target.md"

        if test -f "$p_target"
            set -a CONTEXT_FILES "$p_target"
        end
    end

    if test (count $CONTEXT_FILES) -gt 0
        sc weekly-report -c $CONTEXT_FILES
    end
end
