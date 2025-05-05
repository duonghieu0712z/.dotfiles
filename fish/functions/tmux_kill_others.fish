function tmux_kill_others -d "Kill all other tmux sessions"
    set -l keep (string trim -- (string join -- '' $argv))
    if test -z "$keep"
        set keep work
    end

    for s in (tmux ls 2>/dev/null | cut -d: -f1)
        if test "$s" != "$keep"
            tmux kill-session -t $s
        end
    end
end
