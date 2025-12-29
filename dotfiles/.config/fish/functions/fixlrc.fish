function fixlrc
    set -l pat '^[[:space:]]*\[(ar|by|al|ti|offset|re|ve|length):.*\][[:space:]]*$'

    echo "Files that WOULD be changed:"
    fd -e lrc -x rg -l -i $pat
    echo

    echo "Matching lines (preview):"
    fd -e lrc -x rg -n -i $pat
    echo

    read -P "Apply deletion? (y/N) " ans
    if test "$ans" = y; or test "$ans" = Y
        fd -e lrc -x sed -i '/^[[:space:]]*\[\(ar\|by\|al\|ti\|offset\|re\|ve\|length\):.*\][[:space:]]*$/Id'
        echo "Done."
    else
        echo "Cancelled."
    end
end
