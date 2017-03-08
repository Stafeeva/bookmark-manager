feature "tag" do
  scenario "user can add tags for links" do
    visit '/links'
    click_link 'Add link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'
    fill_in 'tag', with: 'news'
    expect(page).to have_content 'news'
  end
end
