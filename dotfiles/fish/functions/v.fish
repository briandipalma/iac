function v
    # Clear down so Java LSP server uses Java 21 not Java 11
    set -e JAVA_HOME
    nvim $argv
end
