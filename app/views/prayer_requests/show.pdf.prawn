pdf.text @prayer_request.title, size: 25, align: :center
pdf.text (I18n.l ESTed(@prayer_request.updated_at)), size: 10 , style: :italic
pdf.move_down 20
pdf.text @prayer_request.request_text

@prayer_request.prayer_updates.recent.each do |u|
  pdf.text (I18n.l ESTed(u.updated_at)), size: 10 , style: :italic
  pdf.text u.body
  pdf.stroke_horizontal_rule
  pdf.move_down 20 
end
