import sys

from random import choice

choices = "rock paper scissors".split()
u_choice = input("Enter choice > ")
comp_choice = choice(choices)

print("computer chose {}".format(comp_choice))

uind = choices.index(u_choice)
cind = choices.index(comp_choice)

if (uind + 1) % 3 == cind:
    print("computer won")
elif uind == cind:
    print("draw")
else:
    print("user won")
