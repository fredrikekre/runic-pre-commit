#!/usr/bin/env julia

using Runic
argv = String[]
append!(argv, ARGS)
exit(Runic.main(argv))
