##Producer

resources :producers

index.html.erb
- list Day.all
- list Cohort.all
	-- Instructor.all
	-- Student.all

show.html.erb
- not sure this is needed?  It would be the 	individual Producer's page.

edit.html.erb
- edit profile


messaging with instructors/students
	https://www.ruby-toolbox.com/categories/User_Messaging_Systems

	http://www.rubydoc.info/gems/mailboxer/0.12.5

		gem 'mailboxer'
				-- 	class User < ActiveRecord::Base
  						acts_as_messageable
						end

view students who have a "Trouble" tag attached to them.
	-- run method to evaluate absences

##Instructor

resources :cohorts do
	resources :instructors
end

index.html.erb
- list Day.all
- list Student.all

show.html.erb
- individual Instructor's page.

edit.html.erb
- edit profile


form-helpers for checking attendance
link/button_tags for each student to edit attendance data

input field to search date
	-- https://www.ruby-toolbox.	com/projects/calendar_helper

messaging with producers/students
	https://www.ruby-toolbox.com/categories/User_Messaging_Systems

	http://www.rubydoc.info/gems/mailboxer/0.12.5

```
		gem 'mailboxer'
				-- 	class User < ActiveRecord::Base
  						acts_as_messageable
						end
```

view students who have a "Trouble" tag attached to them.
	-- run method to evaluate absences

```
module ProductHelper
  def class_for_product_date(product, date)
    case product.get_daily_average(date)
    when 0..24
      "product_cell_red"
    when 25..75
      "product_cell_yellow"
    when 76..100
      "product_cell_green"
    else
	      ""
	   end
	end
```

```
app/views/products/show.html.haml:
```

```
@product.each do |product|
  %td{:class => class_for_product_date(product, date)}
    = product.get_daily_average(date)
```










