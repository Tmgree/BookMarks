require_relative 'web_helper.rb'

feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up2(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end
