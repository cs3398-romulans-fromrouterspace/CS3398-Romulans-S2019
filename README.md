# TeamShare
By Romulans from Router Space, CS3398.

## Welcome
We want to help you distill an abstract task (coordinating people based on skills and personality) into distinct, manageable items.  We started this probject because people and time are valuable resources.  TeamShare helps streamline both.

## Our Vision
We are a team who helps teams.  We are creating an app to simplify the work of building and scheduling teams based on skill sets and personality traits.  TeamShare is designed for simplicity and ease of use, so anyone responsible for small or large groups of people can coordinate individuals into groups.  Questionnaires about skills, experience, and personality traits are filled out by an individual, and then the team leader can organize the individuals into teams based on the results.

## Getting the code running.
To get the code running you need to have ruby on rails installed as well as a database management system (dbms) installed. These can vary based on the OS you
are using. Once everything is installed and your dbms is up and running on a localhost or server, start up the rails application and you can navigate the
TeamShare site. Happy Sharing :)

## Team Accomplishments

Kendra:
    Added a button for the admin in team_sort/app/views/groups/index.html for editing teams. Also changed previous sort button  to a different icon located in the same file. The edit teams button will pull all teams/ team members and allow the admin to make changes to the team
    such as delete member or move a member to a different team. Kendra was not able to get this functionally in this sprint as it is a huge learning curve, having never worked with Ruby. For the next sprint Kendra will work on adding functionally to this button. 

Austin:
    Modified the previous groupcode for the admin in team_sort/app/controllers/groups_controllers.rb for generating group codes. This allowed us to remove unwanted symbols and only have upper/lower-case letters and numbers to only be included in the generated code. While the learning curve was great, it was simple to implement a random generator for ruby. 

William:
    Messed around with the user login UI, as to make improvements to the lesser quality
    of the appearance. The button size was modified to be slightly bigger, and the color of the background was changed around, but not finalized, as we weren't sure what color to use. A great amount of time of the sprint was spent studying Ruby and figuring out how the project worked as a whole, as well as getting it set up on Windows, which was a task in of itself. Future steps to be made will include modifying other portions of the UI, once the team has decided what changes will be better as a whole. 