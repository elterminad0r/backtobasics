alph = "0123456789abcdefghijklmnopqrstuvwxyz"
dig_lookup = [alph.find(chr(i).lower()) for i in range(255)]

def from_base(base, s):
    if s:
        return dig_lookup[ord(s[-1])] + base * from_base(base, s[:-1])
    return 0

def to_base(base, i):
    quot, rem = divmod(i, base)
    if quot:
        yield from to_base(base, quot)
    yield rem

def to_strbase(base, i):
    return "".join(map(str, to_base(base, i)))
