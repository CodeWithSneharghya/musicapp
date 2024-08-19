# MusicApp
## Project files
### `main.dart` 
Here is the code of a music player app. The app is simple and users can see all songs on a list, click any song for details and toggle light or dark theme. The Playlist class contains the songlist and which is the current index. The Song class holds the data on each song, such as their names, artists and images. The Home class creates the UI for our app, which includes creating the App Bar, Drawer and List of songs. MyDrawer class that constructs drawer menu, mostly.

### `song_ui.dart` 
This example defines an user interface (UI) for a music player app. It will show you the track name, artist, and your album cover at the top of your screen with playback controls below. It also has an interactive UI to switch between songs, and control playback which will change as the "Playlist" class gives information.

### `about.dart` 
In this code, we created an About page for a music app. It shows the logo and name of your app, version number…as well as: a tagline (“A music app that plays music!” ), and credits the developers.

### `playlist.dart`
This defines a class called "Playlist" that manages a list of songs, playback controls, and audio player functionality for a music app. It includes features like playing, pausing, resuming, seeking through songs with a slider, playing the next or previous song, resetting the duration, toggling between pause and resume, and keeping track of the current and total song duration. The code also uses getters and setters to access and update playlist information from other parts of the application.

### `my_drawer.dart`
This code defines a widget called "Mydrawer" that creates a navigation drawer for a music app. The drawer includes a banner with an app logo, and two list items: "Home" and "About". Tapping "Home" closes the drawer, while tapping "About" closes the drawer and opens the "AboutPage" in a new screen.

### `mini_player.dart`
It defines a widget called MiniPlayer. It displays information about the currently playing song, including its image, title, artist, and elapsed time. It also provides a play/pause button and allows the user to navigate to a detailed song view by tapping on the player. The code retrieves data from a Playlist provider and formats the elapsed time for display.

### `liked.dart`
This Flutter code displays a "Liked songs" screen with a list of songs fetched from a Playlist provider. It shows details like song title, artist, and image for liked songs only. Tapping a song navigates to a separate song details page (SongUI)

### `account.dart`
This Flutter code implements a "Change account details" screen. Users can input and save their username and email using TextField and TextFormField components. Data is stored locally using SharedPreferences. The code also validates the email format and displays the saved data in a card.

### `history.dart`
This Flutter code displays a "History" screen that shows a list of songs from the playlist's history. It utilizes the Playlist provider class to access the historyPlaylist. Similar to the "Liked songs" screen, it builds a ListView.builder to display each song's details including title, artist, image, and a history icon (Icon(Icons.history_outlined)) in the trailing section.

## Key terms

### Provider
Provider is a state management solution in Flutter that makes it easier to share data across different parts of your app. Imagine you have some data, like a user's name or a list of items, and you want to display it in multiple places in your app. Instead of passing this data down through multiple layers of widgets, you can use Provider to create a single source of truth for that data.

### Consumer
Consumer is a widget that listens to changes in the data provided by Provider. When the data changes, Consumer rebuilds itself and any widgets within it that depend on that data. This ensures that your UI stays up-to-date with the latest information.

### Shared Preferences
It's a simple key-value storage system for storing small amounts of data locally on a user's device. It's ideal for saving app settings, user preferences, or other small pieces of data that need to persist across app sessions.


