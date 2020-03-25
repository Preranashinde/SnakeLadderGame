#!/bin/bash -x
#Constants
POSITION=0

#Variables 
position=0
noPlay=0
ladder=1
snake=2
ladderCount=0
snakeCount=0

#At start position with single player
echo "Welcome to Snake And Ladder Game"

#Roll a die to get ranmdom number between 1 to 6
rollDie=$((RANDOM%6+1))
echo $rollDie

checkOption=$((RANDOM%3))
case $checkOption in
	$noPlay)
		echo "Player current position is:" $position
		echo "Player stays in same position:" $position	;;
	$ladder)
		((ladderCount++))
		echo "Player current position is :" $position
		position=$((position+rollDie))
		echo "You climb a ladder and new position is:" $position ;;
	$snake)
		((snakeCount++))
		echo "Player current position is :" $position
		position=$((position-rollDie))
		if(($position<0))
			then
				echo "You run into a a snake and new position is:" $position
				position=$position
			else
				echo "You run into a snake and new position is:" $position
				position=$position
		fi
		;;
esac
