Given /^the following issues:$/ do |issues|
  Issue.create!(issues.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) issue$/ do |pos|
  visit issues_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following issues:$/ do |expected_issues_table|
  expected_issues_table.diff!(tableish('table tr', 'td,th'))
end
