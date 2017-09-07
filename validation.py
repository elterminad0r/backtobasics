"""
Validating things
"""

def get_type(ty, msg):
    """
    custom function to perform validation. note that it accepts two arguments -
    the first argument can be any function that "parses" the input the way you
    want. If it fails, it should raise ValueError. In the simple case, you can
    use the primitive types - int, float, str, bool etc (this is what circle.py
    does). However you can pass it any function - so for more validation you
    can define something like score_int and pass that. In a more advanced case
    you could pass a partial (curried) datetime.strptime.
    """

    while True:
        try:
            val = ty(input(msg))
        #if a value error is raised, print it and carry on
        except ValueError as ve:
            print(ve)
        else:
            #if it all goes fine return the value (this breaks from the loop and function)
            return val

def score_int(s):
    """
    custom type function to check if a score is not only a valid integer but a
    valid value. If it's not an integer, the int function will raise
    ValueError, and we don't need to worry about this, as get_type will handle
    it.
    """
    val = int(s)
    if not 0 <= val <= 100:
        raise ValueError("Not in range 0-100")
    return val


# We have to use this if statement so that this bit doesn't run if we import
# it, but it will run if we call the script directly.
if __name__ == "__main__":
    #print score
    score = get_type(score_int, "What did you get in the maths test? ")
    print("You got {}".format(score))
