#!/bin/env python3

import subprocess, os, sys

# so... what I want to do is check if the user enters input on the command line
# if not then ask for the question
# if there are command line args pass them to chatgpt

def ask_gpt(query):
    answer_raw=subprocess.check_output(['tgpt', '-q', f'{query}'])
    answer_decoded=answer_raw.decode('utf-8')
    answer_processed=answer_decoded.rstrip()
    return answer_processed

def speak(script):
    FNULL=open(os.devnull, 'w')
    subprocess.run(['espeak','-x', f'{script}'], stdout=FNULL, stderr=subprocess.STDOUT)
    print(f'Transcript:\n{script}')

if __name__ == "__main__":
    while True:
        print("Hey! Press Ctrl+C to exit.")
        if len(sys.argv) > 1:
            query=sys.argv[1]
            what_to_say=ask_gpt(query)
        else:
            query=input("What do you wanna search for? ")
            what_to_say=ask_gpt(query)

        speak(what_to_say)
