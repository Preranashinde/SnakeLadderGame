#!/bin/bash -x

#Constants
POSITION=0
WINNING_POSITION=100
#Variables 
position=0
noPlay=0
ladder=1
snake=2
echo "Welcome to Snake and Ladder game"
# Roll a die to get ranmdom number between 1 to 6
#Winning condition
while(($position!=$WINNING_POSITION))
do
	rollDie=$((RANDOM%6+1))
	echo "Roll die output is:" $rollDie
	selectOption=$((RANDOM%3))
	case $selectOption in
		$noPlay)
			echo "Player current position is:"$position
			echo "You stay in same position:"$position
			position=$position
			;;
		$ladder)
			echo "Player current position is :" $position
			echo "You climb a ladder."
			# Exact winning condition
			if(( $((position+rollDie))>100  ))
			then
				position=$position
				echo "Player current position is:"$position
			else
				position=$((position+rollDie))
				echo "New position of player is:"$position
			fi
			;;
		$snake)
			echo "You swalloed by snake."
			echo "Player current position is :" $position
			# Exact restart condition
			if(($position<0))
			then
				echo "New position of player is:" $POSITION
				position=$POSITION
			else
				position=$((position-rollDie))
				echo "New position of player is:" $position
				position=$position
			fi
			;;
	esac
done
