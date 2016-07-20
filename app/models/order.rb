class Order < ActiveRecord::Base
	belongs_to :user
	serialize :productos, Hash
end
