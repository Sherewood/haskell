import Debug.Trace
--TEST CASES: Case 1:quadraticEquation 0 20 30 will give you []
--Case 2:quadraticEquation 1 2 1 will give you 2 
--case 3:quadraticEquation 9 6 0 will give you an arrary of two values of [0.0, -54]
--case 4:quadraticEquation 4 6 6 will give you an array of [] which means it's an empty array because b(squared)-4ac is a negative number 
--case 5:quadraticEquation (-1) (-5) (0) will give [-5,0] showing that this works with negative numbers as well
quadraticEquation :: Double->Double->Double->[Double]
quadraticEquation a b c
 |(a==0)= trace("The value in the a position is 0, therefore the quadratic Equation cannot function") [] 
 |(sqrVal_One-sqrVal_Two <0)= trace("the square root value will be negative, so there are no roots ")[]
 |(total==0)= trace("the value of the square root will be 0 so there is only one root:")[b]
 |otherwise= trace("The quadratic roots for these values is:")( plusres:[subres])
 where nega=(b*(-1))
       sqrVal_One=b*b
       sqrVal_Two=4*a*c
       total=sqrt(sqrVal_One-sqrVal_Two)
       plusres= (nega+total)/2*a
       subres= (nega-total)/2*a 