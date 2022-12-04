#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

RANDOM_NUMBER=$(( 1 + RANDOM % 1000 ))
TRIES=1

function FIND_NUMBER() {
  if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read NUMBER
    FIND_NUMBER $NUMBER
  elif [[ $1 -eq $RANDOM_NUMBER ]]; then
    echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  elif [[ $1 -lt $RANDOM_NUMBER ]]; then
    (( TRIES++ ))
    echo "It's higher than that, guess again:"
    read NUMBER
    FIND_NUMBER $NUMBER
  elif [[ $1 -gt $RANDOM_NUMER ]]; then
    (( TRIES++))
    echo "It's lower than that, guess again:"
    read NUMBER
    FIND_NUMBER $NUMBER
  fi
}

echo -e "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]; then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  BEST_GAME=$($PSQL "SELECT MAX(tries) FROM games WHERE user_id = $USER_ID")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo -e "Guess the secret number between 1 and 1000:"
read NUMBER
FIND_NUMBER $NUMBER
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, tries) VALUES($USER_ID, $TRIES)")
