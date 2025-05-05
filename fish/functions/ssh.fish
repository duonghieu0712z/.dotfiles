function ssh-sw -d "Switch SSH key"
    set -l default_key ~/.ssh/id_ed25519
    set -l keyfile

    if test (count $argv) -gt 0
        set keyfile ~/.ssh/$argv[1]
    else
        set keyfile $default_key
    end

    if not test -f $keyfile
        echo "SSH key file '$keyfile' not found."
        return 1
    end

    ssh-add -D
    ssh-add --apple-use-keychain $keyfile
    ssh-add -l
end
