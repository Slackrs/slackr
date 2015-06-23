# Student's User Stories:

***

### As a student, I would like to:

	EC1)*Be able to log in and out:*
	Use BCrypt to have a secured and validating log in/out session, which involves making a set of files based on "sessions" ex. controllers, models etc.

	EC2)*View my and only my attendance record:*
	Routes specified within student controller, all models, and views set to iterate through an array for the record. 
***

### As a student, a great power comes with great responsibilities and can accept that 3 lateness equals 1 absence:

	EC1)*3 lateness equals 1 absence:*
	hardcoded values in the database or a defined method/function that defines, calculates, and stores the multi-faceted aspects of lateness/absences' values and colors the students accordingly when triggered.
***

### No excuses!

	EC1)*Excused absences don't get added to the tally, but each unexcused absence counts as 1 absence:*
	The values will be either hardcoded and/or a function/method that processes, stores, and runs upon a trigger firing.

### An honorable student falls on their own sword:

	EC1)*After 3 absences a notification that they need to contact their course producer with a link to email the producer pops up:*
	Having ActionMailer/LetterOpener gems installed and linked/coded into with pre-populated texts that triggers after the conditions are set, where either a button becomes visible, or upon clicking the aforementioned notification will open up an email form within a browser with pre-populated texts(LetterOpener).