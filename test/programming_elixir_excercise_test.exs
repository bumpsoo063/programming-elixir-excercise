defmodule ProgrammingElixirExcerciseTest do
  use ExUnit.Case
  doctest ProgrammingElixirExcercise

  test "greets the world" do
    assert ProgrammingElixirExcercise.hello() == :world
  end
end
