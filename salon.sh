#!/bin/bash
  PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Script to delete the data
# echo $($PSQL "TRUNCATE appointments,customers,services")
echo -e "~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"
MENU () {
# #display a numbered list of the services
# LIST_SERVICE=$($PSQL "SELECT * FROM services");
if [[ $1 ]]
then
echo -e "\n$1"
fi

AVAIL_SERVI=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

if [[ -z $AVAIL_SERVI ]]
then 
echo "We don't have any services available right now"
else echo "$AVAIL_SERVI" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

read SERVICE_ID_SELECTED
  if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
  MENU "That is not a number"
  else
  SERVI_AVAILIABLE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    NAME_SER=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVI_AVAILIABLE ]]
      then
        MENU "I could not find that service. What would you like today?"
           else
          echo -e "\nWhat's your phone number?"
            read CUSTOMER_PHONE
            CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
            if [[ -z $CUSTOMER_NAME ]]
                then
            echo -e "\nWhat's your name?"
           read CUSTOMER_NAME
            INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
             fi
            echo -e "\nWhat time would you like your$NAME_SER, $CUSTOMER_NAME?"
              read SERVICE_TIME
              CUSTUMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
              if [[ $SERVICE_TIME ]]
                        then
                      INSERT_APPOIMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTUMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
                        if [[ $INSERT_APPOIMENT ]]
                        then
                          echo -e "\nI have put you down for a $NAME_SER at $SERVICE_TIME, $CUSTOMER_NAME."
                        fi   
                       fi
                    fi
                  fi
                fi
                
}

MENU
