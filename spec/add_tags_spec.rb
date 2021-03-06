feature 'Adding tags' do

  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    fill_in 'tags', with: 'search'
    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
end

scenario 'I can add multiple tags to a new link' do
  visit '/links/new'
  fill_in 'url',   with: 'http://www.google.co.uk'
  fill_in 'title', with: 'Google'
  fill_in 'tags',  with: 'search engine'
  click_button 'Create link'
  link = Link.first
  expect(link.tags.map(&:name)).to include('search', 'engine')
end

end
