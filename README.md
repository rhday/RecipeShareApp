# RecipeShareApp README

RecipeShareApp is a tool built with Ruby on Rails where users can sign up, share and comment on each other's recipes.

## Installation
```
bundle install
rake db:migrate
rake db:seed
```
## Usage
```
rails s
go to localhost:3000

Sign up to RecipeShareApp on the homepage with username, email and password. Or alternatively with Google.

Login with username and password or with Google.

See all the user posts on the "All Recipes" link in the navbar.

Create a new recipe by clicking on the "Add Recipe" link in the navbar. The user will be asked to fill out the title and content of their recipe and then to select which category it falls under. Then the user must click "Create Post" button to persist their recipe to the database.

A user can comment on any post they like by clicking on the "Comment on this recipe" button. They can also view all the previous comments associated to a specific post by clicking on the "See Comments" link. This is where a user can edit or delete their own comments.

A user can navigate the recipes by category if they see fit. They can do so by clickin gon the "Categories" link in the navbar where they will be given the option of following a link to either "Starters," "Mains" and "Desserts." Once the user has selected the category they would like they will see a list of the recipes in that categories

Logout by clicking the "Logout" link in the navbar.

```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
## License
[MIT](https://choosealicense.com/licenses/mit/)