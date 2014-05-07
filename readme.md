### Just Another [Middleman](http://middlemanapp.com/) Build!
*Save a little time with your application plumbing!*

When I could not locate the stack I wanted, I built it.  Examine the folders, gems, and included js files.  It should include most of the base setup for a solid application.

***
#### Stack Required to Build

1. [homebrew](http://brew.sh/)
2. [rbenv](https://github.com/sstephenson/rbenv)
3. [ruby 2.1.0](https://www.ruby-lang.org/en/)
4. [node.js](http://nodejs.org/) ```brew install node```
5. [bower](http://bower.io/) ```npm install -g bower```

***
#### Template Includes

* [Middleman](http://middlemanapp.com/)
* [slim-lang](http://slim-lang.com/)
* [foundation](http://foundation.zurb.com/)
* [emberjs](http://emberjs.com/)
* [emblemjs](http://emblemjs.com/)
* [Font-Awesome](http://fortawesome.github.io/Font-Awesome/)

***
#### Installation

1. open terminal
2. ```mkdir ~/.middleman```
3. ```git clone https://github.com/chrishough/middleman-slim-foundation-emberjs-emblemjs ~/.middleman/middleman-slim-foundation-emberjs-emblemjs```
4. ```middleman init my_new_app --template=middleman-slim-foundation-emberjs-emblemjs```
5. ```cd my_new_app```
6. ```bundle install```
7. ```bower install```
8. ```rake development```
9. open your browser and navigate to [localhost:4567](http://localhost:4567)

***
#### Rake Tasks Included
* ```rake development``` :: turn up the application server
* ```rake delete``` :: purge the current build
* ```rake build``` :: build the production version
* ```rake clean``` :: remove various caches and directories

***
#### Credits
* [middleman-zurb-foundation](https://github.com/axyz/middleman-zurb-foundation) :: Merged Foundation.
* [middleman-ember-template](https://github.com/GutenYe/middleman-ember-template) :: Merged Ember.
* [page pipeline](https://github.com/middleman/middleman/issues/453#issuecomment-42276716) :: Process + Ignore pages.
* [@arcovion](https://github.com/Arcovion) :: Ty 4 answer my bug reports.

***
Produced and maintained by [@chrishough](http://twitter.com/chrishough).
![zen](https://github.com/chrishough/middleman-slim-foundation-emberjs-emblemjs/raw/master/zen.jpg)
