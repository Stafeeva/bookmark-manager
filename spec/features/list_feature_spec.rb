
feature 'list of links' do

  scenario 'user can see a list of links on the homepage' do
    visit '/'
    expect(page).to have_content "Bookmarks:"
  end
end
