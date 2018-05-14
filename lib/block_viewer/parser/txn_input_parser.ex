defmodule BlockViewer.Parser.TxnInputParser do
  alias BlockViewer.Model.TxnInput

  alias BlockViewer.Parser.OutpointParser
  alias BlockViewer.Parser.VariableSizePayloadParser

  def parse_stream(payload) do
    [outpoint, payload] = OutpointParser.parse_stream(payload)
    [script_length, payload] = VariableSizePayloadParser.parse_stream(payload)

    << signature_script :: bytes-size(script_length),
      sequence          :: unsigned-little-integer-size(32),
      payload           :: binary >> = payload

    [%TxnInput{
      previous_output: outpoint,
      script_length: script_length,
      signature_script: signature_script,
      sequence: sequence
    }, payload]
  end
end

