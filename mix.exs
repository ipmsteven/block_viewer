defmodule BlockViewer.MixProject do
  use Mix.Project

  def project do
    [
      app: :block_viewer,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript_config()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript_config do
    [main_module: BlockViewer]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0.0"},
      {:bypass, "~> 0.8", only: :test}
    ]
  end
end
