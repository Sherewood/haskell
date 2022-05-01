--Julien Rougerie 101067032
import Data.Maybe
--long_division; implements error function to handle divide by zero errors 
long_division :: Int->Int->(Int,Int)
long_division a 0=error "cannot Divide by zero"
long_division a b
 |(a-b<0)= (0,a)
 |(a-b>=0)=(1+fst(long_division (a-b) b),snd(long_division (a-b) b))
--two_long_division; implements maybe to resolve divide by zero erro, also emplois usage of custom selectors to convert the maybe's into ints, or just general values 
two_long_division ::Int->Int-> Maybe ( Int, Int)
two_long_division a b
 |(a-b<0)= Just (0, a)
 |(a-b>=0)= Just (1+fst'(two_long_division (a-b)  b),snd'(two_long_division (a-b)  b))
--selectors 
fst'::Maybe (x,y)-> x
fst' (Just (x,y))= x
snd'::Maybe (Int,Int)-> Int
snd'  (Just(a,b))= b
--three_long_division; implements tail call through helper function. Helper function does most of the recursive work while function is a non-recursive one, which returns the second value of the helper
--tuple, where the values will be calculated.
three_long_division ::Int->Int->( Int, Int)
three_long_division a b= snd(helper ((a,b),(0,0)))
helper::((Int,Int),(Int,Int))->((Int,Int),(Int,Int))
helper ((a,b),(div,rem))
 |(a-b<0)=((a,b),(div,rem))
 |otherwise = helper(((a-b),b),(div+1,a-b))
abso::Int->Int
abso x
 |(x<0)=(-x)
 |otherwise=x