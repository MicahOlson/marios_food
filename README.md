<div>
  <img src="app/assets/images/marios-logo-color-bg.png" alt="Mario's logo" width="95%">
</div>

## _Your Source for the Best Quality Food Products!_
### by: Micah L. Olson
### created: 3/17/2021
### updated: 3/26/2021

--- 

## Description
As a **minimum viable product** (MVP) demonstrating knowledge of **Rails with Active Record** and **Authentication and Authorization**, this web application was created to manage products and reviews for a fictional company called *Mario's Speciality Food Products*. The application displays and interacts with a database of available food products and user reviews.  
  
There are three levels of *authorization* in the application:
* All site **visitors** can see the home page, a list of products, and product reviews.
* **Users** (visitors who have signed up for an account and signed in) have the access above, as well as the ability to add new reviews to products.
* And **administrators** can add, update and delete new products, as well as add, update and delete reviews. A site administrator has been included with the seeded users during setup (see below).

---

## Technologies
<table style="border:0;border-color:white">
 <tr>
    <td width=400px>
      <ul>
        <li>Ruby 2.6.5</li>
        <li>Rails 5.2.4</li>
        <li>rake 13.0.3</li>
        <li>Embedded Ruby (ERB)</li>
        <li>PostgreSQL (psql) 12.6</li>
        <li>pg 1.2.3</li>
        <li>Puma 3.12.6</li>
        <li>Bundler 1.17.2</li>
        <li>Bcrypt 3.1.16</li>
        <li>Test-Driven Development (TDD)</li>
      </ul>
    </td>
    <td width=400px>
      <ul>
        <li>Faker</li>
        <li>RSpec 3.10</li>
        <li>shoulda-matchers 4.5.1</li>
        <li>Capybara 3.35.3</li>
        <li>SimpleCov 0.21.2</li>
        <li>Pry 0.14.0</li>
        <li>HTML</li>
        <li>SASS</li>
        <li>Bootstrap-SASS 3.4.1</li>
        <li>git 2.30.1</li>
      </ul>
    </td>
 </tr>
</table>

---

## Requirements
* You will need to use your system's **`terminal` emulator** to set up and locally use this application.

* **`PostgreSQL 12.6`** is required to manage this application's database.  
  <small>
    ([how to install PostgreSQL 12.6](https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-postgres))
  </small>

* You must have **`Ruby 2.6.5`** installed to be able to run this application.  
  <small>
    ([how to install Ruby 2.6.5](https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-ruby))
  </small>

* **`Bundler`** is needed to install all application dependencies. Install it *after* you install `Ruby`.
  ```bash
  $ gem install bundler
  ```

---

## Installation and Setup
* **Clone this repository** to a local directory using the command-line tools `cd` and `git`.  
  <small>
    ([how to install git](https://www.learnhowtoprogram.com/introduction-to-programming/getting-started-with-intro-to-programming/git-and-github))
  </small>
  ```bash
  $ cd ~/<local_directory>/
  $ git clone https://github.com/MicahOlson/marios_food.git
  ```

* **Navigate to the top level directory** of the cloned repository.  
  ```bash
  $ cd marios_food/
  ``` 

* **Install all application dependencies** using `Bundler`.
  ```bash
  $ bundle install
  ```

* **Start the `PostgreSQL` database system** and keep it running while you interact with this application.
  ```bash
  $ postgres
  ```

  * Access the command line again by opening another `terminal` tab. Press and briefly hold these key combinations.  
    `command-t` (macOS) or `control-t` (Windows, GNU/Linux)

  * IMPORTANT! Be sure to **shut the database system down** when you are done using the app.  
    `control-c`

* **Recreate the databases** and **seed** a sample dataset.
  ```bash
  $ rake db:setup
  ```

* The following **database schema** is automatically created by the above command.
  <div>
    <img src="app/assets/images/db_schema.png" alt="A diagram of the database schema" width="60%">
  </div>

* **Launch the local `Puma` web server** to interact with the application in a browser.
  ```bash
  $ rails server
  ```

  * IMPORTANT! Be sure to **shut the web server down** when you are done using the app.  
    `control-c`

* Type **localhost:3000** into your browser's address bar and hit `enter`.

* To use the application with a pre-made administrator role seeded by the `rake db:setup` step above, simply sign in as `admin` using the password `Administrator1!`.

* Creating a new administrator can only be done by setting the user `admin` attribute to `true` in the database.
  * First, create a new user through the web application.
  * Then type the following in `terminal` replacing `<user's password>` in quotes.
    ```bash
    $ rails console
    > user = User.last
    > user.update(admin: true, password_hash: "<user's password>")
    > exit
    ```

---

## Testing
* This application was created following a **test-driven development** (TDD) process.

* ***Unit* and *integration* test suites** can be found in `spec/models` and `spec/features` respectively.

* **Read the test specs** using `cat` (like below), or open the files in a code editor (see **Code Editors**).
  ```bash
  $ cat spec/models/product_spec.rb
  ```

* **Run the tests** yourself using `RSpec` to verify correct program functionality.
  ```bash
  $ rspec
  ```

---

## Code Editors
* **Recommendations** if you would like to utilize a **GUI** for opening or editing this application's files:
  * [Visual Studio Code](https://code.visualstudio.com) - "Code editing. Redefined."
  * [Atom](https://atom.io) - "A hackable text editor for the 21st Century."
  * [SublimeText](https://www.sublimetext.com) - "A sophisticated text editor for code, markup and prose."

---

## Notes, Bugs, Fixes, and Future Improvements
* No known bugs.
* There are no feature enhancements scheduled for this application.
* If you find a bug, please report it at the email address below.

---

## License
[GPLv3](https://choosealicense.com/licenses/gpl-3.0/)  
Copyright &copy; 2021 Micah L. Olson

---

## Contact Information
Micah L. Olson by 
<a href="mailto:micah.olson@protonmail.com" target="_blank">email</a> 
or at 
<a href="https://www.linkedin.com/in/micah-lewis-olson/" target="_blank">LinkedIn</a>.
