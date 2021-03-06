New Kata
========
[![Build Status](https://travis-ci.org/ameuret/newkata.png?branch=master)](https://travis-ci.org/ameuret/newkata)
[![Code Climate](https://codeclimate.com/github/ameuret/newkata.png)](https://codeclimate.com/github/ameuret/newkata)  
  
  A simple project generator, handy to tryout a new class with a corresponding (r)spec.
  
Features
--------
  
  - Generates a project structure that uses Bundler and Guard
  - Trivial to customize thanks to Thor
  - So simple it can serve as a playground for beginners to Thor, Cucumber and Aruba
  - Gets you coding faster than you can say pinan nidan
  - **NEW:** Optionnally creates a gem structure when launched with `--gem`  (thanks to `bundle gem`)

Installation
------------
  
    gem install newkata
  
Usage
-----
  
    newkata StringCalculator
    cd stringcalculator
    bundle
    bundle exec guard
  
This will create the following project layout:
  
    stringcalculator/
    ├── Gemfile
    ├── Guardfile
    ├── lib
    │   └── stringcalculator.rb
    └── spec
        └── stringcalculator_spec.rb


  
EMACS users
-----------      
  
  RVM (through http://www.emacswiki.org/emacs/RvmEl), Bundler and RSpec play nicely with EMACS.
  Launch guard under bundler using the current rvm with:
  
    M-x rvm-use-default
    M-x eshell
    bundle exec guard
        
