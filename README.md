# Pokedex
MDB Mini Project #2: Build a Pokedex

The goal is to build a simple Pokedex app for people to look up statistics and information for the over 800 Pokemon currently in existence.

The point of this application is to have a better understanding of cycles and different types of views we can use, such as collection views and table views. At this point, we are essentially putting what we learn to the test into a real-life app that will demonstrate it. 

The criterias for this project are as follows: 

For this project, we are required to layout programmatically (only using Storyboard to set the navigation between ViewControllers but not actually populating each ViewController with subviews). If you are unsure about what this means, ask the instructor! Your app should be easily navigable – use navigation controllers to allow people to go back freely
 
 You will be provided a starter Xcode project with the following files:
- A JSON file containing the raw data for all of the Pokemon, including their name and
statistics.
- A Pokemon object class to represent each Pokemon and stores their attributes.
- A static PokemonGenerator class which parses through the JSON file and creates an array of
all Pokemon. You can get this array by calling PokemonGenerator.getPokemonArray().
Do not edit the JSON or PokemonGenerator files!  They are provided to make data retrieval easier for you. You will also not need to interact directly with the JSON file – just the Pokemon class for accessing attributes and PokemonGenerator for getting the initial array. You may feel free to add any utility functions to the Pokemon class (though not necessary), but do not delete any of the existing code.
There are 3 parts to this project.  Read through all parts before beginning!  They affect each other.
Part 1
- Opens to a search page where users can search either by category or for specific Pokemon.
- Categories include type (“Grass”, “Water”, etc.) as well as minimum attack points, minimum
defense points, and minimum health points
 - ‘Type’ categories should be explicitly presented as different options that the user can
select (do not allow the user to specify types); also, the user can select multiple types
before querying for the list.
 - See the Pokemon class documentation for a list of all types. There are a lot of them, so
think carefully about how you want to present them on the screen. You may need to use
a ScrollView on the search screen if there’s too much information to fit on the window.
 -‘Point’ categories should include a textfield where users specify a cutoff number (for
example, all Pokemon with attack points above 100).
- Individual Pokemon can be searched by name or by number.
- Users should also be able to randomly get a list of 20 different Pokemon.
Part 2
- If the user chooses randomly or by category, the app should move to a screen that displays a list of all the Pokemon that match the criteria.
- This list should be able to toggle between a list view (using a TableView) or a grid view (using a CollectionView) – you’ll want to use a segmented control to switch between these.
- In the list view, each cell should display a small picture, as well as the name and number of the Pokemon. A single search can include as many as 800 Pokemon, so don’t make your cells too big!
- In the grid view, Pokemon should be displayed in square-shaped cells filled with that Pokemon’s image and with its name overlaid on the bottom corner of the image.
Mobile Developers of Berkeley

Part 3
- If the user clicks on one of the Pokemon from the list OR searches for a specific Pokemon in the search page, they should go to a detail screen that displays the Pokemon’s picture, name and number, and all available statistics. This is essentially a “profile” for the Pokemon, so make it look like a profile page.
- Add a button “Add to Favorites” which LOCALLY stores that Pokemon in an array of favorites. You’ll also need to add an additional tab called “My Favorites” to the app (do this using a tab bar controller) where the favorite Pokemon are displayed in a TableView (don’t worry about toggling views here or making the cells clickable, but the cells should look similar to the existing list view).
- Add another button called “Search on the Web” which takes the user to a full WebView displaying the Google Search result for that Pokemon

<img width="257" alt="screen shot 2018-02-16 at 11 55 18 pm" src="https://user-images.githubusercontent.com/31357149/36339260-5078fc9e-1376-11e8-8fdf-6ccfe7d66ab9.png">
<img width="246" alt="screen shot 2018-02-16 at 11 56 18 pm" src="https://user-images.githubusercontent.com/31357149/36339261-509856ca-1376-11e8-87e9-8e74f53afdbf.png">
<img width="252" alt="screen shot 2018-02-16 at 11 58 18 pm" src="https://user-images.githubusercontent.com/31357149/36339262-50c3ff14-1376-11e8-8374-5e5fe9c82e7b.png">
<img width="250" alt="screen shot 2018-02-16 at 11 58 26 pm" src="https://user-images.githubusercontent.com/31357149/36339263-50dd1e18-1376-11e8-8047-fbffec647469.png">
<img width="250" alt="screen shot 2018-02-16 at 11 58 38 pm" src="https://user-images.githubusercontent.com/31357149/36339265-513bc170-1376-11e8-8c95-b4daec79e8be.png">
