![Portada-Github-RickMorty-SwiftUIt](https://github.com/Carlos-Morgado/rick-and-morty-swiftui/assets/122310905/b77dd8f6-cce2-4dd5-b593-046666b5bc9b)

<h1 align="center"> Rick&Morty (SwiftUI Version) </h1>

> ##### If you like this project, support it by "★ Star" in the repository. Thank you!

<p align="center">

Rick&Morty is an American television series that narrates the adventures of Rick, a peculiar and crazy genius; and Morty, his shy and not very smart grandson. This application tries to show all the different contents of this TV show. You can search through hundreds of characters, episodes, and discover all the planets that create this universe.

The aim of this application is to compare the differences with the application [Rick&Morty UIKit Version](https://github.com/Carlos-Morgado/rick-and-morty-ios), whose design pattern is VIPER and uses the UIKit framework. On this occasion, the MVVM architecture and the SwiftUI framework have been used.
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

This project uses Model-View-ViewModel Architecture and is separated into four main layers:

* **Core**: Contains the common code between the other layers, like extensions, reusable views for all the aplications, and managers. These are abstractions of important parts used in the app, such as making network requests.
* **Data**: The "data" folder represents the data and business logic of the app. Inside this folder we find the following components:
  * The **DataSource** is responsible for obtaining the data used in the application and passing it to the ViewModel.
  * The **Model** are the data models (DTO), which are the object representation of the JSON request.
* **ViewModel**: The ViewModel is the mediator between the View and the Data layer. It is in charge of connecting these two components but in a special way. On the one hand it feeds the view with the information coming from the Data Source. On the other hand, it is in charge of receiving actions from the View, and these actions can stay in the ViewModel or can be passed to the Data Source.
* **View**: The view is the visual representation of the information coming from the ViewModel. And it has a double function, on the one hand it is in charge of launching actions to the ViewModel and on the other hand it is in charge of listening for changes in some of the properties of the ViewModel.

## Architecture Scheme
  
<p align="center">
  <img width="1920" src="https://github.com/Carlos-Morgado/rick-and-morty-ios/assets/122310905/09b834aa-7579-4d65-b19d-1283685c1b7a">
</p>

## Folder Structure

```markdown
📦rick-and-morty
┣ 📂Resource
┗ 📂Source
  ┣ 📂App
  ┣ 📂Core
  ┣ 📂Module
  ┃ ┣ 📂TabBar
  ┃ ┣ 📂Characters
  ┃ ┃ ┣ 📂View
  ┃ ┃ ┗ 📂ViewModel
  ┃ ┣ 📂CharacterDetail
  ┃ ┃ ┣ 📂View
  ┃ ┃ ┗ 📂ViewModel
  ┃ ┣ 📂Episodes
  ┃ ┃ ┣ 📂View
  ┃ ┃ ┗ 📂ViewModel
  ┃ ┣ 📂EpisodeDetail
  ┃ ┃ ┣ 📂View
  ┃ ┃ ┗ 📂ViewModel
  ┃ ┣ 📂Locations
  ┃ ┃ ┣ 📂View
  ┃ ┃ ┗ 📂ViewModel
  ┃ ┗ 📂LocationsDetail
  ┃   ┣ 📂View
  ┃   ┗ 📂ViewModel
  ┗ 📂Data
    ┣ 📂Characters
    ┃ ┣ 📂DataSource
    ┃ ┗ 📂Model
    ┣ 📂Episodes
    ┃ ┣ 📂DataSource
    ┃ ┗ 📂Model
    ┗ 📂Locations
      ┣ 📂DataSource
      ┗ 📂Model
```
## Tools & Frameworks Used

| Tool                                                                                                  | Used for                                                             |
|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| MVVM                                                                                                  | Architectural design pattern for separating the logic form the views |
| SwiftUI                                                                                               | Framework used to build apps                                         |
| Kingfisher                                                                                            | Library for downloading and caching images from the web.             |
| Swift Package Manager                                                                                 | Dependency manager                                                   |

## Development Environment
* Xcode 15.0

## Author
* [**Carlos Morgado**](https://www.linkedin.com/in/carlos-morgado-alarcon/)
