defmodule Identiconable.MixProject do
  use Mix.Project

  def project do
    [
      app: :identiconable,
      version: "0.2.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "identiconable",
      source_url: "https://github.com/usama-asfar/identiconable.git"
    ]
  end

  defp description() do
    "An Identicon is a visual representation of a hash value, usually of an IP address, that serves to identify a user of a computer system as a form of avatar while protecting the users' privacy. - Wikipedia"
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:egd, github: "erlang/egd", only: :dev},
      {:ex_doc, "~> 0.23.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      name: "identiconable",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/usama-asfar/identiconable.git"}
    ]
  end
end
