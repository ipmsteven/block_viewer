defmodule BlockViewerTest.BlockViewer.Parser.OutpointParserTest do
  use ExUnit.Case

  alias BlockViewer.Model.Outpoint
  alias BlockViewer.Parser.OutpointParser

  test "parse" do
    payload = Base.decode16!(
      "9656F497F25502C7BCF3ADB4C0A2F21F0568082B5868DCB28C453A48FD0C7C2A" <> # hash
      "00000000" <> # index
      "DEADBEEF")

    expected_outpoint = %Outpoint{
      hash: Base.decode16!("9656F497F25502C7BCF3ADB4C0A2F21F0568082B5868DCB28C453A48FD0C7C2A"),
      index: 0}

    assert [expected_outpoint, Base.decode16!("DEADBEEF")] == OutpointParser.parse_stream(payload)
  end
end

