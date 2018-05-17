defmodule BlockViewerTest.BlockViewer.Parser.TxnsParserTest do
  use ExUnit.Case

  alias BlockViewer.Model.Txn
  alias BlockViewer.Model.TxnInput
  alias BlockViewer.Model.Outpoint
  alias BlockViewer.Model.TxnOutput

  alias BlockViewer.Parser.TxnsParser

  test "parse with customize size" do
    {:ok, payload} = File.read("test/fixtures/txns/txns_443794.bin")

    txns =  [
      %Txn{
        version: 1,
        inputs: [
          %TxnInput{
            previous_output: %Outpoint{
              hash: Base.decode16!("0000000000000000000000000000000000000000000000000000000000000000"),
              index: 4294967295},
            script_length: 42,
            signature_script: Base.decode16!("0392C5061D4D696E656420627920416E74506F6F6C206471202AC6C206205854D851C60300002F0B0200"),
            sequence: 4294967295,
          }
        ],
        outputs: [
          %TxnOutput{
            value: 1251025911,
            pk_script_length: 25,
            pk_script: Base.decode16!("76A914D190C364C43FF16CBEEDBB28308EFEF13DF61F8188AC")
          }
        ],
        lock_time: 0
      },
      %Txn{
        version: 1,
        inputs: [
          %TxnInput{
            previous_output: %Outpoint{
              hash: Base.decode16!("8DEEB1AC054B7D4BCA058D125DDA41E9937EA34B7D1475B2E034ED84100443C3"),
              index: 0},
            script_length: 139,
            signature_script: Base.decode16!("483045022100BE0580129E98B4BE593B3EDF0C51EA7D1A64EA0175670B8B5CB890904D8ABF330220062D13FB315E6988624605A8FBE9796AC18FAB38B6EB66726FBF000D5190E0CF014104892E31D04537248C9461F9CF42F093F015624354DCF6E98F17BA582EF1BF17C3C727C4940CAC221FE0A4D60B3954047FCC7C53E24BB9268E5A3DE403247607D0"),
            sequence: 4294967295,
          }
        ],
        outputs: [
          %TxnOutput{
            value: 2636857,
            pk_script_length: 25,
            pk_script: Base.decode16!("76A9146253907064AB8FF696B6FC38D0D4C53A7064363E88AC")
          }
        ],
        lock_time: 0
      }]

    assert txns == TxnsParser.parse(payload, 2)
  end
end

