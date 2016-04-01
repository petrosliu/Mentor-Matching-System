##parent step

Given (/^the following (.*) exist:$/) do |type, table| 
    if type == "User"
        table.hashes.each do |element|
            User.create!(element)
        end
    end
    if type == "Parent"
        table.hashes.each do |element|
            Parent.create!(element)
        end
    end
    if type == "Child"
        table.hashes.each do |element|
            Child.create!(element)
        end
    end
    if type == "Invitation"
        table.hashes.each do |element|
            Invitation.create!(element)
        end
    end
    if type == "Group"
        table.hashes.each do |element|
            Group.create!(element)
        end
    end
    if type == "Mentor"
        table.hashes.each do |element|
            Mentor.create!(element)
        end
    end
    
    
end


When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end



##mentor steps


Then(/^I will nullify my session hash$/) do
  session[:user_id] = nil
end