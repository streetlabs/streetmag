Given /^the following publications:$/ do |publications|
  Publication.create!(publications.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) publication$/ do |pos|
  visit publications_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following publications:$/ do |expected_publications_table|
  expected_publications_table.diff!(tableish('table tr', 'td,th'))
end
