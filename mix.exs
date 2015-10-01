defmodule Styluster.Mixfile do
  use Mix.Project

  def project do
    [app: :styluster,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :exq, :tzdata, :postgrex, :ecto],
    mod: {Styluster, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:exq, github: "martinstannard/exq", branch: "master"},
      {:postgrex, "~> 0.9.1"},
      {:ecto, "~> 1.0"}
    ]
  end
end
