from flask import Blueprint, jsonify
#from .database import get_db_connection

main = Blueprint('main', __name__)

# Ana sayfa endpoint'i
@main.route('/', methods=['GET'])
def home():
    return jsonify({
        "status": "success",
        "message": "Ana Sayfa: Flask app works succesfully!"
    }), 200


@main.route('/hello', methods=['GET'])
def hello():
            
    return jsonify({
        "status": "success",
        "message": "Hello!"
    }), 200