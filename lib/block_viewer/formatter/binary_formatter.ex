defmodule BlockViewer.Formatter.BinaryFormatter do
  def format(binary) do
    binary
    |> :erlang.binary_to_list
    |> Enum.map(fn(x) -> Integer.to_string(x, 16) end)
    |> Enum.map(fn(x) -> String.pad_leading(x, 2, "0") end)
    |> Enum.join("")
  end
end

