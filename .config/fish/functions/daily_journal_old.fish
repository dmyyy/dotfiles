# creates daily journal (if file doesn't exist) and prints path
function daily_journal
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
            echo ===
            echo
            echo "## TODO:"
            echo
            echo "[ ] -"
            echo
            echo "## Aha! Moments"
            echo
            echo "## Moments of Inspiration"
            echo
            echo "_The rational mind is a servant. The intuitive mind is a sacred gift._"
            echo
            echo ---
            echo
            echo "## Journal"
            echo
            echo "How is it going?"
            echo
            echo ---
            echo
            echo "## Reflection"
            echo
            echo "What am I..."
            echo
            echo "- grateful for"
            echo "- proud of"
            echo "- excited about"
            echo "- avoiding"
            echo "- going to do tomorrow"
            echo
            echo ===
            echo
            echo "[[index]]"
            echo "[[roguelite-index]]"
        end >"$FILE_PATH"

        # Export a universal path for today's journal
        set -U DAILY_JOURNAL "$FILE_PATH"
    end

    echo $DAILY_JOURNAL
end
