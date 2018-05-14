defmodule BlockViewer do

  alias BlockViewer.Model.Block
  alias BlockViewer.Parser.BlockParser
  alias BlockViewer.Formatter.BlockFormatter

  @moduledoc """
  Documentation for BlockViewer.
  """
  def main([]) do
    IO.puts("Please provide a hash you want query")
  end

  def main(args) do
    args
    |> List.first
    |> get_block_info
    |> pick_top_five_txns
    |> format_block
    |> IO.puts
  end

  defp get_block_info(hash) do
    url_for(hash)
    |> HTTPoison.get
    |> parse_response
  end

  defp pick_top_five_txns(block) do
    %Block{txns: txns} = block

    %{block | txns: Enum.take(txns, 5)}
  end

  defp format_block(block) do
    BlockFormatter.format(block)
  end

  defp url_for(hash) do
    "https://webbtc.com/block/#{hash}.bin"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> BlockParser.parse
  end

  defp parse_response(_) do
    :error
  end
end

