module RadicalDesigns
  module Trackable
    def sqlite?
      ActiveRecord::Base.configurations[Rails.env]['adapter'] =~ /sqlite/
    end
    def sql_month(expr)
      sqlite? ? "CAST(STRFTIME('%m', #{expr}) as 'INTEGER')" : "MONTH(#{expr})"
    end

    def year_condition
      lambda { |from_year|
        begin_time = Time.mktime from_year
        end_time = begin_time + 1.year
        { :conditions => [ "created_at > ? and created_at < ?", begin_time.to_s(:db), end_time.to_s(:db)] }
      }
    end 

    def month_condition#(from_month)
      lambda { |from_month|
      { :conditions => [ "#{RadicalDesigns::Trackable.sql_month( 'created_at' )} = ?", from_month ] } 
      } 
    end

    module_function :sql_month, :sqlite?, :year_condition, :month_condition
  end
end
