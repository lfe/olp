# LFE/OLP

[![Build Status][travis badge]][travis]
[![LFE Versions][lfe badge]][lfe]
[![Erlang Versions][erlang badge]][versions]
[![Tags][github tags badge]][github tags]

*Open LFE Platform*

[![OLP project logo][logo]][logo-large]


#### Contents

* [Introduction](#introduction-)
* [Dependencies](#dependencies-)
* [Build Steps](#build-steps-)
* [Docker](#docker-)
* [For LFE/OLP Application Developers](#for-lfeolp-application-developers-)
* [For OLP Matinainers](#for-olp-maintainers-)
  * [References](#references-)
  * [Adding New Libs](#adding-new-libs-)
  * [Updating Libs](#updating-libs-)
* [License](#license-)


## HC SVNT DRACONES [&#x219F;](#contents)

[![Here There Be Dragons][here there be dragons]][here there be dragons large]

WARNING: This is an experimental work in progress. The functionality offered 
by this codebase in creating an OLP release is base-bones, and only just
in its first stages (also: no docs yet!)

**LFE Upstream**: The ticket that is tracking this work at a high-level from 
the LFE perspective is here:

 * https://github.com/rvirding/lfe/issues/300


**The OLP Project**: The ticket that is tracking the tasks for getting an
OLP release created is here:

 * https://github.com/lfe/olp/issues/1

There is also a Scrum-like project board here:

 * https://github.com/lfe/olp/projects/1


## Introduction [&#x219F;](#contents)

OLP is the Open LFE Platform, an OTP-style release build of LFE and supported
community libraries, packaged together in the same way that the Erlang Runtime
System and various Erlang libraries are packaged together.


## Dependencies [&#x219F;](#contents)

* Erlang
* `git`
* `rebar`
* `relx`
* `make`


## Build Steps [&#x219F;](#contents)

Preparation:

1. Clone the repo: `git clone git@github.com:lfe/olp.git`
1. Change directory to the `olp` dir: `cd olp`


Automated build:

1. Build: `make`


If you would prefer to execute the steps manually, they are as follows:

1. `git submodule init`
1. `git submodule update`
1. `rebar3 release`

Or, if you want to create a tarball to ship:

1. `rebar3 tar`

Note that if using the `tar` command, you don't need to run the `release`
command.


## Docker [&#x219F;](#contents)

There is also a [Docker option for LFE/OLP][docker olp], currently built on Ubuntu 16.04:

```
$ docker pull lfex/olp
```

Running an LFE REPL in a dockerized OLP release:

```
$ docker run -it lfex/olp
```

Size comparison of Docker images:

 * Ubuntu 16.04, raw:       127.2 MB
 * LFE/OLP, openssl:        191.6 MB
 * LFE, build tools, etc.:  879.6 MB


## For LFE/OLP Application Developers [&#x219F;](#contents)

There's noting to see here, yet :-) (The corageous may use OLP, but please see the map above and the reference to dragons and their whereabouts).

If you are a developer interested in what you will be able to do with OLP in the future, the following tickets may be of interest to you:
 
 * [Examine Release Use Cases](https://github.com/lfe/olp/issues/36)
 * [rovide Multuple Means of OLP Installation](https://github.com/lfe/olp/issues/37)
 * [tandardize Release Documentation](https://github.com/lfe/olp/issues/28)

Once those tickets are completed, we'll have more useful information to put in this section of the `README` :-)


## For OLP Maintainers [&#x219F;](#contents)


### References [&#x219F;](#contents)

* https://www.rebar3.org/docs/releases
* https://github.com/erlware/relx/wiki/Configuration


### Adding New Libs [&#x219F;](#contents)

Assuming that the library you want to add is in the [LFEX Github org][lfex org], the
following will add the lib as a git submodule to this project:

```
$ OLP_LIB=mylib make add-lib
```

That make target will also commit the submodule change to the repo.


### Updating Libs [&#x219F;](#contents)

If you already have an OLP working directory set up with LFE and libraries
pulled down, but you want to bring in the latest changes (i.e., update the
submodules), you can run this target:

```
$ make update-sources
```


## License [&#x219F;](#contents)

Apache Version 2 License

Copyright (c) 2016 Robert Virding


<!-- Named page links below: /-->

[logo]: priv/images/logo.png
[logo-large]: priv/images/logo-large.png
[here there be dragons]: priv/images/hic-sunt-dracons-interior-2-small.jpg
[here there be dragons large]: priv/images/hic-sunt-dracons-interior-2.jpg
[lfe org]: https://github.com/lfe
[lfex org]: https://github.com/lfex
[github]: https://github.com/lfe/olp
[gitlab]: https://gitlab.com/lfe/olp
[travis]: https://travis-ci.org/lfe/olp
[travis badge]: https://img.shields.io/travis/lfe/olp.svg
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.2.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-R15%20to%2019.1-blue.svg
[versions]: https://github.com/lfe/olp/blob/master/.travis.yml
[github tags]: https://github.com/lfe/olp/tags
[github tags badge]: https://img.shields.io/github/tag/lfe/olp.svg
[github downloads]: https://img.shields.io/github/downloads/lfe/olp/total.svg
[docker olp]: https://hub.docker.com/r/lfex/olp/
