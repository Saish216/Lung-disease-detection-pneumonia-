from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
import os
from xray.utils.common import decodeImage
from xray.pipeline.predict import PredictionPipeline

os.putenv('LANG', 'en_US.UTF-8')
os.putenv('LC_ALL', 'en_US.UTF-8')

app = Flask(__name__)
CORS(app)

class ClientApp:
    def __init__(self):
        self.filename = "inputImage.jpg"
        self.classifier = PredictionPipeline(self.filename)

@app.route("/", methods=['GET'])
def home():
    return render_template('index.html')

@app.route("/predict", methods=['POST'])
def predictRoute():
    try:
        image = request.json['image']
        decodeImage(image, clApp.filename)
        prediction_pipeline = PredictionPipeline(clApp.filename)
        result = prediction_pipeline.predict()
        return jsonify(result)
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    clApp = ClientApp()
    app.run(host='0.0.0.0', port=8080)
