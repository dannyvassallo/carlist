class Vehicle < ActiveRecord::Base
  
  # SEARCH VEHICLES
  def self.search(search)         
    where("year LIKE ? OR make LIKE ? OR model LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end




