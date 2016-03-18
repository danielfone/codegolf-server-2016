# Welcome to Code Golf RCNZ4!

## Objective

Do more with less! Work through the each hole to reduce the code to as few
bytes as possible while still passing the tests.

A few things:

* This is golf, not a security challenge.
    * The infrastructure was hacked together in a week
    * It's trivally easy to break, please don't.
    * Please replace your divots
* Don't feel like you need to do each hole in order, although they are roughly ordered to balance challenge, fun, and brain fatigue.
* There are multiple ways to be competitive:
    * Lowest total score
    * Lowest score for a particular hole
    * First team to achieve par on every hole

## Scoring

Fewer characters is better, except the following aren't counted:

* Final newline
* Entirely blank lines
* Lines that _only_ consist of a comment, i.e. /^\w*#/

## Getting Started

* Make sure you're in the root of the codegolf folder
* Run `test/score` to ensure you can verify your code locally
* Delete some code
* Run `test/score` again to make sure your code still works
* Commit your changes and push
* ???
* Profit

## Ruby

The server is running ruby 2.3.0. The course may run fine on most other ruby
versions (completely untested) but a few language features useful for golfing
may be version specific.

You shouldn't need any gems.

## Testing Locally

`test/score` will test all the scripts in the holes/ directory.

    $ test/score
    Running 01_cat                passed [58 bytes]
    Running 02_fizzbuzz           passed [373 bytes]
    Running 03_adder              passed [287 bytes]
    Running 04_fibonacci          passed [593 bytes]
    Running 05_lettercount        passed [63 bytes]
    Running 06_alphabet           passed [228 bytes]
    Running 07_unindent           passed [654 bytes]
    Running 08_sort_the_textbooks passed [1383 bytes]
    Running 09_anagram            passed [448 bytes]
    Running 10_bigrams            passed [876 bytes]
    Running 11_grades             passed [322 bytes]
    Running 12_tictactoe_1        passed [886 bytes]
    Running 13_tictactoe_2        passed [1401 bytes]
    Running 14_t9                 passed [557 bytes]
    Running 15_levenshtein        passed [2274 bytes]
    Running 16_enhance            passed [763 bytes]
    Running 17_24_game            passed [852 bytes]
    Running 18_old_lady           passed [1694 bytes]
    ----
    Your score: 13712


You can also also pass in path(s) to run a specific hole.

    $ test/score holes/09_anagram.rb
    Running 09_anagram            passed [448 bytes]
    ----
    Your score: 448

The scripts are (almost) all basically unix filters. The test will pipe in
test/cases/$hole/in.txt and verify that the output matches
test/cases/$hole/out.txt

In some cases you might want to check the output yourself:

    $ cat test/cases/08_sort_the_textbooks/in.txt | ruby holes/08_sort_the_textbooks.rb
             _ _ _ _     _         _     _   _                   _           _   _       _
       _    | | | | |_  | |  _   _|D|   | |_| |      _       _  | |_       _| | | |  _  | |          _   _
      | |   | |B| |B| | | |_| |_| |j|   | | |F|  _  | |    _| |_| | |  _  | |R| |R|_| |_| |  _   _  | | | |
      |A|  _|B|i|B|o|B| |C| |C| |D|a|_  |F|F|o|_|G|_|G|_ _|M|M|N|O|P|_|P| |R|a|_|i|R|R|R|S|_|T| |W| |X| |Y|_
     _|p|_|B|a|n|o|o|u|_|#|C|P|D|H|n| | |#|P|o|G|e| |o|H|H|a|a|o|o|P|P|y| |B|n| |n|u|u|y|a|T|u|_|y|_|r|_|r|Z|
    |A|p|B|a|z|g|o|m|s|B| |+|C|+|H|g|D|_| |C| |P|m|G|o|P|a|l|t|d|o|C|a|t|_|N|g|R|g|b|s|t|f|h|b|T|t|X|a|Y|a|a|
    |B|l|B|r| | | | | |y| |+|G|+| |o|o|E| |G| | |s|o|g| |r|c|z|e| |G|t|h|Q|Z|o|e| |y|t|h|e|e|y|y|h|Y|y|Y|y|r|
    |_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|


## Pushing

When you push your repo, a post-receive hook will run the tests and record your score.
The tests are identical to the ones in your local repo, no surprises.
You won't be allowed to push new files to the repo.

Good luck.
