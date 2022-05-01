--Julien Rougerie 101067032
--this program will use three functions to solve for whether or not a value is prime or not 
import Debug.Trace
import Prelude
--Boolean function to check whether or not, returns a boolean
isPrime :: [Integer]->Bool
isPrime brac 
 |(length brac==2)=True
 |otherwise=False
-- starting function, this function will call the other functions and provide a list of -- divisible integers as well as the indication of weather of not if it's prime.
start :: Integer->[Integer]
start a
 |(isPrime rez==True)= trace("As this list contains only elements "++show( head rez)++" and "++show(tail rez)++", the positive integer "++show(head rez)++" IS prime") rez
 |otherwise= trace("As this list contains more than the two elements necessary for it to be prime, it is not prime") rez
 where rez=trace("factoring value "++ show(a)) factoring a a

--factoring method, this method produces a list of integers that are divisbile to the entered number
factoring :: Integer->Integer->[Integer] --Integer->[Integer]
factoring intialVal comp
 |(comp==1)= [comp]
 |(mod intialVal comp==0) = comp:factoring intialVal c
 |otherwise = factoring intialVal c
 where  c=comp-1