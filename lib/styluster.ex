require Logger
require Exq
require Repo

defmodule Styluster do

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Styluster.Worker, [arg1, arg2, arg3]),
      worker(Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Styluster.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def flood(count) do
    1..count 
    |> Enum.each( fn(index) -> spawn( fn -> send(index) end) end)
  end

  def send(id) do
    {:ok, ack} = Exq.enqueue(:exq, "default", "Events", [id]) 
  end

  def flood_later(count, seconds) do
    1..count 
    |> Enum.each(fn(index) -> send_later(index, seconds) end)
  end

  def send_later(id, seconds) do
    {:ok, ack} = Exq.enqueue_in(:exq, "default", seconds, "Events", [id]) 
  end

end
