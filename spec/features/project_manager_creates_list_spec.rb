require 'rails_helper'

feature 'Project manager creates LIST' do
  scenario 'Successfully' do
    fill_in 'title', with: 'Meet up with the team'
     click_button 'Save'

  end
end
