# C# Boilerplate

## Legend

Folder / File | Description
--- | ---
[`src/`](src) |
[`src/Application/Program.cs`](src/Application/Program.cs) |
[`src/Application/project.json`](src/Application/project.json) |
[`test/`](test) |
[`test/Application.Test/project.json`](test/Application.Test/project.json) |
[`lib/`](lib) |
[`build/`](build) |
[`packages/`](packages) |
[`config/`](config) |
[`config/Doxyfile`](config/Doxyfile) |
[`config/Gendarme.xml`](config/Gendarme.xml) |
[`.editorconfig`](.editorconfig) |
[`Makefile`](Makefile) |
[`global.json`](global.json) |

## Requirements

- [DNVM](https://github.com/aspnet/dnvm) - .NET SDK Manager

## Installation

### OS X

First off, make sure you have [Homebrew](http://brew.sh/) installed. Then install the following packages:

```sh
$ brew install mono
$ brew install aspnet/dnx/dnvm
```

Finally, add the following line to your Shell profile (`~/.bash_profile`, `~/.zshrc`, etc.):

```sh
source dnvm.sh
```

### Linux

> TODO

### Windows

> TODO

## Building

> Windows users must install something similar to [MinGW](http://www.mingw.org/http://www.mingw.org/) in order to use `make`.

### Targets

```sh
make [target]
```

#### `packages`

Install required [NuGet](https://www.nuget.org/) packages using [DNU](https://github.com/aspnet/Home/wiki/DNX-utility).

#### `build`

Build assemblies for applications and test specifications using [DNU](https://github.com/aspnet/Home/wiki/DNX-utility).

#### `docs`

Generate API documentation using [Doxygen](http://www.stack.nl/~dimitri/doxygen/).

#### `run`

Run applications using [DNX](https://github.com/aspnet/dnx).

#### `test`

Run test specifications using [DNX](https://github.com/aspnet/dnx).

#### `check`

Run static code analysis on built assemblies using [Gendarme](http://www.mono-project.com/docs/tools+libraries/tools/gendarme/).

---

Copyright &copy; 2015 [Kasper Kronborg Isager](https://github.com/kasperisager). Licensed under the terms of the [MIT license](LICENSE.md).
