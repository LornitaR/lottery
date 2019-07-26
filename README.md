# README

## Problem

Create a REST interface to a simple lottery system. The rules of the game are described below.  

### Lottery Rules

You have a series of lines on a ticket with 3 numbers, each of which has a value of 0, 1, or 2. For each ticket if the sum of the values on a line is 2, the result for that line is 10. Otherwise if they are all the same, the result is 5. Otherwise so long as both 2nd and 3rd numbers are different from the 1st, the result is 1. Otherwise the result is 0.

### Implementation

Implement a REST interface to generate a ticket with n lines. Additionally we will need to have the ability to check the status of lines on a ticket. We would like the lines sorted into outcomes before being returned. It should be possible for a ticket to be amended with n additional lines. Once the status of a ticket has been checked it should not be possible to amend.

## My Solution

/tickets               POST Creates a ticket with the number of lines requested  
/tickets               GET Gets a list of all tickets  
/tickets/{id}          GET Gets individual ticket, including the score for each line  
/tickets/{id}          POST Add lines to a ticket  
/tickets/{id}/status   PUT Sets a ticket status to checked so it can't be amended  

### Tests Included

Checks to make sure all calls are made successfully  
Check that ticket score is calculated correctly  
Manually tested all calls with Postman  