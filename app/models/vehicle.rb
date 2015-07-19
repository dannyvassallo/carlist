class Vehicle < ActiveRecord::Base
  
  # SEARCH VEHICLES
  def self.search(search)             
    Vehicle.where("lower(year || ' ' || make || ' ' || model) LIKE ?", "%#{search.downcase}%")
  end

end