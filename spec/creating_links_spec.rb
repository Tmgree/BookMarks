feature 'creating links' do
  scenario 'user is allowed to create a new link' do
    visit 'links/new'
    fill_in 'url', with: 'www.facebook.com'
    fill_in  'title', with: 'Facebook'
    click_button 'Create link'
     expect(current_path).to eq '/links'
     expect(page).to have_content('Facebook')
  end
end
