"""
Reading integer input and working with it
"""

#get age
age = int(input("What is your age?> "))

#naive, concatenative approach
#age = int("12")
#print("You're " + str(age + 1))

#use .format for interpolation
print("You're {}".format(age))
print("Next year you will be {}".format(age + 1))
