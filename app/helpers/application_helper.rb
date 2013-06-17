module ApplicationHelper
  def full_title(page_title)                          
    base_title = "Prayer List"
    if page_title.empty?
        base_title
    else
        "#{page_title} | #{base_title}"
    end
  end

  def answered?(request)
    request.answered? ? 'answered' : 'unanswered'
  end

  def ESTed(date)
    date.in_time_zone("Eastern Time (US & Canada)")
  end

end
