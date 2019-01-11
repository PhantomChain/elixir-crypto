defmodule PhantomChain.Crypto.MixProject do
  use Mix.Project

  def project do
    [
      app: :phantomchain_crypto,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "PhantomChain Elixir Crypto",
      source_url: "https://github.com/PhantomChain/elixir-crypto",
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :hackney]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:base58, "~> 0.1.0"},
      {:exbtc, "~> 0.1.3"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:excoveralls, "~> 0.9.1", only: :test},
      {:hackney, "~> 1.10"},
      {:jason, "~> 1.1"},
      {:kvx, "~> 0.1"},
      {:mock, "~> 0.3.0", only: :test},
      {:temp, "~> 0.4.5"}
    ]
  end

  defp description() do
    "A simple Cryptography Implementation in Elixir for the PHANTOM Blockchain."
  end

  defp package() do
    [
      maintainers: ["Brian Faust", "PhantomChain"],
      files: ["config", "lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/PhantomChain/elixir-crypto"}
    ]
  end
end
