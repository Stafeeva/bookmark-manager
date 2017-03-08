feature "tag" do
  scenario "user can add tags for links" do
    visit '/links'
    click_link 'Add link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'
    fill_in 'tag', with: 'news'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('news')
  end

  scenario "can filter links through tags" do
    visit '/links'
    click_link 'Add link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    visit '/tags/bubbles'
    link = Link.all
    expect(link.tags.map(&:tag)).to include('bubbles')
  end
end
