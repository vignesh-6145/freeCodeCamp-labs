#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

print_description(){
  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
  ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
  ELEMENT_PROPERTY_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
  ELEMENT_PROPERTY=$($PSQL "SELECT type FROM  types WHERE type_id=$ELEMENT_PROPERTY_ID")
  ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")
  ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")
  ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")
  echo "The element with atomic number $1 is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_PROPERTY, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
}
print_element_description(){
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$1
  else
    n=${#1}
    if [[ n -le 3 ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    fi
  fi
  if ! [[ -z $ATOMIC_NUMBER ]]
  then
    print_description $ATOMIC_NUMBER
  else
    echo "I could not find that element in the database."
  fi
  
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
 print_element_description $1   
fi