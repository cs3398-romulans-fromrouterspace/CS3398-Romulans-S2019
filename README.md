# TeamSort
By Romulans from Router Space, CS3398.

## Welcome
We want to help you distill an abstract task (coordinating people based on strengths) into distinct, manageable items.  We started this project because people and time are valuable resources.  TeamSort helps streamline both.

## Our Vision
We are a team who helps teams.  We are creating an app to simplify the work of building and scheduling teams based on skill sets and personality traits.  TeamSort is designed for simplicity and ease of use, so anyone responsible for small or large groups of people can coordinate individuals into teams.  We base each member's traits off of results from the CliftonStrengths quiz found here:
https://www.gallupstrengthscenter.com/product/en-us/10108/top-5-cliftonstrengths-access.
TeamSort does the rest of the work.

## Getting the code running.
To get the code running you need to have ruby on rails installed as well as a database management system (dbms) installed. These can vary based on the OS you are using. Once everything is installed and your dbms is up and running on a localhost or server, start up the rails application and you can navigate the TeamSort site. Happy Sharing :)

## Team Accomplishments

Kendra:
    Added a button for the admin in team_sort/app/views/groups/index.html for editing teams. Also changed previous sort button  to a different icon located in the same file. The edit teams button will pull all teams/ team members and allow the admin to make changes to the team such as delete member or move a member to a different team. Kendra was not able to get this functionally in this sprint as it is a huge learning curve, having never worked with Ruby. For the next sprint Kendra will work on adding functionally to this button.
    For sprint 2, Kendra ran into issues with the database not loading the strengths and could not work on the admin center. I went and found the database was missing the strengths entirely. I tried to back up my database from the original and this did not work. I worked from http://www.postgresqltutorial.com/postgresql-show-databases/ to figure out how to access the database and found that all the strengths information was missing. I was able to repopulate the database eventually by running commands to reset my database. For Sprint 3, I will focus on trying to get the admin portal edit button to pull from the database and show the team member and allow the admin to edit them.

Austin:
    Modified the previous groupcode for the admin in team_sort/app/controllers/groups_controllers.rb for generating group codes. This allowed us to remove unwanted symbols and only have upper/lower-case letters and numbers to only be included in the generated code. While the learning curve was great, it was simple to implement a random generator for ruby. Austin's sprint was completed successfully. For the next sprint, Austin will be generating error messages with invalid groupcode inputs. For sprint 2, I was faced with complications of our database filled with strengths. The strengths had not been popuated in the database forcing us to halt our tasks and sort this issue out. The reason is because I need the strengths list in order to create test student accounts, and since our database was not populated I was unable to test out my original task of creating messages for invalid groups codes inputted.

Hollie:
	Modified html in team_sort/app/views/registrations/new.html.erb to add password requirements for user registration. Password requirements are currently only 6-character minimum. Requirements are now shown to user upon registration. Hollie's sprint was completed successfully. For the next sprint Hollie will work on adding an error message when the passwords entered in registration do not match.
	Modified javascript sect in team_sort/app/views/registrations/new.html.erb to add an error message when the passwords entered do not match. Error message successfully added but with bugs. Debugging took longer than estimated and was unable to move forward with second task. For the next sprint Hollie will continue to debug password entry as well as work on modifying password retrieval page.

William:
    Messed around with the UI appearance of the log in button, and made it slightly bigger in size. Also messed around with background color, but no changes were pushed as the color wasn't yet decided by the team. A majority amount of this sprint's time frame was spent around learning ruby, and getting a working environment set up on Windows. Future steps will include modifying the UI further, upon team vote.

    For the 500.html page, under team_sort/public/500.html (for reference) the font for the page was changed from Arial, sans-serif to Tahoma, sans-serif. The background color was changed from a dramatic red background #00FF00 to a more eye-appealing #00FFFF light blue.

Anne:
    Updated Add New Group form to better reflect color scheme of website.  May add further changes, such as changing the background color to match that of main front page.  Chose the indigo portion of the TeamSort logo color to alter the title bar of the modal popup window.  
