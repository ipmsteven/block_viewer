defmodule BlockViewer.Model.TxnInput do
  defstruct [ :previous_output,
              :script_length,
              :signature_script,
              :sequence]
end

