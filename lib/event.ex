defmodule Event do
  use Ecto.Model

  schema "events" do
    field :event_type,  :string
    field :student_id,  :integer
    field :class_id,    :integer
    field :school_id,   :integer
    field :district_id, :integer

    timestamps
  end
end
