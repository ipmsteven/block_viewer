defmodule BlockViewer.CLI.ArgsParser do
  @block_hash_regex ~r/[A-Fa-f0-9]{64}/

  def parse([]) do
    {:error, "Please provide a hash to query"}
  end

  def parse(args) do
    hash = List.first(args)
    cond do
      Regex.match?(@block_hash_regex, hash) ->
        {:ok, hash}
      true ->
        {:error, "Please provide a valid SHA256 hash"}
    end
  end
end

