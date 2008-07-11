class TicketDataImportsController < ApplicationController
  make_resourceful do
    actions :new, :create, :index
  end
end
