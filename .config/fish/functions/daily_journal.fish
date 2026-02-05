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
        # Find the most recent entry
        set -l PREV_ENTRY (
            find "$DAILY_NOTES" -type f \
                -regex '.*/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\.md' \
                ! -name "$FILE_NAME" \
                2>/dev/null | sort | tail -n 1
        )

        # Extract unfinished todo items ([ ] ...) from previous entry
        set -l PREV_TODOS
        if test -n "$PREV_ENTRY"
            set -l IN_TODO 0
            for line in (cat "$PREV_ENTRY")
                if test "$line" = "## TODO:"
                    set IN_TODO 1
                    continue
                end
                if test $IN_TODO -eq 1
                    if string match -qr '^##\s' -- "$line"
                        set IN_TODO 0
                        continue
                    end
                    if string match -qr '^\[ \]\s*-' -- "$line"
                        set -a PREV_TODOS "$line"
                    end
                end
            end
        end

        touch "$FILE_PATH"
        begin
            echo "# $TODAY"
            echo
            echo ===
            echo
            echo "## TODO:"
            echo
            if test (count $PREV_TODOS) -gt 0
                for t in $PREV_TODOS
                    echo "$t"
                end
            else
                echo "[ ] -"
            end
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
            echo "- intentions for tomorrow"
            echo
            echo ===
            echo
            echo "[[index]]"
            echo "[[roguelite-index]]"
        end >"$FILE_PATH"

        # Export a universal path for today's journal (makes script idempotent if run mutliple times in a day)
        set -U DAILY_JOURNAL "$FILE_PATH"
    end

    echo $DAILY_JOURNAL
end
