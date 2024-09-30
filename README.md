# DAY 1 - BACK-END ⚙️

## STEP 1 - Rails App generation
- In the folder with your GitHub name, create a new Rails app called "rails-cookbook".
  Remember to specify PostgreSQL as the Database and to skip action-mailbox installation.
- Create, using the command line (terminal), the postgresql database for this new rails app
- Start the server and open the App in your browser
- Create the relative repository in your Git hub account: gh repo create --public --source=.
- Add, commit and push to your GitHub repository

## STEP 2 - DB schema
- Go to your schema editor and draw the schema. The tables we need are recipes, categories and bookmarks.
  Use the spread sheet as reference

## STEP 3 - Models/Tables Generation
- Create the 3 models using your Terminal (CLI), with the right attributes:
  A recipe has a name (e.g. "Spaghetti Carbonara"), a description ("A true Italian Carbonara recipe,it's ready in about 30 minutes.There is no cream...."), an image url and a rating (6.9).
  A category has a name (e.g. "Italian", "Salads", "Breakfast", "Quick&Easy ", … )
  A bookmark adds a recipe to a category (e.g. Spaghetti Carbonara has been added to the “Italian” category). So each bookmark references a recipe and a category, with a comment. The comment field is for the user to add a little note on the bookmark (e.g. "This is a traditional Roman recipe").
- Run the migrations to create the tables in the database.

## STEP 4 - Models Associations
- A category has many bookmarks
- A category has many recipes through bookmarks
- A recipe has many bookmarks
- A bookmark belongs to a recipe
- A bookmark belongs to a category
- When you delete a category, you should delete all associated bookmarks
  (but not the recipes as they can be referenced in other categories).

## STEP 5 - Models Validations
- A recipe must have a unique name and an overview.
- The rating of a recipe must be a value between 0 and 5
- A category must have a unique name.
- A bookmark must be linked to a recipe and a category, and the [recipe, category] pairings should be unique.
- The comment of a bookmark cannot be shorter than 6 characters.

## STEP 6 - Seed file
- Create at least 4 recipes in the seed.rb file
- Run the seed file to populate the DB

## STEP 7 - Routing and Controller for Categories
- Create all the routes except 'Edit' and 'Update'
- Check the routes in the terminal
- Create a new controller using the terminal

## STEP 8 - Views for Categories
- A user can see all the categories here => '/categories'
  * Since there are currently no categories in the database, let's create one/two first using the Rails console.
- A user can see the details of a given category and its name here => '/categories/42'
- A user can create a new category here => 'categories/new'
  * We prefer to use Simple Form in our Rails application, so we need to install it first.

## STEP 9 - Routing, Controller and Views for Bookmarks
- A user can add a new recipe to an existing category creating a new bookmark (recipe/category pair)
  here => 'categories/42/bookmarks/new'
- On the categories 'show' page, display all the associated recipes.
  * Hint: Take a look at the associations in the Category model.
- A user can remove a recipe from a category (actually, delete a bookmark!)
  Create a delete link for each recipe in the categories 'show' page
  
## STEP 10 - Make the App navigable
- A user should be able to navigate through all the pages without needing to use the browser's URL bar.


# DAY 2 - FRONT-END 🎨

## STEP 1 - Setup Rails App for Front-end

## STEP 2 - Navbar & Banner
- Make a sketch on paper (or excalidraw) of the html structure for the navbar and the banner
- Create the HTML & the CSS
- Refactor the navbar as a partial and render it on every page

## STEP 3 - List of Categories (index)
- Make a sketch on paper (or excalidraw) of the html structure for list of categories
- Create the HTML & the CSS. * Use the LeWagon UI Kit

## STEP 4 - Category's page (show)
- Create the banner using the class .banner
- Create the HTML & the CSS for the recipe cards. * Use the LeWagon UI Kit

## STEP 5 - New Category's page & New Bookmark's page (forms)
- Create a .form-new CSS class to style the form elements on both 'New' pages.


# DAY 3 - IMAGE UPLOAD & API 🛠

## STEP 1 - Cloudinary &  Active Storage
- Follow the setup instruction provided in the Hosting & Image Upload lecture.
- Create a new category uploading an image, then check if the image was attached correctly
- Use the uploaded image as the category card and category's page banner background

## STEP 2.1 - Use a Free Recipe API to populate the DB (get recipes filtered by a category)
- Choose 4 main categories from this list ("Breakfast", "Pasta", "Seafood", "Dessert", "Chicken", "Pork", "Vegetarian", "Beef"). In the seed.rb file for each chosen category make an API call (with open-uri and json ruby libs) using this endpoint: https://www.themealdb.com/api/json/v1/1/filter.php?c=YOUR-CATEGORY. The API will return a list of recipes. For each recipe, print its ID in the terminal.

## STEP 2.2 - Use a Free Recipe API to populate the DB (create recipe instances)
- Define a method #recipe_builder with a parameter id.The method should make a new API call using this end point: https://www.themealdb.com/api/json/v1/1/lookup.php?i=ID. Create a new recipe instance using the data from the response. Call the #recipe_builder method, passing the recipe ID you were printing in the terminal as the argument.
