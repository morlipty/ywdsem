#music
alias musicsampleratecheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate,bit_depth -of csv=p=0 {} \; | sort | uniq -c'
alias musicalbumartrescheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 {} \; | sort | uniq -c'
