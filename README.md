# Github score


## Problem statement:
David Heinemeier Hansson's github url is https://github.com/dhh .

Github provides information about his public commits in JSON format at https://api.github.com/users/dhh/events/public .

In the JSON data there is an attribute called "type" which denotes what kind of commit it was.

Let's say that we give following score to DHH based on the "type" of the commit

IssuesEvent = 7
IssueCommentEvent = 6
PushEvent = 5
PullRequestReviewCommentEvent = 4
WatchEvent = 3
CreateEvent = 2
Any other event = 1
Task

Write a ruby program which when executed prints the score of https://github.com/dhh . The answer printed on the terminal should be like this.

Calculate the score based on the item results returned only from first page of that API call. Do not worry about pagination.

$ ruby exercise.rb
DHH's github score is xxx


What we are looking for

1) Approach this problem as if it is an application going to production. 
  We don't expect it to be perfect (no production code is), but we also don't want you to hack together 
  a throw-away script. 
  This should be representative of something that you would be comfortable releasing to a production environment. 
  Also, spend whatever amount of time you think is reasonable. 
  You may use whatever gems and tools that you think are appropriate, just provide any special setup 
  instructions when you submit your solution.
  You will not get any extra point for solving the challenge fast. Speed of delivery is not what we are 
  looking for in this challenge.
  We are looking for you to demonstrate your knowledge related to common software practices to 
  include reusability, portability and encapsulation - to name a few.


2) Use plain ruby for solving the problems


