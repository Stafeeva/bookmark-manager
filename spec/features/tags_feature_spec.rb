feature "tag" do
  scenario "user can add tags for links" do
    visit '/links'
    click_link 'Add link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'
    fill_in 'tags', with: 'news'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

  scenario "can filter links through tags" do
    Link.create(url: 'http://bbc.co.uk/', title: 'BBC', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://google.co.uk/', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    expect(page).to have_content('BBC')
    expect(page).not_to have_content('Google')
  end
end
