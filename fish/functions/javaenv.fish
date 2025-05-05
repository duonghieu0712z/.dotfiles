function javaenv -d "Get java environment"
    if test (count $argv) -eq 0
        /usr/libexec/java_home -V
        return
    end

    switch $argv[1]
        case ls
            /usr/libexec/java_home -V

        case set
            if test (count $argv) -lt 2
                echo "Usage: javaenv set <version>"
                return 1
            end

            set -l java_path (/usr/libexec/java_home -v $argv[2] 2>/dev/null)
            if test -z "$java_path"
                echo "Java version $argv[2] not found."
                return 1
            end
            set -gx JAVA_HOME $java_path
            echo "JAVA_HOME set to $java_path"

        case -h --help help
            echo "Usage: javaenv [ls|set <version>]"
            echo "  javaenv                 # list all installed JDKs"
            echo "  javaenv ls              # same as above"
            echo "  javaenv set <version>   # set JAVA_HOME to the specified version"
            echo "  javaenv help | -h | --help       # print help information"

        case '*'
            echo "Unknown command: $argv[1]"
            echo "Usage: javaenv [ls|set <version>]"
            echo "Or use 'javaenv -h' for help"
            return 1
    end
end
