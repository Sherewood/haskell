--Julien Rougerie 101067032
import Debug.Trace
import Prelude
-- this code will do the following: Create a database of names/phone numbers/ implement the method to search the database for said phone number 

--main function for converting to soundex. This function will take in a string and then produce it's soundex equivalent. Also, for the sake of nomeclature, this also is conversion one. as it removes the first element.
translate :: String -> String
translate []=""
translate (h:t)=  h:conv_six((conv_five(conv_four(conv_three(conv_two(t))))))
--conversions 2-6. each completes a soundex conversion.
--conversion 2 removes all h's and w's
conv_two :: String->String
conv_two ""=""
conv_two ('H':t)=conv_two(t)
conv_two ('W':t)=conv_two(t)
conv_two (h:t) = h:conv_two(t) 
--conversion 3 removes all duplicates in the string
conv_three :: String->String
conv_three "" =""
conv_three (h:t) 
 |(h `elem` t) = conv_three(t)
 |otherwise= h:conv_three(t)
--conversion 4 removes all vowels
conv_four :: String->String
conv_four "" =""
conv_four (h:t) 
 |(h `elem` vowels) = conv_four(t)
 |otherwise=h:conv_four(t)
 where vowels =['A','E','I','O','U','Y']
--conversion 5 converts whatever remains into the proper numerical code 
conv_five :: String->String
conv_five ""=""
conv_five (h:t) 
 |(h `elem` ones ) = ('1':conv_five(t))
 |(h `elem` twos) = ('2':conv_five(t))
 |(h `elem` threes) = ('3':conv_five(t))
 |(h `elem` fours) = ('4':conv_five(t))
 |(h `elem` fives) = ('5':conv_five(t))
 |(h `elem` sixs) = ('6':conv_five(t))
 |otherwise= conv_five(t)
 where 
 ones=['B','F','P','V']
 twos=['C','G','J','K','Q','S','X','Z']
 threes=['D','T']
 fours=['L']
 fives=['M','N']
 sixs=['R']
-- conversion 6 fills the string with 0 should it's soundex not be long enough for 4 spaces 
conv_six :: String -> String
conv_six c 
 | (length c== space)=c 
 | (length c < space)= conv_six(c++"0")
 where space=3

 
--the following code creates a database of names and phone numbers 
type Name=[Char]
type Phonenumber=[Char]
type Entry=(Name,Phonenumber)
type Database=[Entry]
database :: Database
database=[("CENA","823-000-3232"),("CENA","800-977-7648"),("ISHTAR","877-118-4654"),("ISSAC","999-999-9999"),("BRUVA","123-332-4444"),("BRAY","939-293-9999")]

--part 3 query
--this program will search the data base and produce a list in x|y format.  
search :: Database->String->[Char]
search database ent 
 | database==[] = []
 | (soundex==soundey)= snd(head(database))++"|"++search (tail database) ent
 | otherwise= search (tail database) ent
 where 
 soundex=translate(ent)
 soundey=translate(fst(head(database)))
 