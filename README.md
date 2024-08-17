# MusicApp
## Project files
### `main.dart` 
Here is the code of a music player app. The app is simple and users can see all songs on a list, click any song for details and toggle light or dark theme. The Playlist class contains the songlist and which is the current index. The Song class holds the data on each song, such as their names, artists and images. The Home class creates the UI for our app, which includes creating the App Bar, Drawer and List of songs. MyDrawer class that constructs drawer menu, mostly.

### `song_ui.dart` 
This example defines an user interface (UI) for a music player app. It will show you the track name, artist, and your album cover at the top of your screen with playback controls below. It also has an interactive UI to switch between songs, and control playback which will change as the "Playlist" class gives information.

### `about.dart` 
In this code, we created an About page for a music app. It shows the logo and name of your app, version number…as well as: a tagline (“A music app that plays music!” ), and credits the developers.

### `playlist.dart`
This code defines a class called "Playlist" that manages a list of songs, playback controls, and audio player functionality for a music app. It includes features like playing, pausing, resuming, seeking through songs with a slider, playing the next or previous song, resetting the duration, toggling between pause and resume, and keeping track of the current and total song duration. The code also uses getters and setters to access and update playlist information from other parts of the application.

### `my_drawer.dart`
This code defines a widget called "Mydrawer" that creates a navigation drawer for a music app. The drawer includes a banner with an app logo, and two list items: "Home" and "About". Tapping "Home" closes the drawer, while tapping "About" closes the drawer and opens the "AboutPage" in a new screen.

## Key terms

### Provider
Provider is a state management solution in Flutter that makes it easier to share data across different parts of your app. Imagine you have some data, like a user's name or a list of items, and you want to display it in multiple places in your app. Instead of passing this data down through multiple layers of widgets, you can use Provider to create a single source of truth for that data.

### Consumer
Consumer is a widget that listens to changes in the data provided by Provider. When the data changes, Consumer rebuilds itself and any widgets within it that depend on that data. This ensures that your UI stays up-to-date with the latest information.


