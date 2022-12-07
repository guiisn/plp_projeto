defmodule SimuladorTest do
  use ExUnit.Case
  doctest Simulador

  test "greets the world" do
    assert Simulador.hello() == :world
  end
end
