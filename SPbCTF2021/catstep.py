import requests
import string
import json

printable = string.printable #string that contains digits, letters, punctuatuion and whitespace
flag = 'spbctf{'
url = 'https://cat-step.disasm.me/'
placeholder = ' ' * 27
dist = 28

while dist > 1:
    for i in printable:	    
        r = requests.post(url, {'flag': flag + i + placeholder + '}'})
        if dist > json.loads(r.text)['length']:
            flag += i
            dist -= 1
            placeholder = placeholder[1:]
            print(flag)
print(flag + '}')