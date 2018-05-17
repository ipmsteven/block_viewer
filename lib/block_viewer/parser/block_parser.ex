defmodule BlockViewer.Parser.BlockParser do
  alias BlockViewer.Model.Block

  alias BlockViewer.Parser.TxnsParser
  alias BlockViewer.Parser.VariableSizePayloadParser

  def parse(<< version       :: little-integer-size(32),
              previous_block :: bytes-size(32),
              merkle_root    :: bytes-size(32),
              timestamp      :: unsigned-little-integer-size(32),
              bits           :: unsigned-little-integer-size(32),
              nonce          :: unsigned-little-integer-size(32),
              rest           :: binary >>) do

    [txn_count, txns_payload] = VariableSizePayloadParser.parse_stream(rest)

    {:ok, %Block{version: version,
      previous_block: previous_block,
      merkle_root: merkle_root,
      timestamp: timestamp,
      bits: bits,
      nonce: nonce,
      txn_count: txn_count,
      txns: TxnsParser.parse(txns_payload)}
    }
  end

  def parse(_) do
    {:error, "Invalid Block Type"}
  end
end
