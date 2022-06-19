defmodule F451.TemplateHelpers do
  def dmy_date(date) do
    [year, month, day] =
      [date.year, date.month, date.day]
      |> Enum.map(&to_string/1)
      |> Enum.map(&String.pad_leading(&1, 2, "0"))

    "#{day}/#{month}/#{year}"
  end
end
