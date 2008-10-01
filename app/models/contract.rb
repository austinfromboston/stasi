class Contract < ActiveRecord::Base
  establish_connection
  belongs_to :project
  LINEIN_ATTRIBUTES = [
    [:hourly_rate,      :hourly_rate      ],
    #[:billable_status,  :status           ],
    [:monthly_fee,      :monthly_retainer ],
    [:hours_included,   :monthly_support_hours ]
  ]

  def linein_attributes
    defaults = { 
      :project_id => (project && project.linein_project_id),
      :contract_type => 'hosting_amp',
      :billable_status => 'billable'
    }
    LINEIN_ATTRIBUTES.inject( defaults ) do |attrs, (linein_attr, my_attr)|
      attrs[linein_attr] = send(my_attr)
      attrs
    end
    
  end

  def assign_charges( hour_logs )
    total_minutes = 0
    monthly_minutes = monthly_support_hours.hours / 1.minute
    exempt_minutes = monthly_minutes
    hour_logs.each do |log|
      total_minutes += log.minutes
      next unless total_minutes > exempt_minutes
      log.overage = total_minutes - exempt_minutes
      log.charges = ( log.overage.minutes.to_f / 1.hour ) * hourly_rate
      exempt_minutes += log.overage
    end
  end
end
