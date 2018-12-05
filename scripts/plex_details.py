#!/usr/bin/python3
import requests
from xml.etree import ElementTree
result = requests.get('http://localhost:32400/status/sessions?X-Plex-Token=ZjNZDG86sBkVyZszwysw')
tree = ElementTree.fromstring(result.content)
currentTrack = tree.find('Track')
if currentTrack:
    parent = currentTrack.get('parentTitle')
    grandparent = currentTrack.get('grandparentTitle')
    title = currentTrack.get('title')
    player_el = currentTrack.find('Player')
    state = player_el.get('state')
    print("\uf04b" if state == "playing" else "\uf04c", "    ", grandparent, '\uf178',  title)
else:
    print("")
