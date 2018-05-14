defmodule BlockViewer.Formatter.TxnInputFormatter do
  alias BlockViewer.Model.TxnInput

  alias BlockViewer.Formatter.OutpointFormatter
  alias BlockViewer.Formatter.BinaryFormatter

  def format(%TxnInput{previous_output: previous_output, script_length: script_length, signature_script: signature_script, sequence: sequence}) do
    ~s"""
    Previous Output: #{OutpointFormatter.format(previous_output)}
    Script Length: #{script_length}
    Signature Script: #{BinaryFormatter.format(signature_script)}
    Sequence: #{sequence}
    """
  end
end

