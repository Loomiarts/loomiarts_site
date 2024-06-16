# Loomiarts website

This is the source code of the Loomiarts website (loomiarts.com), created with Flutter.

## DDD

Although the website is very simple (a home page, an "about" page and a game page), I made the project using DDD only as a proof of concept, since it was my first time using Flutter and I was experimenting how well it would work with this kind of architecture.

And I think it went very well: I created four different modules, imported as completely separated dependencies, one for each layer: domain, infrastructure, application and presentation. The main function inside the main.dart file contains only one line, where it creates the widget application from the presentation layer.

The pages and flows use MVVM, a pattern very usual in mobile development - which seems to work seamlessly with the DDD principles.

Here is a summary on how I used each one of these layers, which I think are very faithful on how I understand DDD:

- Domain (modules/domain): entity classes like Game (containing the properties of a game) and About (containing the properties that will be shown in the about page), plus the *interface* of the repositories for these entities;
- Infrastructure (modules/infrastructure): the *implementation* of the repositories. In the case of Game and About, the repositories are loading data from JSON files;
- Application (modules/application): the viewmodel classes and the *interface* for the routers.
- Presentation (modules/presentation): the widgets for each components and pages, plus the *implementation* of the routers.

I did not include any dependency injection library or something like that. All dependencies are being manually created and injected in the top level layer (presentation), which works okay in a small project like this.
