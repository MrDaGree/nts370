#!/bin/perl

#request user input for word
printf "Enter a word: ";
my $userInput = <>;

#printing desired word to screen
print "$userInput\n";

#taking off the last character 5 times and printing after each time
chop($userInput);
print "$userInput\n";

chop($userInput);
print "$userInput\n";

chop($userInput);
print "$userInput\n";

chop($userInput);
print "$userInput\n";

chop($userInput);
print "$userInput\n";