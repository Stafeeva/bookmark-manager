
feature 'create link' do

  scenario 'user can add a link' do
    visit '/links'
    click_link 'Add link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.co.uk/news'
    click_button 'Submit'
    expect(page).to have_content 'BBC'
    expect(page).to have_content 'http://www.bbc.co.uk/news'
  end
end
