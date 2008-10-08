pdf.header pdf.margin_box.top_left, :width => 500 do
  pdf.text_options.update(:size => 50, :align => :right)
  pdf.fill_color = 'ee9900'
  pdf.text 'radical', :at => [ 130, 671 ]
  pdf.fill_color = '000000'
  pdf.text 'DESIGNS', :style => :bold
  pdf.text '1370 Mission St, Floor 4, San Francisco, CA 94703  |  billing@radicaldesigns.org  |  415-738-0456', :size => 10, :style => :italic
end
tasks = condense_by_description( @hour_logs )
@contact = @project.contacts.all.find { |c| c.billable? }
period_covered = params[:query] && params[:query][:month] ? "For period: #{params[:query][:month]}/#{params[:query][:year]}" : ""
pdf.bounding_box [ pdf.margin_box.left + 50, 620 ] do
  pdf.pad_bottom(10) do
    pdf.table [[ [@contact.name, @project.organization, @contact.email, @contact.phone].join("\n"), [ @project.display_name, Time.now.strftime("%m-%d-%Y"), period_covered ].join("\n") ]],
      :widths => { 0 => 250, 1 => 200 }
  end

  pdf.table tasks.map { |t| [ t[:story], t[:description], to_hours(t[:minutes]) ] }, 
      :headers => [ 'story', 'tasks', 'hours' ],
      :widths  => { 0 => 200, 1 => 200, 2 => 50 },
	  :font_size => 9,
      :vertical_padding => 2
  total_hours = to_hours( tasks.inject(0) { |total, t| total += t[:minutes] })
  pdf.table [[ "TOTAL", total_hours ]],
      :widths  => { 0 => 400, 1 => 50 }
end
  
