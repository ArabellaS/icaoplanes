module ApplicationHelper
  def diff_in_days(start_date, end_date)
    if start_date && end_date
      diff = (end_date.to_date - start_date.to_date).to_i
      # diff += 1 # add 1 day by default
    else
      diff = 0
    end
    diff
  end
end
