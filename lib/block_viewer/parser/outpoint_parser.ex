defmodule BlockViewer.Parser.OutpointParser do
  alias BlockViewer.Model.Outpoint

  def parse_stream(stream) do
    << hash   :: bytes-size(32),
      index   :: unsigned-little-integer-size(32),
      payload :: binary >> = stream

    [%Outpoint{ hash: hash, index: index }, payload]
  end
end

