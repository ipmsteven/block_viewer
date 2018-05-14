defmodule BlockViewer.Parser.TxnOutputParser do
  alias BlockViewer.Model.TxnOutput

  alias BlockViewer.Parser.VariableSizePayloadParser

  def parse_stream(payload) do
    <<value :: unsigned-little-integer-size(64), payload :: binary>> = payload
    [pk_script_length, payload] = VariableSizePayloadParser.parse_stream(payload)
    <<pk_script :: bytes-size(pk_script_length), payload :: binary >> = payload

    [%TxnOutput{
      value: value,
      pk_script_length: pk_script_length,
      pk_script: pk_script
    }, payload]
  end
end

