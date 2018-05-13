defmodule BlockViewer do
  @moduledoc """
  Documentation for BlockViewer.
  """
  def main([]) do
    IO.puts("Please provide a hash you want query")
  end

  def main(args) do
    args
    |> List.first
    |> IO.puts
  end
end

