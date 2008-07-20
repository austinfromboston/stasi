module RadicalDesigns
  class DumpConverter
    # ordered array means that the import will happen in this order
    CONVERTABLES = { 
      :help => [
        [ :contact,   :help_user    ], 
        [ :agent,     :help_staffer ], 
        [ :ticket,    :help_ticket  ], 
        [ :hour_log,  :help_hour    ] 
      ],
      :preamp => [
        [ :project,   :preamp_client  ], 
        [ :hour_log,  :preamp_hour    ] 
      ]
    }
    def convert( conversion_type = :help )
      Project.record_timestamps = false
      Ticket.record_timestamps = false
      HourLog.record_timestamps = false
      CONVERTABLES[ conversion_type ].each do | ( local_item, source_item ) |
        puts "Converting #{source_item}"
        sources = Kernel.const_get( source_item.to_s.classify ).find( :all )
        local_class = Kernel.const_get( local_item.to_s.classify )
        puts "found #{sources.size}"
        sources.each do |source|
          next if local_class.send( "find_by_#{source_item}_id", source.id )
          local = Kernel.const_get( local_item.to_s.classify).create!( source.local_attributes )
        end
      end
      Ticket.record_timestamps = true
      HourLog.record_timestamps = true
      Project.record_timestamps = true
    end
  end
end
