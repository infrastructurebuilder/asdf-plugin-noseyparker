# Contributing

Testing Locally:

```shell
# asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# Like this
asdf plugin test noseyparker https://github.com/infrastructurebuilder/asdf-plugin-noseyparker.git --asdf-tool-version=0.23.0 "noseyparker --version"
```

Tests are automatically run in GitHub Actions on push and PR.
