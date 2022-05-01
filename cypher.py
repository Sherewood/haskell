#Assignment 1
#Julien Rougerie
#101067032
# This is a global function to hold in the test cases. this is not used to aid in any of the recursion 
selection=["roobot-collier", "Pass-without-Trace","", "Wartortle","What-is-dead-may-never-die","aaa","lieu"]

def deKebabify(Kword): #turns a kebab-case compliant string into a list of words. This function returns unt as the list of strings 
    if (not Kword): #base case
        return [""]
    else: #conditonal.
        if(Kword[0]!="-"):
            unt=deKebabify(Kword[1:])
            unt[0]=Kword[0]+unt[0]
        else:
            unt=[""]+deKebabify(Kword[1:])

    return unt
def Jeringoza(chosen): # Turns the single string into a Jeringoza compliant string. Has a local variable of vowels so it can check 
    vowels=["a","e","i","o","u"]
    if (len(chosen)==1 or not chosen): #if an empty string is brought into the function the base case changes. Instead of sending back the value, it sends the empty string. The reason is because the rest of the function relies on chosen being at least 1 letter
        if not chosen: #condtional for empty string
            return ""
        else: #conditional for the base case of a string of at least 1 letter. function checks wheter it is a vowel or not in order to Jeringozafy it 
            if (chosen[0] in vowels):
                return chosen[0]+ "p "+chosen[0]
            else:
                return chosen[0]
    else: # conditional 
        if (chosen[0] in vowels): # if the char is a vowel, then it has two paths to go down.
            comp=chosen[0] #local variable to compare 
            if ( not chosen[1] or chosen[1] !=comp): # if the next value is another char or is non-existant, than the word will be modified with jeringoza script (char+p+" "+char) and continue on
                final=chosen[0]
                final2=chosen[1:]
                final3= final+"p "+final+Jeringoza(final2)
            else: # if the next value is the same char, then the jeringoza needs to be modified to account the additional char. the jeringoza script now adds the two of them and continues recursion on the 3 char in the string
                final=chosen[0]+chosen[1]+"p "+chosen[1]+chosen[0]
                final2=chosen[2:]
                final3= final+Jeringoza(final2)
        else: # if the char is not a vowel, then it is added to the string 
            final=chosen[0]
            final2=chosen[1:]
            final3= final+Jeringoza(final2)
        return final3
def One_to_Many(array): # this function turns an array into a string 
    if (len(array)==1 or not array): #base case checks if there is an empty string or if there is only one character left in the array
        if (array):
            return array[0]
        else:# if this is an empty array, returns nothing 
            return[""]
    else:
        final=array[0]
        final3=final+" "+ One_to_Many(array[1:])
        return final3 #returning string 
        

def convert(start): #main function which will begin the recursion
    conversion=deKebabify(start)
    Jerin_word=Jeringoza(One_to_Many(conversion))
    print("jerignoza: "+Jerin_word)
#interface where you can check with several test cases 
choice= input("Hello, please select from the following options to test the program. \n 1) roobot-collier \n 2) Pass-without-Trace \n 3) empty string \n 4) Wartortle \n 5) What-is-dead-may-never-die \n 6) aaa \n 7)lieu \n If you wish to exit, press 0 \n enter your choice:")
while (int(choice)!=0):
    sel=int(choice)-1
    chosen= selection[sel]
    convert(chosen)
    choice= input("Hello, please select from the following options to test the program. \n 1) roobot-collier \n 2) Pass-without-Trace \n 3) empty string \n 4) Wartortle \n 5) What-is-dead-may-never-die \n 6) aaa \n 7)lieu \n If you wish to exit, press 0 \n enter your choice:")

