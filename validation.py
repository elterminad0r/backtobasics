def get_type(ty, msg):
    while True:
        try:
            val = ty(input(msg))
        except ValueError as ve:
            print(ve)
        else:
            return val

def score_int(s):
    val = int(s)
    if not 0 <= val <= 100:
        raise ValueError("Not in range 0-100")
    return val

if __name__ == "__main__":
    score = get_type(score_int, "What did you get in the maths test? ")
    print("You got {}".format(score))
