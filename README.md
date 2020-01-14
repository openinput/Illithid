# Illithid

[![CI Status](https://img.shields.io/travis/openinput/Illithid.svg?style=flat)](https://travis-ci.org/openinput/Illithid)
[![Version](https://img.shields.io/cocoapods/v/Illithid.svg?style=flat)](https://cocoapods.org/pods/Illithid)
[![License](https://img.shields.io/cocoapods/l/Illithid.svg?style=flat)](https://cocoapods.org/pods/Illithid)
[![Platform](https://img.shields.io/cocoapods/p/Illithid.svg?style=flat)](https://cocoapods.org/pods/Illithid)

Illithid is a test helper providing a blank environment for your tests involving the access of
data in `UserDefaults`. The data is read into memory and erased before starting your test,
and restored after your test is done.

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Illithid](#illithid)
	- [Why Illithid?](#why-illithid)
	- [Installation](#installation)
	- [Usage](#usage)
	- [Developing Illithid](#developing-illithid)
		- [Bootstraping your environment](#bootstraping-your-environment)
		- [Updating your environment](#updating-your-environment)
		- [Installing dependencies](#installing-dependencies)
		- [Compiling and running tests](#compiling-and-running-tests)
	- [Author](#author)
	- [License](#license)

<!-- /TOC -->

## Why Illithid?

This library, in some sense, erases the mind of your simulator the same way an
[illithid](https://en.wikipedia.org/wiki/Illithid) may feast on your brain.

[![An illithid (extracted from Eberron Wiki)](readme-files/MindFlayer.jpg)](https://eberron.fandom.com/wiki/Illithid)

## Installation

Illithid is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Illithid'
```

## Usage

In order to use `Illithid` just wrap your test code using the `blankDefaultsWhile` wrapper:

```swift
let userDefaults = UserDefaults()
userDefaults.blankDefaultsWhile { userDefaults in
  // Whatever test involving UserDefaults
}
```

You will have a blank environment while you are running your test. After finishing the test
all the previous values will be restored.

## Developing Illithid

Illithid tries to create a reproducible development environment so we don't suffer from
the _compiles-in-my-machine_ syndrome. In order to achieve that this project uses the following tools
to ensure every developer works with the same setup (we assume you are working on a MacOS based machine):

* [Homebrew](https://brew.sh/) - Used to install some of the tools involved in this setup
* [rbenv](https://github.com/rbenv/rbenv) - Used to set the Ruby version used by the building tools
* [Bundler](http://bundler.io/) - Used to specify the version of the gems used to build the project

In addition to these tools, that are used to bootstrap the environment, we use the following tools
to manage the life cycle of the project:

* [Cocoapods](https://cocoapods.org/) - Dependency management
* [fastlane](https://fastlane.tools/) - Automation for CI/CD
* [slather](https://github.com/SlatherOrg/slather) - Generate code coverage reports
* [Jazzy](https://github.com/realm/jazzy) - Soulful docs for Swift & Objective-C

### Bootstraping your environment

In order to properly build and run the project you should follow the following steps to setup
the development environment (if you haven't done so for other projects).

* Make sure you have Xcode installed, and install the command line tools using the following command:

        $ xcode-select --install

* Install `Homebrew` executing the following command:

        $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

* Install and configure `rbenv`:

    * Execute the following commands to install `rbenv`:

            $ brew update
            $ brew install rbenv
            $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

    * Restart your terminal, or run `source ~/.bash_profile` in order to activate `rbenv`

* Install `Ruby` using the following command:

        $ rbenv install 2.6.2

* Clone the project and `cd` to the directory where you have cloned it. __The following steps
must be run in the project directory so the gems are installed for the proper Ruby version__
* Install `Bundler`:

        $ gem install bundler

* Install the rest of the development tools:

        $ bundle install --path vendor/bundle --binstubs

And that's it! Now you have a standard and reproducible development environment and you can start
to work on Illithid without your blood being drunk!

### Updating your environment

Any time we upgrade any tool in our toolchain you should re-run the previous commands, starting
with the suitable step:

* If we update our `Ruby` version, start from the `Ruby` environment installation
* If we update any version of the tools used to build the project (`Gemfile` changes), re-run
just the installation of the development tools.

In any case, `Bundler` won't let you go ahead if the `Ruby` version used to run the command
differs from the version configured in the project's `Gemfile`.


### Installing dependencies

The next step to start developing is to install the dependencies and generate
the Xcode workspace. Just run the following command:

    $ bin/fastlane pods

Make sure you open the generated `Example/Illithid.xcworkspace`, not the project in
`Example/Illithid.xcodeproj`.

### Compiling and running tests

In order to compile the application and run the tests run the following command:

    $ bin/fastlane test

## Author

José González, jose.gonzalez@openinput.com

## License

Illithid is available under the MIT license. See the LICENSE file for more info.
