New Kata
========
  
  A simple project generator, handy to tryout a new class with a corresponding (r)spec.
  
Features
--------
  
  - Generates a project structure that uses Bundler and Guard
  - Trivial to customize thanks to Thor
  - So simple it can serve as a playground for beginners to Thor, Cucumber and Aruba

Usage
-----
  
  (from within the newkata project dir, until I package the gem)
  bundle
  bundle exec newkata StringCalculator
  
  
EMACS users
-----------      
  
  RVM (through http://www.emacswiki.org/emacs/RvmEl), Bundler and RSpec play nicely with EMACS.
  launch guard under bundler using the current rvm with:
  
    M-x rvm-use-default
    M-x eshell
    
then
        
  cd stringcalculator
  bundle exec guard
