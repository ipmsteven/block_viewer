defmodule BlockViewer.Model.Txn do
  defstruct [ :version,
              :inputs,
              :outputs,
              :lock_time]
end

