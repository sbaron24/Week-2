require "spec_helper"

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


  end

  scenario "user should be able to open page with list of articles with description, title, url" do
    visit '/'


  end

  scenario "When I visit /articles/new it has a form to submit a new article" do
    visit '/'


  end

  scenario "The form accepts an article title, URL, and description." do
    visit '/'
    #redirects and displays new article in list

  end

  scenario "When I successfully post an article, it should be saved to a CSV file." do
    visit '/'


  end

  scenario "If I try to submit an empty form, I stay on my form page, and nothing is saved to my CSV file." do
    visit '/'


  end


end
