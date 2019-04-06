class Node < ActiveRecord::Base
  attr_accessor :body, :lat, :lon, :map_id, :way_order, :way_id, :color, :author, :name
  belongs_to :way
  
end
