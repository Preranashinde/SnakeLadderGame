#!/bin/bash -x

#Variables 
position=0

#At start position with single player
echo "Welcome to Snake And Ladder Game"

#Roll a die to get ranmdom number between 1 to 6
rollDie=$((RANDOM%6+1))
echo $rollDie
