#! /bin/bash

#PSQL VARIABLE TO QUERY DB
PSQL="psql -X --username=freecodecamp --dbname=salon  --tuples-only -c"

#display the services
DISPLAY_SERVICES(){
  #get services
  if [[ ! -z $1  ]]
  then
    echo -e "\n$1"
  fi
  SERVICES_RESULT=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_RESULT" | while  read SERVICE_ID BAR SERVICE
  do
  echo -e "$SERVICE_ID) $SERVICE"
  done
    
}

SERVICE_MENU(){
  echo -e "\nWelcome to My Salon, how can I help you?\n"
  DISPLAY_SERVICES
  read SERVICE_ID_SELECTED

  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  
    while [[ -z $SELECTED_SERVICE ]]
    do
      DISPLAY_SERVICES "I could not find that service. What would you like today?"
      read SERVICE_ID_SELECTED
      SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    done  

    #read the phone number of the customer
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    #FORMATTED_CUSTOMER_NAME=$(sed )
    
    
    #if customer not present
    if [[ -z $CUSTOMER_NAME  ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    echo -e "\nWhat time would you like your $SELECTED_SERVICE, $CUSTOMER_NAME?"
    read SERVICE_TIME
    APPOINTMENT_INSERTION_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    if [[ $APPOINTMENT_INSERTION_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
    
  

  

}

echo -e "\n~~~~~ MY SALON ~~~~~\n"
SERVICE_MENU
