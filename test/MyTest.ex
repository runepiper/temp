defmodule MyTest do
  use ExUnit.Case, async: true

  setup do
    # run some setup code
  end

  test "pass" do
    assert true
  end

  test "fail" do
    assert false
  end
end