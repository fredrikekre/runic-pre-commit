# runic-pre-commit

A [pre-commit](https://pre-commit.com/) hook to run the
[Runic.jl](https://github.com/fredrikekre/Runic.jl) code formatter.

## Usage

Install `pre-commit` ([installation instructions](https://pre-commit.com/#install)) and add
the following to your `.pre-commit-config.yaml` file:

```yaml
repos:
-  repo: https://github.com/fredrikekre/runic-pre-commit
   rev: v1.0.0
   hooks:
    - id: runic
```

Note that currently this hook will use whatever version of Runic is installed in the
`@runic` shared environment (and fail if Runic isn't installed there). To install Runic run:

```shell
julia --project=@runic -e 'using Pkg; Pkg.add("Runic")'
```
