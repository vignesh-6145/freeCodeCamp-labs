#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE TABLE games,teams")
# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  
  if [[ $winner != winner ]]
  then
   #gettting winner ID

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")

    if [[ -z $WINNER_ID ]]
    then 
      WINNER_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      
      if [[ $WINNER_INSERT_RESULT == "INSERT 0 1" ]]
      then
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
          echo $winner , inserted, $WINNER_ID
      fi #checking whther inserted or not

    fi # checking if winner id present

   #getting winner ID

    #Check for opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

    if [[ -z $OPPONENT_ID ]]
    then
      
      OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")

      if [[ $OPPONENT_INSERT_RESULT == "INSERT 0 1" ]]
      then
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
        echo $opponent ,opponent inserted, $OPPONENT_ID
      fi
    fi

    #Check for opponent id

    # Inserting into games table
    GAMES_INSERT_RESULT=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,opponent_id,winner_id) VALUES($year,'$round',$winner_goals,$opponent_goals,$OPPONENT_ID,$WINNER_ID)")
    if [[ $GAMES_INSERT_RESULT == "INSERT 0 1"  ]]
    then
      echo games inserted,$opponent,[,$opponent_id,]
    fi
  fi #check for first row
done