require Logger
require Repo
require Event
require Timex

defmodule Events do

  def perform(id) do
    Logger.info "Events perform #{id}"
    event = %Event{student_id: id, school_id: id + 1, class_id: id + 2, event_type: "Event::CompleteLesson"}
    Repo.insert!(event)
  end

end
