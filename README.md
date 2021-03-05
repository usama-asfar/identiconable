<p align="center">
  <a href="https://material-ui.com/" rel="noopener" target="_blank"><img width="150" src="https://repository-images.githubusercontent.com/344022733/c15fa280-7c20-11eb-84b4-371288bbe7ab" alt="Material-UI logo"></a></p>
</p>

<h1 align="center">Identiconable
<p align="center" style="font-size: 16px">
 Identicon generator for elixir
</p>
</h1>

An Identicon is a visual representation of a hash value, usually of an IP address, that serves to identify a user of a computer system as a form of avatar while protecting the users' privacy. - Wikipedia

## Installation

The package can be installed by adding `identiconable` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identiconable, "~> 0.2.0"}
  ]
end
```

## Usage

```elixir
Identiconable.main("Identiconable", 400)
|> Identiconable.save("images", "my_identicon")
```
