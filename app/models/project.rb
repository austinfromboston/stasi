class Project < ActiveRecord::Base
  establish_connection
  has_many :contacts
  has_many :hour_logs
  has_many :contracts

  attr_accessor :contact_data
  attr_accessor :contract_data

  def display_name
    name || organization.to_s[0..40]
  end

  before_save :build_contacts
  def build_contacts
    return true unless contact_data && !contact_data.empty?
    contact_data.each do |contact|
      next if contact[:preamp_client_id] and Contact.find_by_contact_type_and_preamp_client_id( contact[:contact_type], contact[:preamp_client_id] )
      unless existing = Contact.find_by_email(contact[:email])
        contacts.build contact
        next
      end
      existing.attributes = contact
      contacts << existing
    end 
  end

  def contract_data=(values)
    contracts.build values
  end
end
