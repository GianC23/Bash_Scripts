#!/bin/bash
# Zaheln erraten Spiel
# Gian Casutt
end=0
numberToGuess=$(( $RANDOM % 20 + 1 ))
guessesLeft=5
echo "Willkommen zum Zahlen erraten!"
read -p "Zahl zwischen 1 und 20 eingeben: " zahl
guessesLeft=$((guessesLeft-1))
echo "Versuche übrig " $guessesLeft
until [[ $guessesLeft -eq "0" ]]

do
    if (( zahl >= 1 && zahl <= 20 && guessesLeft > 0))
    then
        if [[ $zahl -eq $numberToGuess ]]
        then
            end=1
            echo "Gewonnen"
            exit
        elif (( zahl > $numberToGuess ))
        then
            read -p "Kleinere Zahl eingeben: " zahl
            if [[ $zahl -eq $numberToGuess ]]
            then
                end=1
                echo "Gewonnen"
                exit
            fi
            guessesLeft=$((guessesLeft-1))
            echo "Versuche übrig " $guessesLeft
        else
            read -p "Grössere Zahl eingeben: " zahl
            if [[ $zahl -eq $numberToGuess ]]
            then
                end=1
                echo "Gewonnen"
                exit
            fi
            guessesLeft=$((guessesLeft-1))
            echo "Versuche übrig " $guessesLeft
        fi
    #Nur aus Sicherheit falls es mal aus irgendeinem Grund nicht raus geht bei 0 guesses    
    elif [[ guessesLeft -eq "0" ]]
    then
        echo "Keine Guesses übrig"
        echo "Sie haben verloren die Zahl war" $numberToGuess
        exit
    else
        read -p "Neue Zahl eingeben zwischen 1 und 20: " zahl
        echo "Versuche übrig " $guessesLeft
    fi
done
echo "Keine Versuche übrig"
echo "Sie haben verloren :( die Zahl war" $numberToGuess
exit