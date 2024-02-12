#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# Promt user to enter username
echo "Enter your username:"
read USERNAME

USERNAME_EXIST="$($PSQL "SELECT username FROM players WHERE username = '$USERNAME'")"

if [[ -z $USERNAME_EXIST ]]
  # if USERNAME did not exist in DB
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_USER="$($PSQL "INSERT INTO players (username) VALUES ('$USERNAME')")"
  
  # if USERNAME exist on DB
  else
        GAMES_PLAYED="$($PSQL "SELECT COUNT(*) FROM games INNER JOIN players USING (player_id) WHERE  username = '$USERNAME'")"
        BEST_GAME="$($PSQL "SELECT MIN(number_of_guesses) FROM games INNER JOIN players USING (player_id) WHERE username = '$USERNAME'")"
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

# Create random number 1-1000
SECRET_NUMBER=$(($RANDOM%(1-1000)))
read INPUT


# if INPUT is not a number
if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read INPUT
fi

COUNT=1

while [[ ! $INPUT -eq $SECRET_NUMBER ]]
  do 
    while [[ $INPUT -lt $SECRET_NUMBER ]]
      do
        echo "It's higher than that, guess again:"
        let COUNT++
        read INPUT
      done

    while [[ $INPUT -gt $SECRET_NUMBER ]]
      do
        echo "It's lower than that, guess again:"
        let COUNT++
        read INPUT
      done
  done


  GAMES_PLAYED="$($PSQL "SELECT COUNT(*) FROM games INNER JOIN players USING (player_id) WHERE  username = '$USERNAME'")"
  BEST_GAME="$($PSQL "SELECT MIN(number_of_guesses) FROM games INNER JOIN players USING (player_id) WHERE username = '$USERNAME'")"
  PLAYER_ID="$($PSQL "SELECT player_id FROM players WHERE username = '$USERNAME'")"
  INSERT_DATA_TO_GAMES="$($PSQL "INSERT INTO games (player_id, number_of_guesses) VALUES ($PLAYER_ID, $COUNT)")"
  #INSERT_BEST_GAME="$($PSQL "INSERT INTO players (num_games_played, best_game) VALUES ($GAMES_PLAYED, $BEST_GAME))"
  
  echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"


 


  





