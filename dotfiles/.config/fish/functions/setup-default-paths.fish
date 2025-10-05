function setup-default-paths
    set -l default_paths \
        ~/.local/bin

    set -q fish_user_paths; or set -U fish_user_paths

    set -l added_any false

    for p in $default_paths
        set -l expanded_path (string replace '~' "$HOME" -- $p)
        
        if not contains $expanded_path $fish_user_paths
            set -Ua fish_user_paths $expanded_path
            echo "Added to PATH: $expanded_path"
            set added_any true
        end
    end

    if test $added_any = false
        echo "All default paths already configured."
    else
        echo "Default paths updated! Run 'source ~/.config/fish/config.fish' or open a new terminal to see changes."
    end
end
