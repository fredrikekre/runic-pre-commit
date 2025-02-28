#!/usr/bin/env julia

using Runic
argv = String["--inplace", "--diff"]
append!(argv, ARGS)
exit(Runic.main(argv))
