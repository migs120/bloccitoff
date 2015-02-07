class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  

  
  
  
  def days_left
            if (DateTime.now.to_date - created_at.to_date).to_i >= 8
              destroy
            else
              (DateTime.now.to_date - created_at.to_date).to_i
            end
              
              
   end
  

  
  
end


