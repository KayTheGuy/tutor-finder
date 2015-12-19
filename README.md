                CMPT 470 - Final Project Submission (7th December 2015)

===============================================================================
                        TutorFinder v1.0 by SASKA (Group 11)
===============================================================================
	      
Welcome to TutorFinder, a web platform that connects students to tutors.

===============================================================================
=================================INSTRUCTOR & TA===============================
===============================================================================

**** Installation: ************************************************************

This application utilizes vagrant to configure virtual development environments.

Software Pre-requisites: Virtual Box, Vagrant

**** Launching the application: ***********************************************

1.  Execute $ vagrant up in your command terminal to begin the deployment process.
    It may take up 10 mins depending on the hardware that vagrant is running on.

2.  Once the deployment process is finished, you may launch a web browser of your
    choice.
    
3.  The TutorFinder web application can be accessed at http://localhost:8080/

**** Let's Get Started! *******************************************************

1.  To access all the functionalities of TutorFinder, you must log in with a valid
    account.

2.  You may create an account by clicking "Sign up" on the right side of the
    navigation bar at the top of the webpage.
    
3.  Fill in all the required information for account creation. A flash error
    message will be shown if any of the required information is missing.
    
4.  Once the sign up process is completed, you will be directly to your own home
    page.
    
5.  You may also log-in with the account you just created by clicking "Log-in" if
    your session has expired or you have previous signed out from the system.
    
6.  To fully explore the system, you may log-in with one of our sample accounts
    which we have already populated data for you to fully discover the system.
    e-mail:     kdehghan@sfu.ca
    password:   1234
    
**** Site Functionalities *****************************************************

Different type of users has different functionalities in TutorFinder.

0   Account Roles (Brief Overview):
    0.1 Student
        0.1.1   Can make an appointment request with a tutor for a learning
                section.
    0.2 Tutor / Both (Student & Tutor)
        0.2.1   Can accept an appointment request from a student for a teaching
                section.
        0.2.2   Can make an appointment request with another tutor for a learning
                section.
    
1   Appointment(s)
    1.1 Request Appointments can be done thru the followings
        1.1.1   The user's Contact List
        1.1.2   "Search By Course" button on the user's profile page
        1.1.3   "Search By Course" button on the TutorFinder's home page
    1.2 Accept Appointments can be done thru the notification center which can
        be accessed by clicking the flag icon in the navigation bar.
        1.2.1   To accept the appointment request, click "Accept" or you may also
                edit the appointment details before accepting it.
        1.2.2   To ignore the appointment request, click "Ignore"
    1.3 View Appointments can be done thru the user's agenda page which can be
        accessed by clicking the calendar icon in the navigation bar.
        1.3.1   Accepted appointment can be edited to add or update the latest
                information of the appointment by both the tutor and student.
        1.3.2   Accepted appointment can be cancelled.
        
2   Agenda
    2.1 Can be accessed by clicking the calendar icon in the navigation bar.
    2.1 Shows your calendar with your confirmed appointments filled in.
    2.2 Shows your agenda list for your learning appointments (For Students / Both)
    2.3 Show your agenda list for your teaching appointments (For Tutors / Both)
    
3   My Profile Page
    3.1 Contact List
        3.1.1   Search Users
            3.1.1.1 User may search for another user and view his / her profile
        3.1.2   Allow you to make appointments with your contacts.
    3.2 Search By Course    (For Students / Both)
        3.2.1   Search for a tutor for a particular course
    3.3 Select Course       (For Tutors / Both)
        3.3.1   Select a course which you would like to teach as a tutor.
    3.4 Show my Course List (For Tutors / Both)
        3.4.1   Show the courses which you are currently teaching
        3.4.2   Allow you to add a description to the course you're teaching.
        
4   Account Setting
    4.1 Update account information
        4.1.1   Password is required for all changes
        4.1.2   All information can be modified
        4.1.3   Update new profile picture
        
5   Blog
    5.1 Allow user to share their thoughts or post discussion
    5.2 Users may contribute to the discussion by making a comment to a blog post.
    
6   About
    6.1 Describes the development process of TutorFinder.
    
7   Team
    7.1 Introduce the development team in SASKA to the users.
    
**** Known-Bugs List **********************************************************

N/A

**** Technical Information ****************************************************

The application's MySQL database can be accessed from the MySQL workbench at
Address         :127.0.0.1:2222
SSH User        : vagrant
MySQL DB User   : marker
MySQL DB PWD    : 1234

If you would like to keep the database entries after testing, you may update the
data schema by executing $ rake db:data:dump on SSH in the application folder.

*******************************************************************************



                        THANK YOU FOR TRYING TUTORFINDER!
WE HOPE YOU LIKED IT AND PLEASE FEEL FREE TO SUGGEST FEATURES AND COMMENTS. :)



===============================================================================
=================================FOR DEVELOPERS================================
===============================================================================

Email Sample for Marker
{
    email:           tutorfindermarker@gmail.com
    password:        cmpt470TF
}
        
        
