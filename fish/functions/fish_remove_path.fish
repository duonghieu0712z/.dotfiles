function fish_remove_path -d "Remove paths from the PATH"
    set -l paths_to_remove $argv
    set -l new_paths

    for p in $fish_user_paths
        set -l should_remove 0
        for r in $paths_to_remove
            if test $p = $r
                set should_remove 1
                break
            end
        end
        if test $should_remove -eq 0
            set new_paths $new_paths $p
        end
    end

    set -U fish_user_paths $new_paths
    echo "Removed paths: $paths_to_remove"
end
