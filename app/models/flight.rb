class Flight < ActiveRecord::Base

  belongs_to :airline

  def status
    return "LANDED" if estimated_at < DateTime.now
    return "DELAYED" if estimated_at > scheduled_at
    return "ON TIME"
  end

end
