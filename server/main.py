from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/info", methods=['POST'])
def info():
    print(request.json)
    return jsonify({"test": "yes"})

if __name__ == '__main__':
    app.run(debug=True)