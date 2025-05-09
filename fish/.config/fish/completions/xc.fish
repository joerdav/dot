
function __complete_xc
    set -lx COMP_POINT (commandline -C)
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /Users/josephdavidson/go/bin/xc
end
complete -f -c xc -a "(__complete_xc)"

