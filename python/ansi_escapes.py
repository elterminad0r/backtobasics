import time
import itertools
import sys
for x, y in itertools.cycle(itertools.product(range(10), range(10))):
    sys.stdout.write("\x1b[3{};4{}mIZAAK".format(x, y))
    sys.stdout.flush()
    time.sleep(0.1)
    
