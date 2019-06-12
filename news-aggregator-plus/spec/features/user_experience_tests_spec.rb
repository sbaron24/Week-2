require "spec_helper"
require "pry"
feature "User looks at list of articles", %(
  As a slacker
  I want to be able to visit a page that shows me all the submitted articles
  So that I can distract myself from the actual work I have to do.

  Acceptance Criteria:
  [ ] When I visit /articles I should be able to see all the articles that have been submitted.
  [ ] Each article should show the description, title, and URL.
  [ ] If I click on the URL it should take me to the relevant page inside of a new tab.
      If you want to use an external link with sinatra, you have to start the link with either
      http:// or https:// or it will automatically assume that it is an internal link.

) do

  scenario "user should be able to open page, click on link, and open individual article URL in new tab" do
    visit '/'
    first("li").click_link("Link")
    expect(page.current_url).to eq "https://medium.com/rubyinside/a-deep-dive-into-routing-and-controller-dispatch-in-rails-8bf58c2cf3b5"

  end

  scenario "user should be able to open page with list of articles with description, title, url" do
    visit '/'
    page.find_by_id("article-list")
  end

  scenario "When I visit /articles/new it has a form and I can submit a new article title, description, and url, and I should be redirected to index page and see new article listed" do
    visit '/articles/new'
    expect(page).to have_selector("form")
    fill_in 'Title', with: 'How to Cast Spells Like Harry Potter'
    fill_in 'Description', with: 'Like a boss you will destroy Voldy!!'
    fill_in 'URL', with: 'https://www.pottermore.com/collection/spells-and-charms'
    click_button 'Submit'
    visit '/'
    expect(page).to have_content('How to Cast Spells Like Harry Potter')
    reset_csv
  end


  scenario "When I submit an empty form I stay on the page." do
    visit '/articles/new'
    expect(page).to have_selector("form")
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'Like a boss you will destroy Voldy!!'
    fill_in 'URL', with: ''
    click_button 'Submit'
    expect(page).to have_selector("form")
  end
end
