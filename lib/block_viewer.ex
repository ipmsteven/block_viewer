defmodule BlockViewer do
  alias BlockViewer.Model.Block
  alias BlockViewer.Parser.BlockParser
  alias BlockViewer.CLI.ArgsParser
  alias BlockViewer.Requester.BlockHttpRequester
  alias BlockViewer.Formatter.BlockFormatter

  def main(args) do
    with {:ok, data} <- parse_args(args),
	 {:ok, data} <- get_raw_block_info(data),
	 {:ok, data} <- parse_raw_block_info(data),
	 {:ok, data} <- pick_top_five_txns(data),
	 {:ok, data} <- format_block(data)
    do
      IO.puts data
    else
      {:error, error} -> IO.puts "#{error}"
    end
  end

  defp parse_args(args) do
    args |> ArgsParser.parse
  end

  defp get_raw_block_info(hash) do
    url = "https://webbtc.com/block/#{hash}.bin"
    url |> BlockHttpRequester.fetch
  end

  defp parse_raw_block_info(block) do
    block |> BlockParser.parse
  end

  defp pick_top_five_txns(block) do
    %Block{txns: txns} = block
    {:ok, %{block | txns: Enum.take(txns, 5)}}
  end

  defp format_block(block) do
    {:ok, BlockFormatter.format(block)}
  end
end

