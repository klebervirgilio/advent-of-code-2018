defmodule Day1 do
  @moduledoc """
  Day 1: Chronal Calibration
  """

  def calibrate(lines) do
    String.split(lines, "\n", trim: true)
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {n, _} -> n end)
      |> Enum.sum
  end

  def calibrate2(lines) do
    Process.put(:seen, MapSet.new)
    String.split(lines, "\n", trim: true)
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {n, _} -> n end)
      |> Stream.cycle
      |> Enum.reduce_while(0, fn(n, acc) ->
        sum = acc + n
        seen = Process.get(:seen)
        if MapSet.member?(seen, sum) do
          {:halt, sum}
        else
          Process.put(:seen, MapSet.put(seen, sum))
          {:cont, sum}
        end
      end)
  end
end
