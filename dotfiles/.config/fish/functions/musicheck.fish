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

    # --- scan ---
    set -l files (fd --extension flac . ~/Music)
    set -l total (count $files)
    set -l i 0

    for file in $files
        set i (math $i + 1)
        printf "\rScanning %d/%d" $i $total >&2

        set -l result (ffprobe -v error -select_streams $stream \
            -show_entries $entries -of csv=p=0 $file)

        if test -z "$result"
            echo MISSING
        else
            echo $result
        end
    end | sort | uniq -c | sort -rn

    echo >&2
end
