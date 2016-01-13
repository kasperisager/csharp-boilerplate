# C# Boilerplate

> Cross-platform [DNX](https://github.com/aspnet/dnx)-based C# boilerplate configured with [xUnit](https://github.com/xunit/xunit).

[![Travis](https://img.shields.io/travis/kasperisager/csharp-boilerplate.svg)](https://travis-ci.org/kasperisager/csharp-boilerplate)

## Legend

Folder / File | Description
--- | ---
[`src/`](src) | This folder contains all the source code for your project.
[`src/Application/Program.cs`](src/Application/Program.cs) | This class is the main entry point to your application and its `Main()` method will be executed when the application is run.
[`src/Application/project.json`](src/Application/project.json) | This file is the manifest for your application and defines meta data as well as package and framework dependencies.
[`test/`](test) | This folder contains all the test specifications for your project.
[`test/Application.Test/project.json`](test/Application.Test/project.json) | This is the manifest for your test specification and works exactly like the application manifest.
[`lib/`](lib) | This folder contains any third-party libraries not available via the package manager.
[`build/`](build) | This folder contains all the built assemblies from your applications and test specifications.
[`packages/`](packages) | This folder contains all packages installed by the package manager.
[`.editorconfig`](.editorconfig) | This file describes the editor formatting settings to be used in editors and IDEs.
[`Makefile`](Makefile) | This file describes all the build system targets available for your project.
[`global.json`](global.json) | This file is the global project manifest and defines the different project sources and runtime frameworks.

## Requirements

- [DNVM](https://github.com/aspnet/dnvm) - .NET SDK Manager

## Installation

### OS X

> Official instructions: http://docs.asp.net/en/latest/getting-started/installing-on-mac.html

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

> Official instructions: http://docs.asp.net/en/latest/getting-started/installing-on-linux.html

The easiest way to get started with the boilerplate on Linux is using Docker: http://blogs.msdn.com/b/webdev/archive/2015/01/14/running-asp-net-5-applications-in-linux-containers-with-docker.aspx. You can also go to the official installation instructions for a guide on how to install DNVM manually.

### Windows

> Official instructions: http://docs.asp.net/en/latest/getting-started/installing-on-windows.html

To get started on Windows you need to install the latest preview of Visual Studio 2015. This will also install [DNVM](https://github.com/aspnet/dnvm) and the associated executables.

## Building

The boilerplate includes a [Makefile](Makefile) for performing some common operations on the project source using the different binaries available in [DNVM](https://github.com/aspnet/dnvm). While you're absolutely free to ditch the build system and simply use binaries like `dnx` and `dnu` manually, it is recommended that you stick to the build system for the sake of consistency.

> :warning: __OBS__: Windows users must install something similar to [MinGW](http://www.mingw.org/) in order to use `make`.

### Targets

```sh
make [target]
```

__`packages`__ - Install required [NuGet](https://www.nuget.org/) packages using [DNU](https://github.com/aspnet/Home/wiki/DNX-utility).

__`build`__ - Build assemblies for applications and test specifications using [DNU](https://github.com/aspnet/Home/wiki/DNX-utility).

__`run`__ - Run applications using [DNX](https://github.com/aspnet/dnx).

__`test`__ - Run test specifications using [DNX](https://github.com/aspnet/dnx) and [xUnit](http://xunit.github.io/).

---

Copyright &copy; 2015 [Kasper Kronborg Isager](https://github.com/kasperisager). Licensed under the terms of the [MIT license](LICENSE.md).
