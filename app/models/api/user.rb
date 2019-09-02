class Api::User < ApplicationRecord

  def as_json(opt={})
		{
      id:id, name: name, website: website, address: address, phone: phone_number, gender: gender
		}
  end
  
end
