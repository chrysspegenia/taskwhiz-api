# TaskWhiz

A kanban style task management app

### Resources used:

- [Email Validation](https://stackoverflow.com/questions/22993545/ruby-email-validation-with-regex)

  - Prompted for a more stricter form of email validation using `/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i`

- [Password Validation](https://github.com/heartcombo/devise/wiki/How-To:-Set-up-simple-password-complexity-requirements)

  - To enhance security, implemented a stricter password format. Password must meet the following criteria:

    - At least 8 characters in length
    - Contains at least 1 uppercase letter (A-Z)
    - Contains at least 1 lowercase letter (a-z)
    - Contains at least 1 number (0-9)
    - Contains at least 1 special character (e.g., !, @, #, $)

- [Update User Information](https://stackoverflow.com/questions/10900664/rails-devise-how-can-i-edit-user-information)

  - Added controller methods to allow users to edit their account information.
  - other [source](https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-edit-their-account-without-providing-a-password)

- [Update User Password](https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-edit-their-password)

  - Added controller method to allow users to change their password.

- [Adding Avatar to Account](https://www.youtube.com/watch?v=BYvzLYRIZK4)

  - Install active storage and adding images to registered accounts.
