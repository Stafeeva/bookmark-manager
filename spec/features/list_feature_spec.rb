
feature 'list of links' do

  scenario 'user can see a list of links on the homepage' do
    test_link = Link.create(:title => 'Google', :url => 'https://www.google.co.uk/', :time => Time.now)
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Google"
  end

end
