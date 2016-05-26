from flask import Flask, jsonify
import redis

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({"message": "welcome"})


@app.route('/reserve')
def reserve():
    r = redis.StrictRedis(host='redis', port=6379, db=0)
    inventory = r.decr('inventory', 1)
    return jsonify({"inventory": inventory})


@app.route('/reset')
def reset():
    r = redis.StrictRedis(host='redis', port=6379, db=0)
    inventory = r.set('inventory', 500000)
    return jsonify({"inventory": inventory})
