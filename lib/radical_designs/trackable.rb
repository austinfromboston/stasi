module RadicalDesigns
  module Trackable
    def sqlite?
      ActiveRecord::Base.configurations[Rails.env]['adapter'] =~ /sqlite/
    end
    def sql_month(expr)
      sqlite? ? "CAST(STRFTIME('%m', #{expr}) as 'INTEGER')" : "MONTH(#{expr})"
    end

    def year_condition( klass = nil )
      lambda { |from_year|
        begin_time = Time.mktime from_year
        end_time = begin_time + 1.year
        field_name = klass ? "#{klass.table_name}.created_at" : "created_at"
        { :conditions => [ "#{field_name} > ? and #{field_name} < ?", begin_time.to_s(:db), end_time.to_s(:db)] }
      }
    end 

    def month_condition(klass = nil )
      field_name = klass ? "#{klass.table_name}.created_at" : "created_at"
      lambda { |from_month|
      { :conditions => [ "#{RadicalDesigns::Trackable.sql_month( field_name )} = ?", from_month ] } 
      } 
    end

    module_function :sql_month, :sqlite?, :year_condition, :month_condition
  end
end
