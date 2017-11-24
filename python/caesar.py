def caesar(plain, shift):
    return "".join(ch if not ch.isalpha() else chr((((ord(ch) & (0xff - 32)) - 65 + shift) % 26 + 65) | (ord(ch) & 32)) for ch in plain)

for shift in range(26):
    print(caesar("Hello, world!", shift))
