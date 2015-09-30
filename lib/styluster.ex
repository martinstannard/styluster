require Logger
require Exq

defmodule Styluster do

  def flood(count) do
    1..count 
    |> Enum.each(fn(index) -> send(index) end)
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
