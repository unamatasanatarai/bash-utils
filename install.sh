#!/usr/bin/env bash

target=${XDG_BIN_HOME:-"$HOME/.local/bin"}

dir=${BASH_SOURCE[0]}
dir=${dir%/*}

if [[ $dir == "$dir" ]]; then
    dir=.
fi

if [[ ! -d $target ]]; then
    mkdir -p -- "$target"
    if [[ $? -ne 0 ]]; then
        printf 'Failed to create directory: %s\n' "$target" >&2
        exit 1
    fi
fi

for file in "$dir"/src/*; do
    [[ -f $file ]] || continue

    name=${file##*/}

    install -m 755 -- "$file" "$target/$name"
    if [[ $? -ne 0 ]]; then
        printf 'Failed to install: %s\n' "$name" >&2
        exit 1
    fi

    printf 'Installed: %s\n' "$name"
done

case :$PATH: in
    *:"$target":*)
        ;;
    *)
        printf '\nWARNING: %s is not in PATH\n' "$target" >&2
        printf 'Add this to your shell config:\n' >&2
        printf 'export PATH="%s:$PATH"\n' "$target" >&2
        exit 2
        ;;
esac
