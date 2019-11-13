import unittest
import libjq

test "diag":
  let json = "[]"
  var jq_state = libjq.jq_init()
  check true == true