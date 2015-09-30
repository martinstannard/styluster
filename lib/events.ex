require Logger

defmodule Events do

  def perform(id) do
    Logger.info "Events perform #{id}"
  end

end
