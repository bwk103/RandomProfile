# RandomProfile
A basic iOS / Android application that selects and returns a random user.

## Problem
During a gathering with friends, someone commented that it might be useful to have a dice showing the names of people in attendance.  As an alternative, I have produced a basic application which makes a random selection from a list of users. 

## Development
The first problem that I faced in designing the application was to determine which platform to develop the application for as, any group of people is likely to contain some iPhone users and some Android users.  Having recently read about Google's Flutter framework, I decided that this would be the ideal opportunity to produce an application which works on both platforms.

### User Stories
 ```
 As a user,
 so that I can select a random person,
 I want to be able to see all members of a group.
 
 ``` 
 
 ```
   As a user,
   so that I dont make a mistake,
   I want to see confirmation of the selected players.
   ```
 
 ```
  As a user,
  so that I can select a random person,
  I want to see the randomly selected person.
  ```
  
  ```
    As a user,
    so that I can change the players,
    I want to be able to add and remove people from the list.
  ```

## Getting Started

The application consists of three screens. The Home screen shows a list of all the possible players.  

The user can then select which of those people they wish to be included in the game by touching the checkbox alongside their name. 

Once all players have been selected, the user moves to the Confirmation screen to check their selections.  

If the user is happy, they then press the forward button, and are taken to the Results screen, displaying the randomly selected user.



### Prerequisites

- The applications are built using dart and Google's Flutter framework.  In order to get started with Flutter, view the online
[documentation](https://flutter.io/).

- Once Flutter is set up, download the repo from [here](https://github.com/bwk103/RandomProfile.git).

### Running the iOS Application:

- If you wish to run the iOS application, first ensure that [Xcode](https://developer.apple.com/xcode/) is installed on your machine.

- Using the terminal, run the following command:
` open -a Simulator` to open an iPhone simulator.  

- Once the simulator is ready, run the command `flutter run` from within the repo directory. 


###Running the Android Application:

- To run the Android application, first ensure that [Android Studio](https://developer.android.com/studio/index.html) is installed on your machine.

- Follow the steps (here)[https://flutter.io/get-started/install/]

- Run `flutter run` from within the repo directory.

#