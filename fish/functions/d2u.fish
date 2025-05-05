function d2u -d "Convert all files in a folder from CRLF to LF"
    if test (count $argv) -eq 0
        echo "Usage: d2u <directory>"
        return 1
    end

    set -l target (realpath $argv[1])

    if not test -d $target
        echo "Error: '$target' is not a valid directory"
        return 1
    end

    echo "Converting all files under $target to Unix line endings..."

    find $target -type f -print0 | xargs -0 dos2unix --

    echo "Done."
end
