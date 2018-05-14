defmodule BlockViewer.Parser.VariableSizePayloadParser do

  def parse_stream(<<0xFD, size :: unsigned-little-integer-size(16), payload :: binary>>) do
    [size, payload]
  end

  def parse_stream(<<0xFE, size :: unsigned-little-integer-size(32), payload :: binary>>) do
    [size, payload]
  end

  def parse_stream(<<0xFF, size :: unsigned-native-integer-size(64), payload :: binary>>) do
    [size, payload]
  end

  def parse_stream(<<size :: unsigned-integer-size(8), payload :: binary>>) do
    [size, payload]
  end
end

