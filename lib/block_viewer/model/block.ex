defmodule BlockViewer.Model.Block do
  defstruct [ :version,
              :previous_block,
              :merkle_root,
              :timestamp,
              :bits,
              :nonce,
              :txn_count,
              :txns]
end
