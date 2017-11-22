def caesar(plain, shift):
    return "".join(ch if not ch.isalpha() else chr(((ord(ch) & (0xff - 32)) - 65 + shift) % 26 + 65) for ch in plain)

print(caesar("Hello, world!", 1))
