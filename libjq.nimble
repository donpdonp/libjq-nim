# Package

version       = "0.1.2"
author        = "donpdonp"
description   = "jq json tool and language bindings"
license       = "MIT"
skipDirs      = @["tests"]

# Dependencies
requires "nim >= 1.0.0"

task test, "run test app":
  if not dirExists("jq"):
    exec "git clone --depth 1 --recurse-submodules https://github.com/stedolan/jq"
    exec "cd jq && autoreconf -fi && ./configure && make libjq.la"
  exec "nim c tests/testlibjq.nim"

