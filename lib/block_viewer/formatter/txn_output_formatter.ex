defmodule BlockViewer.Formatter.TxnOutputFormatter do
  alias BlockViewer.Model.TxnOutput

  alias BlockViewer.Formatter.BinaryFormatter

  def format(%TxnOutput{value: value, pk_script_length: pk_script_length, pk_script: pk_script}) do
    ~s"""
    Value: #{value}
    PK Script Length: #{pk_script_length}
    PK Script: #{BinaryFormatter.format(pk_script)}
    """
  end
end
