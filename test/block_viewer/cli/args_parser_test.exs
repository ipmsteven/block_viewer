defmodule BlockViewerTest.BlockViewer.CLI.ArgsParserTest do
  use ExUnit.Case

  alias BlockViewer.CLI.ArgsParser

  test "parse" do
    assert {:ok, "000000000000000001806a922d4d35a37ad9324c690f72d556c6445cb7a9c214"} == ArgsParser.parse(["000000000000000001806a922d4d35a37ad9324c690f72d556c6445cb7a9c214"])
    assert {:ok, "111111111111111111806A922D4D35A37AD9324C690F72D556C6445CB7A9C214"} == ArgsParser.parse(["111111111111111111806A922D4D35A37AD9324C690F72D556C6445CB7A9C214"])
    assert {:error, "Please provide a hash to query"} == ArgsParser.parse([])
    assert {:error, "Please provide a valid SHA256 hash"} == ArgsParser.parse(["Hello World"])
    assert {:error, "Please provide a valid SHA256 hash"} == ArgsParser.parse(["测试"])
  end
end

