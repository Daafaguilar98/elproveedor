class Product < ActiveRecord::Base

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://empresacolombinanathalia.weebly.com/uploads/2/8/1/4/28148007/s599866822382417415_p11_i1_w322.jpeg"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\Z/

end
