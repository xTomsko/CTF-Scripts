from pwn import *
import ttt

context.log_level = "debug"

gCache = {}

state = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def parseGame(feld, state):
    if b'!' in feld:
            state = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    feld = feld[-0x16:]
    print(feld)            
    feld = list(feld[1:7:2] + feld[8:14:2] + feld[15:21:2])
    print(feld)
    for i, byte in enumerate(feld):
            if byte == 88:
                state[i] = 'X'
            elif byte == 79:
                state[i] = 'O'
    return state

p = remote("challs.dvc.tf", 6666)


while True:
    feld = p.recv(1024)
    state = parseGame(feld, state)
    print(state)
    pos, _ = ttt.getAIMove(state, "X", "X")
    print(pos)
    p.send(f"{pos//3 + 1} {pos%3 +1}\n")

"""
oder auch:
res = p.recvuntil(b"\n")"
print(res)
"""

p.interactive()
