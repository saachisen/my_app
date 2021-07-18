# AllTheStuff

## The Basics

An open source app based on Dart and Flutter.
Simulated in iOs but not developed specifically for any platform. 

## About the App

This example app was created for the Google Flutter Pilot Bootcamp, Summer 2021.

My app was inspired by my wonderful mum, who, when we leave the house, almost always has to go back and get something. To be fair, it’s not just my mum - I realised that I often also forget stuff, or it simply never occurred to me that I’d need it, which is a bit inconvenient when I’m stuck in a summer storm no umbrella! Enter “AllTheStuff” (working title!) - an app that cleverly generates a specific list of the important things you’ll need when you’re going somewhere, so you’re never caught unprepared again.

For the moment, this basic demonstration of the app gets weather data from the internet for London, and asks the user to select where they’re going from a list of common destinations. So for example, if the temperature is over 20 degrees it’ll recommend you take a water bottle; if you’re going to work, it’ll make sure you don’t forget your key card.

In the future I’d like to take user input about mode of transport (so the app can suggest you take a cycle helmet or your railcard etc), get GPS for your location for the weather, and also have a screen with customisable inputs - so if you have allergies you’re reminded to take your epipen for example. The app could eventually integrate with other functions on your phone like your calendar and health, so it can get your schedule automatically and even suggest things like taking sanitary pads when your period is close.

The app concept has huge potential to improve people’s safety and well-being. They could avoid forgetting vital medication, or simple items like bike lights that could genuinely save someone’s life. I would also hope it caters for older people struggling with memory, so they don’t get locked out for example or have to feel anxious or dependent on others.

Thanks to Google for the great app development course (my very basic execution will probably reveal I had no experience before this!) and I hope you like my idea - I’ve been delighted to see it come to life in a small way!

Saachi

## Running in iOs:

Follow the installation instructions set out in the [Flutter Docs](https://flutter.dev/docs/get-started/ "Flutter Get Started Guide"]

Clone this repository, open the iOs simulator, and do a 'flutter run'.

## Interacting with the App

Click any of the options on the home page for where you're going.

The app uses this information and weather data that it pulls in behind the scenes to generate a list of items you'll need when you leave the house.
