#!/usr/bin/env bash

julia --project=@runic -e 'using Runic; exit(Runic.main(ARGS))' -- --inplace --diff "$@"
