defmodule BlockViewer.Formatter.BlockFormatter do
  alias BlockViewer.Model.Block

  alias BlockViewer.Formatter.TxnFormatter
  alias BlockViewer.Formatter.BinaryFormatter

  def format(%Block{version: version, previous_block: previous_block, merkle_root: merkle_root, timestamp: timestamp, bits: bits, nonce: nonce, txn_count: txn_count, txns: txns}) do

    ~s"""
    Version: #{version}
    Previous Block: #{BinaryFormatter.format(previous_block)}
    Merkle Root: #{BinaryFormatter.format(merkle_root)}
    Timestamp: #{timestamp}
    Bits: #{bits}
    Nonce: #{nonce}
    Txn Count: #{txn_count}
    Txns:
         #{format_txns(txns)}
    """
  end

  defp format_txns(txns) do
    Enum.map_join(txns, "\n", fn(x) -> TxnFormatter.format(x) end)
  end
end

