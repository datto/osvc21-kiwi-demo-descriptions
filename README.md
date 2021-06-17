# KIWI demo descriptions for oSVC21

This repository contains demonstration content for building images with the [KIWI image builder](https://osinside.github.io/kiwi)
associated with [the talk on Datto's use of KIWI](https://events.opensuse.org/conferences/oSVC21/program/proposals/3553) at the [2021 openSUSE Virtual Conference](https://events.opensuse.org/conferences/oSVC21).

The KIWI descriptions are stored in the `txz-build/` and `iso-build/` subdirectories.
Refer to the [KIWI documentation](https://osinside.github.io/kiwi/) for more details.

## Appliance build quick start

### Podman/Docker

The instructions below will use the `podman` command, but you can easily substitute for `docker`
and it should easily just work the same.

First, pull down the container of the required environment (Fedora 28 or newer).

For the instructions below, we'll work with Fedora 34.

```bash
$ sudo podman pull registry.fedoraproject.org/fedora:34
```

Assuming you're in the root directory of the Git checkout, set up the container:

```bash
$ sudo podman run --privileged --rm -it -v $PWD:/code registry.fedoraproject.org/fedora:34 /bin/bash
```

Once in the container environment, set up your development environment and run the image build (we're using the `txz-build` for this example):

```bash
# Change to the code location
[]$ cd /code
# Install kiwi
[]$ dnf --assumeyes install kiwi
# Run the image build
[]$ kiwi-ng system build --description ./txz-build --target-dir ./tmpoutput
```

## Licensing

These descriptions are licensed under the Apache Software License, version 2.0. See `LICENSE` for details.
