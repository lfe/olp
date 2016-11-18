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
* [Updating](#updating-)
* [License](#license-)


## Introduction [&#x219F;](#contents)

OLP is the Open LFE Platform, an OTP-style release build of LFE and supported
community libraries, packaged together in the same way that the Erlang Runtime
System and various Erlang libraries are packaged together.

HC SVNT DRACONES: This is an experimental work in progres. The ticket that
is tracking this work at a high-level from the LFE perspective is here:
 * https://github.com/rvirding/lfe/issues/300
 
The ticket that is tracking the lower-level tasks of this particular avenue
for exploration (e.g., OLP and git submodules) is here:
 * https://github.com/lfe/olp/issues/1


## Dependencies [&#x219F;](#contents)

* Erlang
* `git`
* `rebar`
* `relx`
* `make`


## Build Steps [&#x219F;](#contents)

1. Clone the repo: `git clone git@github.com:lfe/olp.git`
1. Pull down the submodules: `make sources`


## Updating [&#x219F;](#contents)

If you already have an OLP repo set up with LFE and libraries pulled down, but
you want to bring in the latest changes (i.e., update the submodules), you can
run this target:

```
$ make update-sources
```

## License [&#x219F;](#contents)

Apache Version 2 License

Copyright (c) 2016 Robert Virding


<!-- Named page links below: /-->

[logo]: resources/images/hic-sunt-dracons-interior-2-small.jpg
[logo-large]: resources/images/hic-sunt-dracons-interior-2.jpg
[org]: https://github.com/lfe
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
