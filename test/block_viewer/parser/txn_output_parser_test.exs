defmodule BlockViewerTest.BlockViewer.Parser.TxnOutputParserTest do
  use ExUnit.Case

  alias BlockViewer.Model.TxnOutput
  alias BlockViewer.Parser.TxnOutputParser

  test "parse" do
    {:ok, payload} = File.read("test/fixtures/txn_output/block_443794_txn_0_output_0.bin")

    txn_output = %TxnOutput{
      value: 1251025911,
      pk_script_length: 25,
      pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
    }
    assert txn_output == TxnOutputParser.parse_stream(payload) |> List.first
  end
end

