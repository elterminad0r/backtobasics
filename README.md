# backtobasics
Some Python basics should any of my one audience members wish to refer to them. The main goal is to provide lots of accessible examples of basic Python functionality/syntax and make a reasonably usable index of these examples. Features simple examples of code, with mildly explanatory comments. For example, a demonstration of a validation function that takes a parser function as an argument (using while-loops and try-except, docstring omitted):

```Python
def get_type(ty, msg):
     while True:
         try:
             val = ty(input(msg))
         #if a value error is raised, print it and carry on
         except ValueError as ve:
             print(ve)
         else:
             #if it all goes fine return the value (this breaks from the loop and function)
             return val
```

Veel plezier `: )`

Possibly in future featuring other languages.
