<p align="center">
<img src= "docs/readmeicon.png"
    width=“10”>
<h1 align="center"> Reward Precessing Mobile Application</h1>

<a name="readme-top"></a><p align="center">
[![Contributors][contributors-shield]][contributors-url]
</a><p align="center">
[![FlutterBuild][build-shield]][build-url]
[![FrontEnd][frontend-shield]][frontend-url]
[![BackEnd][backend-shield]][backend-url]
</a>
</p>

## Table of Contents
- [Navigating the GitHub pages](#Navigating-the-GitHub-Pages)
- [Project Description](#project-description)
- [Development](#Development)
- [Setup Guide](#Setup-guide)
- [Exporting Firebase Data](#Exporting-Firebase-Data)
- [Importing to Firebase](#Importing-to-Firebase)
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
### Source Code
* [Reward Processing](RewardProcessing/lib)
    * [Questionnaire](RewardProcessing/lib/questionnaire)
    * [Game](RewardProcessing/lib/game)
        * [Level 1](RewardProcessing/lib/game/game_map.dart)
        * [Level 2](RewardProcessing/lib/game/game_map2.dart)

## Project Description
Our mood greatly impacts our decision-making skills by influencing the type of information we attend to and also how we process it. According to research, individuals with depression tend to have negative responses to losses, leading them to make risky decisions. In contrast, those with anxiety are likely to make less risky decisions as they need certainty of outcomes to gain the sense of security.

Presently, there is a wide array of research focusing on the important role of emotions in decision-making and how the change in our mental processes and logic impact our critical-thinking skills. However, most of this research is based on artificial mood-manipulation strategies in controlled laboratory settings. This makes it difficult for the results from these studies to ascertain that this reflects our true decision-making capabilities. This brings us to the importance of our app, where we are able to monitor decision-making skills in response to day-to-day fluctuations in a real-time manner using a gamified approach. Thus,the main objective of this project is to find a method to comprehensively assess emotions and decision-making, and our approach is to design a mobile app.

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

## Importing Data to Firebase
To ensure all participants enter the correct prolific ID, the IDs should be imported to Firebase in advance. Please follow the instructions below:
1. Install node/npm
    1. Mac/Windows: Go to this [link](https://nodejs.org/en/download) to install.
    2. Alternatively, for Mac users, you can install via Homebrew .
        * If Homebrew is not already installed on your machine, please go to this [link](https://docs.brew.sh/Installation).
        * Follow the commands below to install node:
            * `brew update`
            * `brew install node`
    3. Test it:
        * `node -v`
        * `npm -v`
2. Set up Firebase credentials
    1. Download the file [here](docs/credentials.json).
        * For further information, this file was generated by doing these steps:
            1. Generate a private key file for your service account. In the Firebase console, open Settings > Service Accounts.
            2. Click Generate New Private Key, then confirm by clicking Generate Key button.
            3. Rename the JSON file to `credentials.json`.
3. Install the Firebase CLI tool
   1. Follow the instructions provided by Firebase [here](https://firebase.google.com/docs/cli#install_the_firebase_cli). 
   2. Once the Firebase CLI is installed, open your terminal or command prompt. 
   3. Log in to Firebase using the following command: `firebase login`.
4. Import data to Firebase using the given JavaScript code (import.js):
   1. Download the file [here](docs/import.js).
   2. Enter the Prolific IDs at `Line 36` as demonstrated in the file.
      * Make sure that there is no comma at the end of the array
      * ```
        const documentIds = [
            'ProlificID1',
            'ProlificID2',
            'ProlificID3' // no comma here
        ];
        ```
   3. Run `node import.js`.

## Exporting Data From Firebase
To export the data from Firebase into JSON files, please follow the instructions below:
1. If you have not already, please follow the first three steps of [Exporting Firebase Data](#Exporting-Firebase-Data).
2. Export data using the given JavaScript code (export.js):
    1. Download the file [here](docs/export.js).
    2. Run `node export.js`.
    * [This](docs/Student1) is an example of the exported files.

## Our Clients
* Conor Houghton - an associate professor in Computer Science at University of Bristol
* Kimberley Beaumont - a postgraduate student in Digital Health and Care at University of Bristol
* Ian Penton-Voak - a professor in Evolutionary Psychology at University of Bristol

## Stakeholders
### Clients
The clients are members of University of Bristol who are interested in studying the affect of a person's mood on their decision-making skills. At the moment, they have a web page for the questionnaire and the game. However, they want to adapt this to a mobile application which will facilitate the research process.
### Participants
The participants who consent to be part of this study are the primary source of data collection, including the answers to the questionnaire and every movement made on the PacMan which will be analysed later. The application must be easily accessible and contains clear guidance.

## User Stories
### Clients
As researchers, the clients want the participants to have a true naturally-occurring mood states while going through the questionnaire and the game. Thus, the database system will have to designed in order for the clients to analyse the participants decision-making skills in response to their moods through the questionnaire responses and the movements of the game. They will be given full access to our Firebase at the end of the project.

### Participants
Participants need to be able to undergo the research with the same decision strategies in real-world settings. This means they can take part anywhere and anytime. Therefore, both researchers and participants gain benefits from this application.

## License
This project is distributed under the [GNU Affero General Public License v3.0](LICENSE.txt)

## Team Members
- Kaushiki Mudgal
- Warintorn Palarit
- Yichen Zhao
- Haixin Li
- Chongqi Xue

Supporting Mentor: Kejia Zhang

<br />
<p align="center">
    <a href="#readme-top"><strong>⬆︎ Back to top</strong>
</a>
</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/badge/RewardProcessing-Contributors-9cf
[contributors-url]: https://github.com/spe-uob/2022-RewardProcessingApp/graphs/contributors
[build-shield]: https://img.shields.io/badge/Flutter%20Build-Passing-brightgreen
[build-url]: https://github.com/spe-uob/2022-RewardProcessingApp/actions/workflows/CD.yml
[frontend-shield]: https://img.shields.io/badge/Front%20End-Flutter-informational
[frontend-url]: https://flutter.dev/
[backend-shield]: https://img.shields.io/badge/Back%20End-Firebase-yellow
[backend-url]: https://firebase.google.com/