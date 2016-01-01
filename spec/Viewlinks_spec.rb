feature 'Viewing Links' do
  before(:each) do
    Link.create(url: 'http://www.twitter.com', title: 'twitter', tags: [Tag.first_or_create(name: 'social')])
    Link.create(url: 'http://www.google.co.uk', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can view links on the bookmark page' do

    visit '/links'
    expect(page).to have_content('Google')

  end

  scenario 'I can filter links by tag' do
  visit '/tags/social'
  expect(page.status_code).to eq(200)
  within 'ul#links' do
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Code.org')
    expect(page).to have_content('twitter')
    expect(page).to have_content('Facebook')
  end
end
end
