New Kata
========
  
  A simple project generator, handy to tryout a new class with a corresponding (r)spec.
  
Features
--------
  
  - Generates a project structure that uses Bundler and Guard
  - Trivial to customize thanks to Thor
  - So simple it can serve as a playground for beginners to Thor, Cucumber and Aruba
  - Gets you coding faster than you can say pinan nidan

Installation
------------
  
    gem install newkata
  
Usage
-----
  
    newkata StringCalculator
    cd stringcalculator
    bundle
    bundle exec guard
  
  
EMACS users
-----------      
  
  RVM (through http://www.emacswiki.org/emacs/RvmEl), Bundler and RSpec play nicely with EMACS.
  Launch guard under bundler using the current rvm with:
  
    M-x rvm-use-default
    M-x eshell
    bundle exec guard
        
