import numpy as np
from keras.models import load_model
from keras.utils import load_img, img_to_array
import os
import base64

class PredictionPipeline:
    def __init__(self, filename):
        self.filename = filename

    def predict(self):
        # Load trained model
        model_path = os.path.join("artifacts", "training", "model.h5")
        model = load_model(model_path)

        # Load and preprocess image
        img = load_img(self.filename, target_size=(150, 150))
        img = img_to_array(img)
        img = img / 255.0
        img = np.expand_dims(img, axis=0)

        # Predict
        prediction = model.predict(img)
        confidence = float(prediction[0][0]) * 100  # confidence percentage
        labels = ["Pneumonia", "Normal"]

        # Choose label and adjust confidence to be intuitive
        if prediction[0][0] > 0.5:
            predicted_label = "Normal"
        else:
            predicted_label = "Pneumonia"
            confidence = 100 - confidence

        # Return prediction + confidence
        result = [{
            "prediction": predicted_label,
            "confidence": round(confidence, 2)
        }]

        # Also return base64 image (so front-end can display it easily)
        with open(self.filename, "rb") as f:
            img_data = base64.b64encode(f.read()).decode('utf-8')
        result.append({"image": img_data})

        return result
