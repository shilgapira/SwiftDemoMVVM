# SwiftDemoMVVM

An example project I used as a demo for my talk on "MVVM with Swift" at the [Swift Show & Tell meetup](http://www.meetup.com/Tel-Aviv-iOS-Developers-Meetup/events/199743652/). The slides are available [here](http://gil.sh/talks/mvvm/).

The project implements a simple app for tracking how much money you owe to other people.

Requires Xcode 6 for running on iOS and Xcode 6.1 for running on OS X.


## Usage

Select the `Payback` target to run the iOS app or the `PaybackKitOSX` target to run the unit tests.


## Details

The project's main target `Payback` builds the iOS app. This target represents the View layer of the application and the only classes that belong to it are the two view controllers, one for viewing the list of debts and another for adding new debts.

The Model and View Model layers are part of the framework targets. The same classes are used to build both the iOS framework `PaybackKit` and the OS X framework `PaybackKitOSX`. The former is linked to the main target to when building the iOS application and the latter is used to run the unit tests.


## Read More

Here are a few pointers for learning more about MVVM.

- Introduction to MVVM on [objc.io #13](http://www.objc.io/issue-13/mvvm.html) covers the basics pretty well
- Justin Spahr-Summers had a great talk on MVVM for Xamarin development, though the lessons easily apply to regular iOS and Android dev as well. ([slides](http://www.slideshare.net/Xamarin/git-hub-halp-app-minimizing-platformspecific-code-with-mvvm-by-justin-spahrsummers) and [video](http://www.youtube.com/watch?v=dHlwC-UNkxs))
- ReactiveCocoa is often used to facilitate bindings between the different layers in MVVM. I haven't used the current Objective-C iteration myself - it felt too out of place in idiomatic code - but I recommend following the [ReactiveCocoa swift branch](https://github.com/ReactiveCocoa/ReactiveCocoa/tree/swift-development) which seems promising.

More sources can be found by googling, though many are in the context of Microsoft technologies rather than iOS development or mobile in general. In particular there isn't a lot of iOS example code to learn from for people who are new to the subject. I hope to add more documentation to this project to hopefully fill some of this need.


## Todo

As mentioned above the code is missing documentation in the form of comments and explanations. It should also be quite easy to demonstrate the ability to reuse the Model and View Model layers in OS X code by adding a Cocoa application or even a command line frontend. Pull requests are very welcome.
