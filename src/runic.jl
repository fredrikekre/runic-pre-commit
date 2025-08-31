#!/usr/bin/env julia

using Runic

# Get the list of files passed to the hook
files = ARGS

# Run Runic with --inplace --diff
argv = String["--inplace", "--diff"]
append!(argv, files)
exit_code = Runic.main(argv)

# If Runic succeeded, re-stage any files that were modified
if exit_code == 0
    for file in files
        # Check if this file has unstaged changes (was modified by Runic)
        # Use git diff --name-only to check if file has unstaged changes
        result = readlines(`git diff --name-only -- $file`)
        if !isempty(result) && file in result
            # File was modified by Runic and has unstaged changes, re-stage it
            # Since pre-commit only passes staged files to hooks, we know this file
            # was originally staged and should be re-staged with the formatting changes
            run(`git add $file`)
        end
    end
end

# Always exit with the same code Runic returned
exit(exit_code)
