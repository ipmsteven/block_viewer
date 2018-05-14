defmodule BlockViewerTest.BlockViewer.Parser.TxnInputParserTest do
  use ExUnit.Case

  alias BlockViewer.Model.TxnInput
  alias BlockViewer.Model.Outpoint

  alias BlockViewer.Parser.TxnInputParser

  test "parse" do
    {:ok, payload} = File.read("test/fixtures/txn_input/block_443794_txn_0_input_0.bin")

    txn_input = %TxnInput{
      previous_output: %Outpoint{
        hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
        index: 4294967295},
      script_length: 42,
      signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
      sequence: 4294967295,
    }
    assert txn_input == TxnInputParser.parse_stream(payload) |> List.first
  end
end

