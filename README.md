# Styluster

A test for exq

```
mix deps.get
iex -S mix
iex(1)>  {:ok, ack} = Exq.enqueue(:exq, "default", "Events", []) 
{:ok, "c89173ea-86c8-4f1a-b48b-e3f43d9ba506"}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add styluster to your list of dependencies in `mix.exs`:

        def deps do
          [{:styluster, "~> 0.0.1"}]
        end

  2. Ensure styluster is started before your application:

        def application do
          [applications: [:styluster]]
        end
