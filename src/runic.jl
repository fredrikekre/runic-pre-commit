using Runic
argv = String["--quiet", "--inplace"]
append!(argv, ARGS)
exit(Runic.main(argv))
