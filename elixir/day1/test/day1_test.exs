defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "calibrates the frequency part1" do
    input = """
    +1
    -2
    +3
    +1
    """

    assert Day1.calibrate(input) == 3
  end

  test "calibrates the frequency part2" do
    input = """
    +3
    +3
    +4
    -2
    -4
    """

    assert Day1.calibrate2(input) == 10
  end
end
