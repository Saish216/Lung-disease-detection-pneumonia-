Your custom UI frontend (the one with the bar animation)

The Flask + ML integration

Realistic academic-level explanation

Credits to Saish Jethe, Aryan Jha, Kush Gowda

Cleaner and more readable Markdown layout for GitHub

🧠 Pneumonia Detection Using X-Ray

A deep learning–powered web application built using Flask, capable of detecting Pneumonia from X-ray images with the help of a trained convolutional neural network (CNN).

👨‍💻 Team Members

Saish Jethe

Aryan Jha

Kush Gowda

📘 Table of Contents

Overview

Project Workflow

How to Run

Frontend UI

Main File Structure

Model and Dataset

Deployment (Optional)

Acknowledgements

🩺 Overview

This project implements an AI-based system for Pneumonia Detection using X-Ray images.
A trained CNN model classifies the uploaded image as either:

Pneumonia, or

Normal

The model achieves high accuracy on the Kaggle chest X-ray dataset, and is integrated into an interactive Flask web app for real-time predictions.

Features:

Upload an X-ray image via the browser

Displays the prediction with animated confidence bar

Clean, modern, responsive web interface

Flask backend with TensorFlow/Keras model loading

Fully modular folder structure for reusability

⚙️ Project Workflow

User uploads an X-ray image via the frontend.

The image is converted to a base64 string and sent to the Flask backend.

Flask decodes and preprocesses the image (resizing, normalization).

The trained model (model.h5) predicts whether it’s Pneumonia or Normal.

The result (prediction + confidence) is sent back and visualized on-screen.

🧩 How To Run
1️⃣ Clone this repository
git clone https://github.com/Saish216/Xray-Pneumonia.git
cd Xray-Pneumonia

2️⃣ Create a virtual environment (using Conda or venv)
conda create -n xray python=3.11.3 -y
conda activate xray

3️⃣ Install dependencies
pip install -r requirements.txt

4️⃣ Run the Flask application
python app.py


Now open your browser and go to 👉 http://127.0.0.1:8080/

Upload an X-ray image and check the result!

🎨 Frontend UI

The web app features a modern, minimal, and responsive UI:

Drag & drop image upload

Live preview before prediction

Animated confidence progress bar

Color-coded prediction display (🟩 Normal / 🟥 Pneumonia)

Here’s what it looks like 👇

🗂️ Main File Structure
File / Folder	Description
app.py	Flask application entry point
predict.py	Loads the trained model and performs predictions
templates/index.html	Frontend HTML + JS code
xray/utils/common.py	Helper functions for decoding/encoding images
artifacts/training/model.h5	Pre-trained CNN model
requirements.txt	Python dependencies list
config/, pipeline/, entity/	Supporting project modules
main.py	Pipeline orchestration (training & data ingestion)
🧬 Model and Dataset

Model: Custom-trained CNN (model.h5)

Framework: TensorFlow / Keras

Input Size: 150x150 pixels

Output: Binary classification (Pneumonia / Normal)

Dataset Source: Kaggle Chest X-Ray Dataset

🚀 Deployment (Optional)

The project can be containerized and deployed using:

Docker – for packaging the Flask app with the trained model

AWS EC2 + ECR – for cloud hosting

GitHub Actions (CI/CD) – for automatic build & deploy pipelines

❤️ Acknowledgements

This project was developed as part of our academic coursework under the guidance of
Prof. A. V. Vidhate, Head of Department (Computer Science).

We would like to express our sincere gratitude for his continuous support, mentorship, and encouragement throughout the development of this project.

We also thank the open-source community for providing valuable tools, frameworks, and datasets that made this project possible.

🧑‍💻 Developed By

Saish Jethe, Aryan Jha, and Kush Gowda
Department of Computer Science
"Pneumonia Detection Using X-Ray" — 2025

✨ “AI doesn’t replace doctors — it helps them save more lives.” 🫁