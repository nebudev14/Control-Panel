import win32api
from win32con import VK_MEDIA_PLAY_PAUSE, KEYEVENTF_EXTENDEDKEY
from win32con import VK_MEDIA_PREV_TRACK, VK_MEDIA_NEXT_TRACK
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/info", methods=['POST'])
def info():
    if request.json['query'] == "play_pause":
        win32api.keybd_event(VK_MEDIA_PLAY_PAUSE, 0, KEYEVENTF_EXTENDEDKEY, 0)
    return jsonify({"success": "played/paused music"})

if __name__ == '__main__':
    app.run(debug=True)