#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

play_game(){
  echo "Guess the secret number between 1 and 1000:"
  B_SCORE=$($PSQL  "SELECT bscore FROM user_info WHERE user_id=$1")
  MOVES=0
  SECRET_NUMBER=$((1 + $RANDOM % 1000))
  while [[ $GUESS != $SECRET_NUMBER ]]
  do
  read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $GUESS < $SECRET_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $GUESS > $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      fi
      MOVES=$(($MOVES+1))
      
    else
      echo "That is not an integer, guess again:"
    fi
  done
  
  N_GAMES=$($PSQL "SELECT nGames FROM user_info WHERE user_id=$USER_ID")
  B_SCORE=$($PSQL "SELECT bScore FROM user_info WHERE user_id=$USER_ID")
  UPDAE_N_GAME=$($PSQL "UPDATE user_info SET ngames=(ngames+1) WHERE user_id=$USER_ID")
  if [[ $B_SCORE == -1 || $MOVES < $B_SCORE ]] 
  then
    UPDAE_N_GAME=$($PSQL "UPDATE user_info SET bscore=$MOVES WHERE user_id=$USER_ID")
  fi
  echo -e "\nYou guessed it in $MOVES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

echo "Enter your username:"
read USER_NAME
USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE name='$USER_NAME'")
if [[ -z $USER_ID ]]
then
  USER_INSERTION_RESULT=$($PSQL "INSERT INTO user_info(name) VALUES('$USER_NAME')")
  if [[ -z $USER_INSERTION_RESULT ]]
  then
    echo "Failed to insert"
  else
    USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE name='$USER_NAME'")
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
  fi
else
  N_GAMES=$($PSQL "SELECT nGames FROM user_info WHERE user_id=$USER_ID")
  B_SCORE=$($PSQL "SELECT bScore FROM user_info WHERE user_id=$USER_ID")
  echo -e "\nWelcome back, $USER_NAME! You have played $N_GAMES games, and your best game took $B_SCORE guesses."
  
fi
play_game $USER_ID