#!/usr/bin/env python3
# need gTTS and mpg123
# pip install gTTS
# apt install mpg123

from gtts import gTTS
import os

# define variables
s = input("Ingresa lo que quieres decir → ")
file = "{}.ogg".format(s)

# initialize tts, create mp3 and play
tts = gTTS(s, lang='es')
tts.save(file)
