defmodule BlockViewer.Formatter.OutpointFormatter do
  alias BlockViewer.Model.Outpoint

  alias BlockViewer.Formatter.BinaryFormatter

  def format(%Outpoint{hash: hash, index: index}) do
    ~s"""
    Hash: #{BinaryFormatter.format(hash)}
    Index: #{index}
    """
  end
end

