defmodule BlockViewer.Formatter.TxnFormatter do
  alias BlockViewer.Model.Txn

  alias BlockViewer.Formatter.TxnInputFormatter
  alias BlockViewer.Formatter.TxnOutputFormatter

  def format(%Txn{version: version, inputs: inputs, outputs: outputs, lock_time: lock_time}) do
    ~s"""
    Version: #{version}
    Inputs:
         #{format_inputs(inputs)}
    Outputs:
         #{format_outputs(outputs)}
    Lock Time: #{lock_time}
    """
  end

  defp format_inputs(inputs) do
    Enum.map_join(inputs, "\n", fn(x) -> TxnInputFormatter.format(x) end)
  end

  defp format_outputs(outputs) do
    Enum.map_join(outputs, "\n", fn(x) -> TxnOutputFormatter.format(x) end)
  end
end

