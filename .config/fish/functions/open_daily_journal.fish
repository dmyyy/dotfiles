# open daily journal in helix
function open_daily_journal
    set -l DAILY_NOTES "$HOME/journal/daily"

    set -l TODAY (date +%Y-%m-%d)
    set -l YEAR (date "+%Y")
    set -l MONTH (date "+%m-%B")
    set -l DEST_DIR "$DAILY_NOTES/$YEAR/$MONTH"
    set -l FILE_NAME "$TODAY.md"

    # Create the directory if it doesn't exist
    mkdir -p "$DEST_DIR"

    # Full file path
    set -l FILE_PATH "$DEST_DIR/$FILE_NAME"

    # Create the file if it doesn't exist
    if not test -f "$FILE_PATH"
        touch "$FILE_PATH"
        begin
            echo "# $TODAY"
            echo
            echo ---
            echo
        end >"$FILE_PATH"

        # Export a universal path for today's journal
        set -U DAILY_JOURNAL "$FILE_PATH"
    end

    hx $DAILY_JOURNAL
end
