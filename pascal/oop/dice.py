from random import randrange

class Die:
    def __init__(self, sides):
        self.value = -1
        self.sides = sides

    def roll(self):
        self.value = randrange(1, 7)
