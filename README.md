# Studying Reward Processing Through a Mobile App

<p align="center">
<a>

   <img  height="22"
         width="150" 
         src="https://img.shields.io/badge/Porject-RewardProcessing-9cf" />
    <img height="22"
         width="100" 
         src="https://img.shields.io/badge/Version-v0.0.2-9cf"/>
</a>
</p>

## Table of Contents
- [Navigating the GitHub pages](#Navigating-the-GitHub-pages)
- [Project Description](#project-description)
- [Development](#Development)
- [Setup Guide](#Setup-guide)
- [Our Clients](#our-clients)
- [Stakeholders](#stakeholders)
- [User Stories](#user-stories)
- [License](#license)
- [Team Members](#team-members)

## Navigating the GitHub Pages
### Documentation
* [Kanban Board](https://github.com/spe-uob/2022-RewardProcessingApp/projects/1)
* [Meeting Minutes](https://github.com/spe-uob/2022-RewardProcessingApp/tree/main/Meetings)
* [Gantt Chart](https://github.com/spe-uob/2022-RewardProcessingApp/blob/main/RewardProcessinApp%20Gantt%20chart.xlsx)
### Code
* [RewardProcessing](https://github.com/spe-uob/2022-RewardProcessingApp/tree/main/RewardProcessing/lib)
## Project Description
Our mood greatly impacts our decision-making skills by influencing the type of information we attend to and also how we process it. According to research, individuals with depression tend to have negative responses to losses, leading them to make risky decisions. In contrast, those with anxiety are likely to make less risky decisions as they need certainty of outcomes to gain the sense of security.

Presently, there is a wide array of research focusing on the important role of emotions in decision-making and how the change in our mental processes and logic impact our critical-thinking skills. However, most of this research is based on artificial mood-manipulation strategies in controlled laboratory settings. This makes it difficult for the results from these studies to ascertain that this reflects our true decision-making capabilities. This brings us to the importance of our app, where we are able to monitor decision-making skills in response to day-to-day fluctuations in a real-time manner using a gamified approach. Thus,the main objective of this project is to find a method to comprehensively assess emotions and decision-making, and our approach is to design a mobile app(Android).

## Development
* **Front-end**: We develop this application with Flutter (uses Dart) since it supports both iOS and Android application development. Flutter was released in 2017 by Google. It is an open-source user interface (UI) software development kit that helps developers efficiently build multi-platform, beautiful applications across mobile, web, desktop, and embedded platforms from a single code base. We will use Flutter to implement both the questionnaire and the game part of our project. Please follow this [link](https://docs.flutter.dev/) to learn more about Flutter.
* **Back-end**: For our backend, we use Firebase to store our data. It is a hosting service for any application. It offers a real-time hosting of databases and does not require an SQL server. We will be storing our data in Firestore Database. For more information, please follow this [link](https://firebase.flutter.dev/docs/firestore/overview).

## Setup Guide
Clone the repository by typing `git clone https://github.com/spe-uob/2022-RewardProcessingApp.git` in your terminal.

You will need to install the following to build the application:
* [Flutter Packages](https://docs.flutter.dev/get-started/install)
* [Android Studio](https://developer.android.com/studio)
* An emulator for iOS and Android devices
### Test and Run
To run this application, chance directory to `RewardProcessing` in your terminal and do `flutter run`. You will be asked to connect to an emulator or a physical device in order to run the application.
### Build
* iOS: `flutter build ios --release --no-codedesign`
* Android: `flutter build apk`

## Our Clients
* Conor Houghton - an associate professor in Computer Science at University of Bristol
* Kimberley Beaumont - a postgraduate student in Digital Health and Care at University of Bristol
* Ian Penton-Voak - a professor in Evolutionary Psychology at University of Bristol

## Stakeholders
- Clients: Conor Houghton, Kimberley Beaumont and Ian Penton-Voak
- University of Bristol's Department of Digital Health and Care
- Participants of Questionnaire and Surveys
- RewardProcessingApp Team
- Mentor (Kejia Zhang)
- End-users (who are easily affected by mood, especially those with mood disorders)

## User Stories

### Player
As a player, I want to play this game with the same strategy as the real-world settings, know the impact of mood on decision-making and get the state of mind.

### Researcher
As a researcher, I want players to have a true naturally-occurring mood states while playing the game in order to analyse their mental state in response to the game data.

## License
This project is distributed under the [GNU Affero General Public License v3.0](LICENSE.txt)

## Team Members
- Kaushiki Mudgal
- Warintorn Palarit
- Yichen Zhao
- Haixin Li
- Chongqi Xue

Supporting Mentor: Kejia Zhang
