from flask import Blueprint, jsonify

main = Blueprint('main', __name__)

# Ana sayfa endpoint'i
@main.route('/', methods=['GET'])
def home():
    return jsonify({
        "status": "success",
        "message": "Ana Sayfa: Flask app works succesfully!"
    }), 200

# Hello endpoint'i
@main.route('/hello', methods=['GET'])
def hello():
    return jsonify({
        "status": "success",
        "message": "Hello!"
    }), 200

# Sağlık kontrolü endpoint'i
@main.route('/health', methods=['GET'])
def health_check():
    return jsonify({
        "status": "ok",
        "message": "Application is running"
    }), 200