# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cohort.destroy_all
Producer.destroy_all
Instructor.destroy_all
Student.destroy_all

producer = Producer.create({
	name: 'Herman Melville',
	email: 'slackr.melville@gmail.com',
	password: 'password',
	password_confirmation: 'password'
})

today = Date.today
cohort1 = Cohort.create({
	name: FFaker::Name.name,
	start_date: today - 50,
	end_date: today + 50,
	producer: producer
})
cohort2 = Cohort.create({
	name: FFaker::Name.name,
	start_date: today - 20,
	end_date: today + 80,
	producer: producer
})

instructor1 = Instructor.create({
	name: 'Ryan',
	email: 'ryaneburke@gmail.com',
	password: 'password',
	password_confirmation: 'password',
	cohort: cohort1
})

instructor2 = Instructor.create({
	name: 'Kelly',
	email: 'kllystvns@gmail.com',
	password: 'password',
	password_confirmation: 'password',
	cohort: cohort2
})

students = []
s = Student.create({
	name: 'Ben',
	email: 'bensayeg@gmail.com',
	phone_num: '7138707413',
	password: 'password',
	password_confirmation: 'password',
	cohort: cohort1
})
students.push(s)


25.times do
	s = Student.create({
		name: FFaker::Name.name,
		email: FFaker::Internet.disposable_email,
		phone_num: FFaker::PhoneNumber.short_phone_number,
		password: 'password',
		password_confirmation: 'password',
		cohort: cohort2
	})
	students.push(s)
end

students.each do |student|
	dates_range = student.cohort.start_date..student.cohort.end_date
	dates_array = dates_range.to_a
	cohort_dates = dates_array.select {|date| !(date.saturday? || date.sunday?)} 
	
	cohort_dates.each do |date|
		Attendance.create({
			date: date,
			student: student,
			present: true,
			late: false,
			absent: false,
			excused: false
		})
	end
b = Student.first

b.attendances.each do |a|
	a.present = false  	
	a.save
end  



end

