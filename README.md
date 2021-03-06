# TeamSort
By Romulans from Router Space, CS3398.

## Welcome
We want to help you distill an abstract task (coordinating people based on strengths) into distinct, manageable items.  We started this project because people and time are valuable resources.  TeamSort helps streamline both.

## Our Vision
We are a team who helps teams.  We are creating an app to simplify the work of building and scheduling teams based on skill sets and personality traits.  TeamSort is designed for simplicity and ease of use, so anyone responsible for small or large groups of people can coordinate individuals into teams.  We base each member's traits off of results from the CliftonStrengths quiz found here:
https://www.gallupstrengthscenter.com/product/en-us/10108/top-5-cliftonstrengths-access.
TeamSort does the rest of the work.

## Getting the code running.
The code is currently running on  http://68.183.153.53/users/sign_in, but after 5/9/2019 will be taken down. Then to run the code you will need to run it locally using puma. To do this you need to have ruby installed and all of the bundle dependencies. The from the CS3398-Romulans-S2019 folder simply type rails s and this will host it loccaly on localhost:3000. 

## Team Accomplishments

Kendra:
    Added a button for the admin in team_sort/app/views/groups/index.html for editing teams. Also changed previous sort button  to a different icon located in the same file. The edit teams button will pull all teams/ team members and allow the admin to make changes to the team such as delete member or move a member to a different team. Kendra was not able to get this functionally in this sprint as it is a huge learning curve, having never worked with Ruby. For the next sprint Kendra will work on adding functionally to this button.

  For sprint 2, Kendra ran into issues with the database not loading the strengths and could not work on the admin center. I went and found the database was missing the strengths entirely. I tried to back up my database from the original and this did not work. I worked from http://www.postgresqltutorial.com/postgresql-show-databases/ to figure out how to access the database and found that all the strengths information was missing. I uploaded some pictures of the issue to my branch of the github under Kendra's learning. I was able fix the database eventually by running commands to reset my database. For Sprint 3, I will focus on trying to get the admin portal edit button to pull from the database and show the team member and allow the admin to edit them.
  
  For sprint 3, Kendra worked on setting up the server http://68.183.153.53/users/sign_in on DigialOcean. Kendra used Capistrano,Passanger, and nginx on a Ubuntu VM to deploy the code via github. Kendra modified the github for the server by pulling all of the ruby application files out of the team_sort folder. This allowed the server to read and pull the files. Kendra also added the Capfile on the top directory of the github. This file allowed Capistrano to set it reqirements. Kendra allow added/ edited production.rb under CS3398-Romulans-S2019/config/deploy,deploy.rd under CS3398-Romulans-S2019/config, secrets.yml under CS3398-Romulans-S2019/config, and devise.rb under CS3398-Romulans-S2019/config/initializers. Durring the presentation there was a issue with the run sort not working. I was also able to fix this in CS3398-Romulans-S2019/app/controllers/groups_controller.rb by removing a byebug refrance. 

Austin:
    Modified the previous groupcode for the admin in team_sort/app/controllers/groups_controllers.rb for generating group codes. This allowed us to remove unwanted symbols and only have upper/lower-case letters and numbers to only be included in the generated code. While the learning curve was great, it was simple to implement a random generator for ruby. Austin's sprint was completed successfully. For the next sprint, Austin will be generating error messages with invalid groupcode inputs.
    For sprint 2, I was faced with complications of our database filled with strengths. The strengths had not been popuated in the database forcing us to halt our tasks and sort this issue out. The reason is because I need the strengths list in order to create test student accounts, and since our database was not populated I was unable to test out my original task of creating messages for invalid groups codes inputted. The issue was fixed using rails db:seed to repopulate the database with the strengths. Now that the block is fixed, i will begin implementing this invalid group code for sprint 3.
   For sprint 3, I implemented a hot-fix for the invalid group-code because I was personally having a lot of trouble tying html and ruby together to get an error message to pop up. The simple hot-fix was to just refresh the whole page if the group code was not found in the database. The code I modified is in /app/views/new.html.erb on line 85. I modified that message to inform the user that if their page refreshes then it is the groupcode that is the problem. Next, I modified /app/controllers/registrations_controller.rb on line 48, I added the redirect which basically refreshes the page. I hope in the future I can make this a bit more elegant and not so bootleg.

Hollie:
	Modified html in team_sort/app/views/registrations/new.html.erb to add password requirements for user registration. Password requirements are currently only 6-character minimum. Requirements are now shown to user upon registration. Hollie's sprint was completed successfully. For the next sprint Hollie will work on adding an error message when the passwords entered in registration do not match.
	For sprint 2, modified javascript sect in team_sort/app/views/registrations/new.html.erb to add an error message when the passwords entered do not match. Error message successfully added but with bugs. Debugging took longer than estimated and was unable to move forward with second task. For the next sprint Hollie will continue to debug password entry as well as work on modifying password retrieval page.
	For sprint 3, modified Forgot Password page in /app/views/devise/passwords/new.html.erb and edited the styling for it in /app/assets/stylesheets/style.css. Page was successfully changed and all buttons fully functional except for the submit button since app does not have email sending functionality. Assisted in fixing server and database issues by repopulating the database to show the strengths list upon registration.

William:
    Messed around with the UI appearance of the log in button, and made it slightly bigger in size. Also messed around with background color, but no changes were pushed as the color wasn't yet decided by the team. A majority amount of this sprint's time frame was spent around learning ruby, and getting a working environment set up on Windows. Future steps will include modifying the UI further, upon team vote.

    For Sprint 2, the 500.html page was changed, under team_sort/public/500.html (for reference) the font for the page was changed from Arial, sans-serif to Tahoma, sans-serif. The background color was changed from a dramatic red background #00FF00 to a more eye-appealing #00FFFF light blue.
    
    For Sprint 3, I focused on finding a free strengths taking quiz instead of the $20 relied upon 3rd party strengths test we usually use, and found an acceptable replacement for other students to use. The site is: high5test.com This site awards strengths that are similar enough in name to the input strengths that users can attempt our website with the strengths given. The site was tested, giving me the following page: https://high5test.com/test/main-test-result/MTc1NzY3/ (I am hoping this test can be shared publically so the proof can be seen) I did not actually modify code for the project, so I do not have a branch or filepath to share. 

Anne:
    Updated Add New Group form to better reflect color scheme of website.  May add further changes, such as changing the background color to match that of main front page.  Chose the indigo portion of the TeamSort logo color to alter the title bar of the modal popup window.  
    For Sprint 2, used principles from Sprint 1, but instead of HTML, used CSS to apply changes to ALL modal boxes in the dashboard.  The following filepaths contain the changes, within the first few lines of the file:
- app/views/groups/edit.html.erb
- app/views/groups/generate_teams.html.erb
- app/views/groups/_form.html.erb
    
    A modal box has 3 parts: head, body, and foot.  Each of these were updated to the same backgrounds as the website with hex colors.  Then the font was updated with HTML tags.  For example, in line 15 of the last file shows how the font was updated to reflect the website's overall style.  Before the modal box popups were all plain white boxes and not reflective of the theme of the website.  After the changes, the background and text of the boxes were changed to icy blue and indigo.  This streamed aesthetics together, making the user experience smoother overall.
    
    In Sprint 3 Anne created a CSV file, studUsers.csv, without fake student accounts (student1 - student30) and fake passwords.  The import and export of user accounts allowed us to practice manipulating the database.  Working with encryption presented an issue with making full use of the practice table, and would be interest of further study and tasks.  Filepath> /CS3398-Romulans-S2019/db/studUsers.csv
