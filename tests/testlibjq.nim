import unittest
import libjq

test "diag":
  let json = "[]"
  var jq_state = libjq.jq_init()
  check true == true

test "jq object":
  var jqstate = jq_init()
  var jq_int = jq_compile(jqstate, ".")
  jq_start(jqstate, jv_object(), 0)
  var jvalue = jq_next(jq_state)
  var jqk = jv_get_kind(jvalue)
  assert jqk == JV_KIND_OBJECT

test "jq object get":
  var jqstate = jq_init()
  var jq_int = jq_compile(jqstate, "{\"key\":\"value\"")
  jq_start(jqstate, jv_object(), 0)
  var jvalue = jq_next(jq_state)
  var jqv = jv_object_get(jvalue, jv_string("key"))
  var v = jv_string_value(jqv)
  check v == "value"

test "jq array":
  var jqstate = jq_init()
  var jq_int = jq_compile(jqstate, "keys")
  var input = jv_parse("{}")
  jq_start(jqstate, input, 0)
  var jvalue = jq_next(jq_state)
  var jqk = jv_get_kind(jvalue)
  assert jqk == JV_KIND_ARRAY
