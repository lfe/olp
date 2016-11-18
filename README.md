# LFE/OLP

OLP is the Open LFE Platform, an OTP-style release build of LFE and supported
community libraries, packaged together in the same way that the Erlang Runtime
System and various Erlang libraries are packaged together.

HERE THERE BE DRAGONS: This is an experimental work in progres. The ticket that
is tracking this work at a high-level from the LFE perspective is here:
 * https://github.com/rvirding/lfe/issues/300
 
The ticket that is tracking the lower-level tasks of this particular avenue
for exploration (e.g., OLP and git submodules) is here:
 * https://github.com/lfe/olp/issues/1

## Build Steps

1. Clone the repo: `git clone git@github.com:lfe/olp.git`
1. Pull down the submodules: `make sources`

## Updating

If you have already an OLP repo set up with LFE and libraries pulled down, but
you want to bring in the latest changes (i.e., update the submodules), you can
run this target:

```
$ make update-sources
```
