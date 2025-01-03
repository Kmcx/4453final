from flask import Blueprint, jsonify

health = Blueprint('health', __name__)

@health.route('/', methods=['GET'])
def health_check():
    return jsonify({
        "status": "ok",
        "message": "Application is running"
    }), 200
