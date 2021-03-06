#! /bin/bash

# Defines an alias gogo that accepts files and opens them in the system's
# default application. Allows you to use a single command across multiple
# platforms.

case "`uname -s`" in
CYGWIN*)
    alias gogo='cygstart'
    ;;
Linux)
    # Even under WSL, this opens webpages in your browser and folders in
    # Windows Explorer.
    alias gogo='xdg-open'
    ;;
Darwin)
    alias gogo='open'
    #
    ;;
*)
	echo "Error in $0: Platform '`uname -s`' not supported"
    ;;
esac
