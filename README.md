# runic-pre-commit

A [pre-commit](https://pre-commit.com/) hook to run the
[Runic.jl](https://github.com/fredrikekre/Runic.jl) code formatter.

## Usage

Install `pre-commit` ([installation instructions](https://pre-commit.com/#install)) and add
the following to your `.pre-commit-config.yaml` file:

```yaml
repos:
  - repo: https://github.com/fredrikekre/runic-pre-commit
    rev: v2.1.0
    hooks:
      - id: runic
```

### Configuration

#### Runic version

By default this will configure the hook to run with the latest Runic version available at
hook installation time. To explicitly configure a version of Runic you can use pre-commits
`additional_dependencies` configuration, for example to use Runic version 1.4.3:

```yaml
repos:
  - repo: https://github.com/fredrikekre/runic-pre-commit
    rev: v2.1.0
    hooks:
      - id: runic
        additional_dependencies:
          - 'Runic@1.4.3'
```

#### Runic arguments

By default `pre-commit` runs `runic` with the `--inplace` and `--diff` flags. This means
that, after pre-commit runs, files will be left modified. If you prefer running in check
mode you can override the default flags using `args`:

```yaml
repos:
  - repo: https://github.com/fredrikekre/runic-pre-commit
    rev: v2.1.0
    hooks:
      - id: runic
        args: ["--check", "--diff"]
```


> [!NOTE]
> The current version (v2.0.0 and above) of this repository make use of Julia
> language hooks which require pre-commit version 4.1.0 or later. If you cannot
> upgrade pre-commit you can use version v1.0.0 of this repository instead.
