#!/bin/bash -x

#Constants
POSITION=0
WINNING_POSITION=100
noPlay=0
ladder=1
snake=2
#Variables 
position=0
dieCountofPlayer1=0
dieCountofPlayer2=0
player1Position=0
player2Position=0
echo "Welcome to Snake And Ladder Game"
#Winning condition
function playSnakeAndLadder()
{
	position=$1
	# Roll a die to get a random number between 1 to 6
	rollDieOutcome=$((RANDOM%6+1))
	optionCheck=$((RANDOM%3))
	#Check options Noplay/Ladder/Snake
	case $optionCheck in
		$noPlay)
			position=$position
			;;
		$ladder)
			# Exact winning condition
			if(( $((position+rollDieOutcome))>100  ))
			then
				position=$position
			else
				position=$((position+rollDieOutcome))
				position=$position
			fi
			;;
		$snake)
			# Exact restart condition
			if(($position>$rollDieOutcome))
			then
				position=$((position-rollDieOutcome))
				position=$position
			else
				position=$POSITION
			fi
			;;
	esac
	echo $position
}

# Play till 100 for both players

while(($positionForPlayer1!=$WINNING_POSITION && $positionForPlayer2!=$WINNING_POSITION))
do
	((dieCountofPlayer1++))
	player1Position="$(playSnakeAndLadder $player1Position)"
	echo "Player 1 die count $dieCountofPlayer1 : Position $player1Position"
	((dieCountofPlayer2++))
	player2Position="$(playSnakeAndLadder $player2Position)"
	echo "Player 2 die count $dieCountofPlayer1 : Position $player2Position"
done

# Condition to know which player won

if(($player1Position==$WINNING_POSITION))
then
	echo "Congratulations player 1 won you rolled the die for $dieCountofPlayer1 times"
else
	echo "Congratulations player 2 won you rolled the die for $dieCountofPlayer2 times"
fi

