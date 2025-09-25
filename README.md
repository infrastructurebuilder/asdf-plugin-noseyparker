<div align="center">

# asdf-noseyparker [![Build](https://github.com/infrastructurebuilder/asdf-noseyparker/actions/workflows/build.yml/badge.svg)](https://github.com/infrastructurebuilder/asdf-noseyparker/actions/workflows/build.yml) [![Lint](https://github.com/infrastructurebuilder/asdf-noseyparker/actions/workflows/lint.yml/badge.svg)](https://github.com/infrastructurebuilder/asdf-noseyparker/actions/workflows/lint.yml)

[noseyparker](https://github.com/praetorian-inc/noseyparker) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add noseyparker
# or
asdf plugin add noseyparker https://github.com/infrastructurebuilder/asdf-noseyparker.git
```

noseyparker:

```shell
# Show all installable versions
asdf list-all noseyparker

# Install specific version
asdf install noseyparker latest

# Set a version globally (on your ~/.tool-versions file)
asdf global noseyparker latest

# Now noseyparker commands are available
noseyparker --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/infrastructurebuilder/asdf-noseyparker/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Mykel Alvis](https://github.com/infrastructurebuilder/)
