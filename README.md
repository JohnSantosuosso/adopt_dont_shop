# Adopt, don't Shop

### Existing database design
![visual-schema.png](https://i.postimg.cc/0ywZgQ1W/visual-schema.png)

## Learning Goals

In this project, Users will be able to apply to adopt pets, and Admins will be able to approve or reject applications and see statistics for the Shelters, Pets, and Applications in the system.

* Build out CRUD functionality for a many to many relationship
* Use ActiveRecord to write queries that join multiple tables of data together
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Validate models and handle sad paths for invalid data input
* Use flash messages to give feedback to the user
* Use partials in views
* Use `within` blocks in tests
* Track user stories using GitHub Projects
* Deploy an application to Heroku


**_Getting Started_**

 1.  **Create a new directory on your computer where you'd like the program to live** 

     ```mkdir /Users/your_user_name/your_folder/adopt_dont_shop```
  
 2.  **Navigate into the recently created directory** 

     ```/Users/your_user_name/your_folder  $cd adopt_dont_shop ```
  
 3.  **Clone the repository by clicking on the code button on Github repo page. Then, copy the repo information using SSH.**

     ![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)


  
 4.  **Inside the recently created directory, clone the recently copied repository information** 

      ```$git clone git@github.com:JohnSantosuosso/adopt_dont_shop.git```

 5. **Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below.** 

     ```$code```

 6.  **Reset and create & database:** 

     ```$rails db:{drop,create,migrate,seed}```

 7.  **How to run the test suite:**

     ```rspec spec```

 8.  **Viewing instructions:**

     Run ```rails s``` in terminal.  
     In your web browser, enter the URL ```localhost:3000``` and enter the site.
