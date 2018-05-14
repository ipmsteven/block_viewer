defmodule BlockViewerTest.BlockViewer.Parser.VariableSizePayloadParserTest do
  use ExUnit.Case

  alias BlockViewer.Parser.VariableSizePayloadParser

  test "parse stream start with 0XFD" do
    payload = <<253, 111, 111, 1, 1, 1>>

    assert [28527, <<1, 1, 1>>] == VariableSizePayloadParser.parse_stream(payload)
  end

  test "parse stream start with 0XFE" do
    payload = <<254, 111, 111, 111, 000, 1, 1, 0>>

    assert [7303023, <<1, 1, 0>>] == VariableSizePayloadParser.parse_stream(payload)
  end

  test "parse stream start with 0XFF" do
    payload = <<255, 111, 111, 111, 111, 0, 0, 0, 0, 1, 0, 0>>

    assert [1869573999, <<1, 0, 0>>] == VariableSizePayloadParser.parse_stream(payload)
  end

  test "parse stream" do
    payload = <<0xAA, 0, 0, 1>>

    assert [0xAA, <<0, 0, 1>>] == VariableSizePayloadParser.parse_stream(payload)
  end
end

