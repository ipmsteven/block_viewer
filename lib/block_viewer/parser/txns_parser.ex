defmodule BlockViewer.Parser.TxnsParser do
  alias BlockViewer.Model.Txn

  alias BlockViewer.Parser.TxnInputParser
  alias BlockViewer.Parser.TxnOutputParser
  alias BlockViewer.Parser.VariableSizePayloadParser

  def parse(payload, size, current_count \\ 0, txns \\ [])

  def parse(payload, size, current_count, txns) do
    if current_count == size do
      txns
    else
      <<version :: little-integer-size(32), payload :: binary>> = payload

      [number_of_txn_input, payload] = VariableSizePayloadParser.parse_stream(payload)
      [txn_inputs, payload] = parse_txn_inputs(payload, number_of_txn_input)

      [number_of_txn_output, payload] = VariableSizePayloadParser.parse_stream(payload)
      [txn_outputs, payload] = parse_txn_outputs(payload, number_of_txn_output)

      <<lock_time::unsigned-little-integer-size(32), payload :: binary>> = payload

      txn = %Txn{version: version,
        inputs: txn_inputs,
        outputs: txn_outputs,
        lock_time: lock_time
      }

      parse(payload, size, current_count + 1, txns ++ [txn])
    end
  end

  defp parse_txn_inputs(payload, size, current_count \\ 0, result \\ []) do
    if current_count == size do
      [result, payload]
    else
      [txn_input, payload] = TxnInputParser.parse_stream(payload)
      parse_txn_inputs(payload, size, current_count + 1, result ++ [txn_input])
    end
  end

  defp parse_txn_outputs(payload, size, current_count \\ 0, result \\ []) do
    if current_count == size do
      [result, payload]
    else
      [txn_output, payload] = TxnOutputParser.parse_stream(payload)
      parse_txn_outputs(payload, size, current_count + 1, result ++ [txn_output])
    end
  end
end

