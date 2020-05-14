Unofficial OpenXR Tests
=======================

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![OpenXR specification](https://img.shields.io/badge/spec-1.0.8-brightgreen)](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html)
[![Ruby compatibility](https://img.shields.io/badge/ruby-2.7%2B-blue)](https://rubygems.org/gems/openxr)

This is an *unofficial* conformance test suite for [OpenXR](https://www.khronos.org/openxr/)
[1.0](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html),
the open standard and cross-platform API for virtual reality (VR) and augmented
reality (AR) hardware.

The test suite is implemented using OpenXR bindings for the popular Ruby
scripting language with requirements specified using the highly readable
[RSpec](https://rspec.info) domain-specific language for behavior-driven
development.

Status
------

There are currently tests for the following OpenXR 1.0 API functions:

| Function                                 | Notes                             |
| :--------------------------------------- | :-------------------------------- |
| `xrCreateInstance`                       | Partially implemented.            |

Prerequisites
-------------

To be able to run the test suite locally, you will need the following
software installed:

- [Ruby](https://www.ruby-lang.org/en/) 2.7+
  with [FFI](https://rubygems.org/gems/ffi)

- [RSpec](https://rubygems.org/gems/rspec) test runner

- [OpenXR.rb](https://rubygems.org/gems/openxr) bindings

### Install the prerequisites using RubyGems

    $ gem install openxr rspec

### Install the prerequisites using Bundler

    $ bundle install

Usage
-----

1. **Download a local working copy of this Git repository**, and make it
   your current working directory (all the following steps assume this):

       $ git clone https://github.com/artob/openxr-rspec.git

       $ cd openxr-rspec

2. **Make sure that the OpenXR loader can be found.**

   The shared library is named `libopenxr_loader.so` on Linux, and
   `libopenxr_loader.dylib` on macOS.

   In case the shared library isn't installed in standard system-wide
   locations, the best way to guarantee that it can be found is to symlink
   the shared object into the current working directory:

       $ ln -s /path/to/libopenxr_loader.so libopenxr_loader.so

   Alternatively, you could set `LD_LIBRARY_PATH` (on Linux) or
   `DYLD_LIBRARY_PATH` (on macOS). See the `ld.so(8)` or `dyld(1)` man
   pages, respectively.

3. **To run the whole test suite, just execute RSpec:**

       $ rspec

4. **To run only a specific set of tests, give the `--pattern` argument**
   with either a filename or a wildcard:

       $ rspec --pattern spec/api/xrCreateInstance.rb

       $ rspec --pattern spec/api/xr*ToString.rb

See Also
--------

- [OpenXR.rb](https://github.com/dryruby/openxr.rb): OpenXR bindings Ruby.

- [OpenXR.py](https://github.com/drypy/openxr.py): OpenXR bindings Python.
