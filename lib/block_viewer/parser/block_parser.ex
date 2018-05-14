defmodule BlockViewer.Parser.BlockParser do
  alias BlockViewer.Model.Block

  alias BlockViewer.Parser.TxnsParser
  alias BlockViewer.Parser.VariableSizePayloadParser

  def parse(block, varialbe_size_payload_parser \\ VariableSizePayloadParser, txns_parser \\ TxnsParser) when is_binary(block) do
    << version         :: little-integer-size(32),
        previous_block :: bytes-size(32),
        merkle_root    :: bytes-size(32),
        timestamp      :: unsigned-little-integer-size(32),
        bits           :: unsigned-little-integer-size(32),
        nonce          :: unsigned-little-integer-size(32),
        rest           :: binary >> = block

    [txn_count, txns_payload] = varialbe_size_payload_parser.parse_stream(rest)

    %Block{version: version,
      previous_block: previous_block,
      merkle_root: merkle_root,
      timestamp: timestamp,
      bits: bits,
      nonce: nonce,
      txn_count: txn_count,
      txns: txns_parser.parse(txns_payload)
    }
  end
end
