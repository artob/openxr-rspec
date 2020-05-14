Unofficial OpenXR Tests
=======================

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![Ruby compatibility](https://img.shields.io/badge/ruby-2.7%2B-blue)](https://rubygems.org/gems/openxr)

This is an unofficial conformance test suite for [OpenXR](https://www.khronos.org/openxr/)
[1.0](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html),
the open standard and cross-platform API for virtual reality (VR) and augmented
reality (AR) hardware.

Prerequisites
-------------

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

1. Make sure that the OpenXR loader (`libopenxr_loader.so` on Linux,
   `libopenxr_loader.dylib` on macOS) can be found.

   The best way to guarantee that is to symlink the shared object into the
   current working directory:

       $ ln -s /path/to/libopenxr_loader.so libopenxr_loader.so

   Alternatively, you can set `LD_LIBRARY_PATH` (Linux) or
   `DYLD_LIBRARY_PATH` (macOS).

2. To run the whole test suite, just execute RSpec:

       $ rspec

3. To run a specific set of tests, use the `--pattern` argument with either
   a filename or a wildcard:

       $ rspec --pattern spec/api/xrCreateInstance.rb

       $ rspec --pattern spec/api/xr*ToString.rb
