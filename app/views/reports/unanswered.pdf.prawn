pdf.text "Unanswered Prayers", size: 25, align: :center

@prayer_requests.each do |r|
  pdf.text r.title, size: 20, style: :bold
  pdf.text (I18n.l ESTed(r.updated_at)), size: 10 , style: :italic
  pdf.move_down 10 
  pdf.text r.request_text
  pdf.move_down 10 

  unless r.prayer_updates.empty?
    pdf.text r.prayer_updates.recent.first.body
  end

  pdf.stroke_horizontal_rule
  pdf.move_down 20 
end
