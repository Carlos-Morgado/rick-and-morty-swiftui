![Portada-Github-RickMorty-SwiftUIt](https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/b77dd8f6-cce2-4dd5-b593-046666b5bc9b)

<h1 align="center"> Rick&Morty (SwiftUI Version) </h1>

> ##### If you like this project, support it by "★ Star" in the repository. Thank you!

<p align="center">
<br>
Rick&Morty is an American television series that narrates the adventures of Rick, a peculiar and crazy genius; and Morty, his shy and not very smart grandson. This application tries to show all the different contents of this TV show. You can search through hundreds of characters, episodes, and discover all the planets that create this universe.
 <br>
 <br>
This application was created with the aim of learning new skills of the iOS development environment, such as the VIPER architecture, UIKit framework, Cocoapods... and more.
<br>
</p>

<!-- TOC -->

* [How it looks](#how-it-looks)
* [Architecture Design](#architecture-design)
* [Folder Structure](#folder-structure)
* [Tools & Frameworks Used](#tools--frameworks-used)
* [Development Environment](#development-environment)

<!-- TOC -->

## How it looks

| Characters List | Character Detail | Episodes List |
| :-: | :-: | :-: |
| <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/327835ba-8189-4be9-8de6-f42db6dbb4c8"/> | <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/df0f7362-a5f8-4d5b-a44b-dc954c66b6e0"/> | <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/d498644d-aecb-46f4-842f-15f7454ac1cf"/> 
| Episode Detail | Locations List | Location Detail |
| <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/9fb923ed-bb54-4c3a-9ba4-a4839d7e110d"/> | <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/899dba00-5ac9-4fec-8163-d7941b365ba3"/> | <img width="250" src="https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/047d8542-6519-4fa8-9296-d55c3ac03946"/>

## Architecture Design

This project uses Clean Architecture and is separated into four main layers:

* **Data**: In this folder are the **(DTO)** data models, which are the object representation of the JSON request, and the **Data Source**, which is in charge of the data request to obtain the characters, episodes, or locations. 
* **Domain**: The information obtained by the DataSource goes to the Interactor, whose mission is to pass this information to the presenter. Also, this is where the business logic takes place.
* **Module**: Inside this layer we find 3 fundamental pieces in the development of the architecture:
  * The **Presenter** is the most important component of VIPER next to the interactor as it acts as a bridge between the VIPER modules and contains the presentation logic. It receives events from the view and reacts to them by requesting the necessary data from the interactor. In the opposite direction it receives the data from the interactor, applies the logic and prepares the content to be passed to the view for display.
  * The **Router** links and creates the different modules of the application, and also has the task of navigating between views. It must implement a protocol that includes all the navigation possibilities between modules.
  * The **View** is a ViewController that contains programmatically implemented sub-views. The view has the responsibility of displaying in the interface the information coming from the presenter and collecting events from the user by delegating them to the presenter.
* **Core**: Contains the common code between the other layers, like extensions, reusable views for all the aplications, and managers. These are abstractions of important parts used in the app, such as making network requests.

## Architecture Scheme
  
<p align="center">
  <img width="1920" src="https://github.com/Carlos-Morgado/rick-and-morty-ios/assets/122310905/09b834aa-7579-4d65-b19d-1283685c1b7a">
</p>

## Folder Structure

```markdown
📦rick-and-morty
┣ 📂Resource
┗ 📂Source
  ┣ 📂AppDelegate
  ┣ 📂Core
  ┣ 📂Presentation
  ┃ ┣ 📂Splash
  ┃ ┣ 📂TabBar
  ┃ ┣ 📂Characters
  ┃ ┣ 📂CharacterDetail
  ┃ ┣ 📂Episodes
  ┃ ┣ 📂EpisodeDetail
  ┃ ┣ 📂Locations
  ┃ ┗ 📂LocationsDetail
  ┣ 📂Domain
  ┃ ┣ 📂GetCharacters
  ┃ ┃ ┣ 📂Interactor
  ┃ ┣ 📂GetCharacterDetail
  ┃ ┃ ┣ 📂Interactor
  ┃ ┣ 📂GetEpisodes
  ┃ ┃ ┣ 📂Interactor
  ┃ ┣ 📂GetEpisodeDetail
  ┃ ┃ ┣ 📂Interactor
  ┃ ┗ 📂GetLocations
  ┃   ┗ 📂Interactor
  ┗ 📂Data
    ┣ 📂Characters
    ┃ ┣ 📂DataSource
    ┃ ┗ 📂DTO
    ┣ 📂Episodes
    ┃ ┣ 📂DataSource
    ┃ ┗ 📂DTO
    ┗ 📂Locations
      ┣ 📂DataSource
      ┗ 📂DTO
```

## Tools & Frameworks Used

| Tool                                                                                                  | Used for                                                             |
|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| VIPER                                                                                                 | Architectural design pattern for separating the logic form the views |
| UIKit                                                                                                 | Framework used to build apps                                         |
| Kingfisher                                                                                            | Library for downloading and caching images from the web.             |
| Cocoapods                                                                                             | Dependency manager                                                   |

## Development Environment
* Xcode 15.0
