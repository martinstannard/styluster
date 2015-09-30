require Logger
require Exq

defmodule Trickle do

  def squirt(count) do
    1..count 
    |> Enum.each(fn(index) -> send(index) end)
  end

  def send(id) do
    {:ok, ack} = Exq.enqueue(:exq, "default", "Events", [id]) 
  end

end
