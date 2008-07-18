module RadicalDesigns
  class HelpImporter
    CONVERTABLES = { :contact => :help_user, :agent => :help_staffer, :ticket => :help_ticket, :hour_log => :help_hour }
    def convert
      CONVERTABLES.each do | local_item, source_item |
        puts "Converting #{source_item}"
        sources = Kernel.const_get( source_item.to_s.classify ).find( :all )
        puts "found #{sources.size}"
        sources.each do |source|
          next if source.send(local_item)
          local = Kernel.const_get( local_item.to_s.classify).create!( source.local_attributes )
        end
      end
    end
  end
end
