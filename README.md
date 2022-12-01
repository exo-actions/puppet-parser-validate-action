# GitHub Action for Puppet Parser Validate

This Action for the [Puppet](https://puppet.com/) configuration management
system enables you to syntax check your Puppet code.

## Usage

An example workflow for syntax checking Puppet code is shown below. It will
run the `puppet parser validate` command with the path to the files you want
to test as `args`.

```yaml
name: Puppet Parser Validate

on: [push]

jobs:
  puppet-parser-validate:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: puppet-parser-validate
      uses: exoplatform/puppet-parser-validate-action@master
      with:
        args: ./
```

If you wish to use a specific version, without needing to rebuild the container
each time, you can use the version hosted on the [Docker Hub](https://hub.docker.com/r/exoplatform/puppet-parser-validate-action).

For example:

```yaml
name: Puppet Parser Validate

on: [push]

jobs:
  puppet-parser-validate:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: puppet-parser-validate
      uses: docker://exoplatform/puppet-parser-validate-action:6.0
      with:
        args: ./
```

## License

The [Dockerfile](Dockerfile) and associated scripts and documentation in this
project are released under the [MIT License](LICENSE).

Container images built with this project include third party materials. See
[THIRD_PARTY_NOTICE.md](THIRD_PARTY_NOTICE.md) for details.
