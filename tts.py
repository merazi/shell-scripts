#!/usr/bin/env python3
# need gTTS and mpg123
# pip install gTTS
# apt install mpg123

from gtts import gTTS
import sys

def say_it(my_file):
    content = my_file.read()
    file = "{}.ogg".format(content.strip())
    tts = gTTS(content, lang='en-GB')
    tts.save(file)

if len(sys.argv) > 1:
    with open(sys.argv[1], 'r') as my_file:
        say_it(my_file)
else:
    print("""
This program is supposed to receive a file as its argument. It can be
any file, but I suggest you use a regular txt file with no markdown
syntax or any other kind of syntax.

Example: tts.py speech.txt
          """)