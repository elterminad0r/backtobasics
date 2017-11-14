import itertools
import sys
from collections import deque
deque(map(sys.stdout.write, map("{}\n".format,  itertools.count())), maxlen=0)
