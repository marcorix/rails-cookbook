# STEP 1 - Rails App generation
- In the folder with your GitHub name, create a new Rails app called "rails-cookbook".
  Remember to specify PostgreSQL as the Database and to skip action-mailbox installation.
- Create, using the command line (terminal), the postgresql database for this new rails app
- Start the server and open the App in your browser
- Create the relative repository in your Git hub account: gh repo create --public --source=.
- Add, commit and push to your GitHub repository

# STEP 2 - DB schema
- Go to your schema editor and draw the schema. The tables we need are recipes, categories and bookmarks.
  Use the spread sheet as reference

# STEP 3 - Models/Tables Generation
- Create the 3 models using your Terminal (CLI), with the right attributes:
  A recipe has a name (e.g. "Spaghetti Carbonara"), a description ("A true Italian carbonara recipe,it's ready in about 30 minutes.There is no cream...."), an image url and a rating (6.9).
  A category has a name (e.g. "Italian", "Salads", "Breakfast", "Quick&Easy ", … )
  A bookmark adds a recipe to a category (e.g. Spaghetti Carbonara has been added to the “Italian” category). So each bookmark references a recipe and a category, with a comment. The comment field is for the user to add a little note on the bookmark (e.g. "This is a traditional Roman recipe").
- Run the migrations to create the tables in the database.

# STEP 4 - Models Validations
- A recipe must have a unique name and an overview.
- The rating of a recipe must be a value between 0 and 5
- A category must have a unique name.
- A bookmark must be linked to a recipe and a category, and the [recipe, category] pairings should be unique.
- The comment of a bookmark cannot be shorter than 6 characters.

# STEP 5 - Models Associations
- A category has many bookmarks
- A category has many recipes through bookmarks
- A recipe has many bookmarks
- A bookmark belongs to a recipe
- A bookmark belongs to a category
- When you delete a category, you should delete all associated bookmarks
  (but not the recipes as they can be referenced in other categories).

# STEP 6 - Seed file
- Create at least 4 recipes in the seed.rb file
- Run the seed file to populate the DB

# STEP 7 - Routing and Controller for Categories
- Create all the routes except 'Edit' and 'Update'
- Check the routes in the terminal
- Create a new controller using the terminal

# STEP 8 - Views for Categories
- A user can see all the categories here => '/categories'
  * Since there are currently no categories in the database, let's create one/two first using the Rails console.
- A user can see the details of a given category and its name here => '/categories/42'
- A user can create a new category here => 'categories/new'
  * We prefer to use Simple Form in our Rails application, so we need to install it first.
- Create a new category 
