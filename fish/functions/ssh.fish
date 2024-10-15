function ssh-sw -d 'switch ssh key'
    switch $argv[1]
        case 'duonghieu'
            set -f key ~/.ssh/duonghieu
        case '*'
            # return
    end

    ssh-add -D
    ssh-add --apple-use-keychain $key
    ssh-add -l
end
