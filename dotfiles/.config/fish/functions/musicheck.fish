function musicheck --description "Summarize audio or art properties of FLAC files"
    argparse h/help a/audio r/art -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: musicheck (--audio | --art)"
        return 0
    end

    # --- pick mode ---
    set -l stream
    set -l entries

    if set -q _flag_audio
        set stream a:0
        set entries stream=sample_rate,bit_depth
    else if set -q _flag_art
        set stream v:0
        set entries stream=width,height
    else
        echo "musicheck: specify --audio or --art" >&2
        return 1
    end

    # --- parallel scan with fd -x ---
    fd --extension flac . ~/Music -x fish -c '
    set r (ffprobe -v error -select_streams $argv[1] -show_entries $argv[2] -of csv=p=0 $argv[3] 2>/dev/null)
    if test -z "$r"
        echo MISSING
    else
        echo "$r"
    end
' $stream $entries {} | sort | uniq -c | sort -rn
end
