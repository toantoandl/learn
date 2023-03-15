PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


    FIND_SYMBOL=$($PSQL "SELECT elements.symbol FROM  elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.symbol='$1'")
    FIND_NAME=$($PSQL "SELECT elements.name FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.name='$1'")  
    if [[ -z $1 ]]
    then
    echo "Please provide an element as an argument."
      elif [[ $1 == $FIND_SYMBOL || $1 == $FIND_NAME ]]
           then
          AMU=$($PSQL "SELECT properties.atomic_mass FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
           FIND_TYPE=$($PSQL "SELECT types.type FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")  
          NAME=$($PSQL "SELECT name FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
          SYMBOL=$($PSQL "SELECT symbol FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
          MELT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
          BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
          ATOMIC=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE elements.name='$FIND_NAME' OR elements.symbol='$FIND_SYMBOL'")
        echo "The element with atomic number $ATOMIC is $NAME ($SYMBOL). It's a $FIND_TYPE, with a mass of $AMU amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
        elif [[ $1 =~ ^[0-9]+$ ]];
          then
          FIND_ATOMIC=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number WHERE properties.atomic_number=$1")
            if [[ $1 == $FIND_ATOMIC ]]
                then 
          AMU=$($PSQL "SELECT properties.atomic_mass FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1")
           FIND_TYPE=$($PSQL "SELECT types.type FROM elements FULL JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number='$1'")  
          NAME=$($PSQL "SELECT name FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1")
          SYMBOL=$($PSQL "SELECT symbol FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1")
          MELT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1")
          BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1")
          ATOMIC=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number=elements.atomic_number JOIN types ON properties.type_id=types.type_id WHERE properties.atomic_number=$1") 
           echo "The element with atomic number $ATOMIC is $NAME ($SYMBOL). It's a $FIND_TYPE, with a mass of $AMU amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
               else 
                      echo "I could not find that element in the database."
            fi
else 
echo "I could not find that element in the database."
  fi
 