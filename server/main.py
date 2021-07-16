import win32api
from win32con import VK_MEDIA_PLAY_PAUSE, KEYEVENTF_EXTENDEDKEY
from win32con import VK_MEDIA_PREV_TRACK, VK_MEDIA_NEXT_TRACK

import spotipy
from spotipy.oauth2 import SpotifyOAuth
import spotipy.util as util

from flask import Flask, jsonify, request
from secret_key import client_id, client_secret

app = Flask(__name__)
sp = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id=client_id, client_secret=client_secret, redirect_uri='https://github.com/NebuDev14', scope="user-read-currently-playing"))

current_track = sp.current_user_playing_track()
print(current_track['item']['album']['name'])

@app.route("/music", methods=['POST'])
def info():
    if request.json['query'] == "play_pause":
        win32api.keybd_event(VK_MEDIA_PLAY_PAUSE, 0, KEYEVENTF_EXTENDEDKEY, 0)
    elif request.json['query'] == "prev":
        win32api.keybd_event(VK_MEDIA_PREV_TRACK, 0, KEYEVENTF_EXTENDEDKEY, 0)
    elif request.json['query'] == "next":
        win32api.keybd_event(VK_MEDIA_NEXT_TRACK, 0, KEYEVENTF_EXTENDEDKEY, 0)
    return jsonify({"success": "played/paused music"})

if __name__ == '__main__':
    app.run(debug=True)