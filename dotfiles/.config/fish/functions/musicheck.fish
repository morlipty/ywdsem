function musicheck
  set mode "audio"

  for arg in $argv
    switch $arg
      case "--audio"
        fd --extension flac . ~/Music --print0 |
        parallel -0 ffprobe -v error -select_streams a:0 \
            -show_entries stream=sample_rate,bit_depth \
            -of csv=p=0 {} |
        sort | uniq -c
      case "--art"
        fd --extension flac . ~/Music --print0 |
        parallel -0 ffprobe -v error -select_streams v:0 \
            -show_entries stream=width,height \
            -of csv=p=0 {} |
        sort | uniq -c
      case "*"
        echo "Unknown option: $arg"
        return 1
    end
  end
end
