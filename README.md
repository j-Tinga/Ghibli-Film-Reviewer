# Ghibi: A Studio Ghibli Film Library

Ghibi is a mobile film library for all of Studio Ghibli Films that allows users to scroll through Ghibli Films, save them in a watch list, and write and store reviews for specific Ghibli Films that they have watched.
The app uses the [Studio Ghibli API](https://github.com/user/repo/blob/branch/other_file.md) for retrieving Studio Ghibli Film data.
The app currently uses SQLite for storing local data.

## Objectives
This project is a requirement for the completion of the Mobile Development (CIS 2203) in the Department of Computer, Information Sciences and Mathematics of the University of San Carlos.

Through this project, I was able to:
- Utilize what I learn about making mobile apps through Flutter throughout the mobile development course.
- Learn how to utilize an API in a mobile app.
- Learn how to implement a back-end for a mobile app (Firebase or SQLite)

## App Pages/Features
__Login Page__ - Landing page for when the app is initially open. (Username and password are currently static, any valid text would do)

![Login Page Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/Login.JPG?raw=true)

__Film Library__  - This where users can look through all the Studio Ghibli Films, read information about those films (Name,  Rotten Tomato Score, Director, Synopsis etc.), review or add it to their watch list.

![Film Library Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/FilmLibrary.JPG?raw=true)
![Film Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/FilmPage.JPG?raw=true)
![Film2 Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/FilmPage2.JPG?raw=true)

__Watch List__ - This is where users can see their bookmarked movies that they plan to watch for easy access.

![WatchList Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/WatchList.JPG?raw=true)

__Reviews__ - Users can write reviews on films that they have watched. They can then see all their written reviews in the "Reviews" page where they can also see how many Ghibli films that they have watched and wrote a review about out of the total.

![Write Review Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/WriteReviewPage.JPG?raw=true)
![Write Review2 Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/WriteReviewPage2.JPG?raw=true)
![Reviews Screenshot](https://github.com/j-Tinga/Ghibli-Film-Reviewer/blob/main/Ghibi%20Screenshots/ReviewPage.JPG?raw=true)

## Additional Notes (Future Work)
- I don't know what happened but my Firebase stopped working days after my final submission, so I had to switch to using a local database through SQLite. Will have to practice and learn more about Firebase.
- idk how to properly do the cool digital design, color schemes, animations etc. on Flutter; "Functionality" nalang sah ang theme sa app. 
- Wanted to add CRUD operations on Reviews but already passed the one week time limit. Will add after final submission is graded
- Login uses static username and password. Will work on it after I fix my Firebase problem.
