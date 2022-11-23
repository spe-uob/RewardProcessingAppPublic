# Studying Reward Processing Through a Mobile App

## Table of Contents
- [Navigating the GitHub pages](#Navigating-the-GitHub-pages)
- [Project Description](#project-description)
- [Developer Guide](#Developer-Guide)
- [Deployment](#Deployment)
- [Our Clients](#our-clients)
- [Stakeholders](#stakeholders)
- [User Stories](#user-stories)
- [License](#license)
- [Team Members](#team-members)

## Navigating the GitHub Pages
### Documentation
* [Kanban Board](https://github.com/spe-uob/2022-RewardProcessingApp/projects/1)
* [Meeting Minutes](https://github.com/spe-uob/2022-RewardProcessingApp/tree/main/Meetings)
### Code
* [Homescreen](https://github.com/spe-uob/2022-RewardProcessingApp/tree/main/homescreen/lib)

## Project Description
Our mood greatly impacts our decision-making skills by influencing the type of information we attend to and also how we process it. According to research, individuals with depression tend to have negative responses to losses, leading them to make risky decisions. In contrast, those with anxiety are likely to make less risky decisions as they need certainty of outcomes to gain the sense of security.

Presently, there is a wide array of research focusing on the important role of emotions in decision making and how the change in our mental processes and logic impact our critical-thinking skills. However, most of this research is based on artificial mood-manipulation strategies in controlled laboratory settings. This makes it difficult for the results from these studies to ascertain that this reflects our true decision-making capabilities. This brings us to the importance of our app, where we are able to monitor decision-making skills in response to day-to-day fluctuations in a real-time manner using a gamified approach. Thus,the main objective of this project is to find a method to comprehensively assess emotions and decision making, and our approach is to design a mobile app(Android).

## Developer Guide
### Local build
* Clone the repository
`<https://github.com/spe-uob/2022-RewardProcessingApp.git>`
### Test
* get dependencies command
`<flutter pub get>`
* clean dependencies command
`<flutter clean>`
* Run command of the code
`<flutter run>` or `<flutter run -d chrome/edge>`

### Languages
* HTML
* Dart
### Platform
* Flutter  
  We develop this application with flutter because it supports both ios and Android application development.Flutter is Google's open-source build user interface (UI) toolkit that helps developers efficiently build multi-platform, beautiful applications across mobile, Web, desktop, and embedded platforms from a single code base.
* Unity
 We will use unity to create the graphics and deisgn our game. Unity is a real-time 3D interactive content creation and operation platform. From game development, to art, to architecture, to car design, to film and television, all creators use Unity to bring their ideas to life. The Unity platform provides a comprehensive suite of software solutions for creating, operating and monetizing any real-time interactive 2D and 3D content on mobile phones, tablets, PCS, game consoles, augmented reality and virtual reality devices.

## Deployment
To connect Flutter and unity to achieve the purpose of embedding Unity with Flutter, use Flutter-union-View-Widget.
The Flutter-Unity-View-Widget provides a dependency export plug-in for Unity to build the Unity project into Android and IOS dependency libraries. The Flutter-Unity-View-Widget provides a component library for Flutter, rendering Unity views as components, and provides a Flutter, Unity bidirectional communication interface.

Note: Supports only Unity 2019.4.3 or later. Emulator is not supported.

### API
* `<pause()>` (Use this to pause unity player)
* `<resume()>` (Use this to resume unity player)
* `<unload()>` (Use this to unload unity player) *Requires Unity 2019.4.3 or later
* `<quit()>`(Use this to quit unity player)
* `<postMessa>`(String gameObject, methodName, message) (Allows you invoke commands in Unity from flutter)
* `<onUnityMessage(data)>` (Unity to flutter binding and listener)
* `<onUnityUnloaded()>` (Unity to flutter listener when unity is unloaded)
* `<onUnitySceneLoaded(String name, int buildIndex, bool isLoaded, bool isValid,)>` (Unity to flutter binding and listener when new scene is loaded)


## Our Clients
Our clients are Conor Houghton (an associate professor in Computer Science at University of Bristol), Ian Penton-Voak (a professor in Evolutionary Psychology at University of Bristol), and Kimberley Beaumont (a postgraduate student in Digital Health and Care at University of Bristol).

## Stakeholders
- Clients: Conor Houghton, Ian Penton-Voak, and Kimberley Beaumont
- University of Bristol's Department of Digital Health and Care
- Participants of Questionnaire and Surveys
- RewardProcessingApp Team
- Mentor (Kejia Zhang)
- End-users (who are easily affected by mood, especially those with mood disorders)

## User Stories

##Goals
### Player
As a player, I want to play this game with the same strategy as the real-world settings, know the impact of mood on decision-making and get the state of mind.

### Researcher
As a researcher, I want players to have a true naturally-occurring mood states while playing the game in order to analyse their mental state in response to the game data.

## License
This project is distrubited under the [GNU Affero General Public License v3.0](LICENSE.txt)

## Team Members
- Kaushiki Mudgal
- Warintorn Palarit
- Yichen Zhao
- Haixin Li
- Chongqi Xue

Supporting Mentor: Kejia Zhang
