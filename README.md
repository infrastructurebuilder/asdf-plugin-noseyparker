<div align="center">

# asdf-plugin-noseyparker [![Build](https://github.com/infrastructurebuilder/asdf-plugin-noseyparker/actions/workflows/build.yml/badge.svg)](https://github.com/infrastructurebuilder/asdf-plugin-noseyparker/actions/workflows/build.yml) [![Lint](https://github.com/infrastructurebuilder/asdf-plugin-noseyparker/actions/workflows/lint.yml/badge.svg)](https://github.com/infrastructurebuilder/asdf-plugin-noseyparker/actions/workflows/lint.yml)

[noseyparker](https://github.com/praetorian-inc/noseyparker) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-plugin-noseyparker  ](#asdf-plugin-noseyparker--)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
  - [noseyparker](#noseyparker)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- [Git](https://git-scm.com) (for installing from git)
- `shfmt` and `shellcheck` (for contributing)
-
# Install

Plugin:

```shell
asdf plugin add noseyparker https://github.com/infrastructurebuilder/asdf-plugin-noseyparker.git
```

## noseyparker

```shell
# Show all installable versions
asdf list-all noseyparker

# Install latest version
asdf install noseyparker latest

# Install specific version
asdf install noseyparker 0.23.0

# Set a version globally (on your ~/.tool-versions file)
asdf global noseyparker latest

# Now noseyparker commands are available
noseyparker --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/infrastructurebuilder/asdf-plugin-noseyparker/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Mykel Alvis](https://github.com/infrastructurebuilder/)
