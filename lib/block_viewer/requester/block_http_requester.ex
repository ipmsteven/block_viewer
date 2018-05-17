defmodule BlockViewer.Requester.BlockHttpRequester do
  def fetch(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, "Unable to fetch block info from #{url}, HTTP response code: #{code}"}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Something wrong with your HTTP connection, see detail: #{reason}"}
    end
  end
end

