defmodule BlockViewerTest.BlockViewer.Requester.BlockHttpRequesterTest do
  use ExUnit.Case

  alias BlockViewer.Requester.BlockHttpRequester

  setup do
    bypass = Bypass.open
    {:ok, bypass: bypass}
  end

  test "fetch with valid block hash", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/block/valid_block_hash.bin" == conn.request_path
      Plug.Conn.resp(conn, 200, "payload")
    end)

    assert {:ok, "payload"} == BlockHttpRequester.fetch("http://localhost:#{bypass.port}/block/valid_block_hash.bin")
  end

  test "fetch with invalid block hash", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/block/invalid_block_hash.bin" == conn.request_path
      Plug.Conn.resp(conn, 404, "Not Found")
    end)

    assert {:error, "Unable to fetch block info from http://localhost:#{bypass.port}/block/invalid_block_hash.bin, HTTP response code: 404"} == BlockHttpRequester.fetch("http://localhost:#{bypass.port}/block/invalid_block_hash.bin")
  end

  test "fetch with server error", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "GET" == conn.method
      assert "/block/block_hash.bin" == conn.request_path
      Plug.Conn.resp(conn, 500, "Server Error")
    end)

    assert {:error, "Unable to fetch block info from http://localhost:#{bypass.port}/block/block_hash.bin, HTTP response code: 500"} == BlockHttpRequester.fetch("http://localhost:#{bypass.port}/block/block_hash.bin")
  end

  test "fetch with connection disabled", %{bypass: bypass} do
    Bypass.down(bypass)

    assert {:error, "Something wrong with your HTTP connection, see detail: econnrefused"} == BlockHttpRequester.fetch("http://localhost:#{bypass.port}/block/block_hash.bin")
  end
end

