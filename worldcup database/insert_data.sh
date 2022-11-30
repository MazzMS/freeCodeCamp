#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  FIND_WINNER=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
  FIND_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
  
  if [[ $WINNER != 'winner' ]]; then # it is not necessary to add all headers of the .csv file because they are all on the same row
    if [[ -z $FIND_WINNER ]]; then
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_TEAM == "INSERT 0 1" ]]; then
        echo "Inserted winner team into teams, $WINNER"
      fi
    fi
    if [[ -z $FIND_OPPONENT ]]; then
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]]; then
      echo "Inserted opponent team into teams, $OPPONENT"
      fi
    fi  

  # insert data in games table
    FIND_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    FIND_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $FIND_WINNER_ID, $FIND_OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME == "INSERT 0 1" ]]; then
      echo "Inserted game into games, $YEAR $ROUND $FIND_WINNER_ID $FIND_OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS"
    fi
  fi
done
