😏 Sarcasm Detector

Sarcasm Detector is a Swift-based iOS application that analyzes user-provided messages and determines whether the text is sarcastic or not sarcastic. The application uses a TF-IDF model generated with Python to transform text into numerical features and applies the trained model to classify the input directly within the iOS app.

✨ Features

* 😏 Sarcasm detection
* 📝 User message input
* 🧠 Machine learning-based text classification
* 🔤 TF-IDF text vectorization
* 🐍 Python-based model development
* 🍎 Swift-based iOS implementation
* 🎯 Sarcastic / Not Sarcastic classification
* ⚡ Fast text prediction
* 📱 Native iOS interface

🧠 Machine Learning Model

The model is developed using Python and TF-IDF (Term Frequency–Inverse Document Frequency). TF-IDF converts text into numerical feature values that can be understood by the machine learning model.

The trained model and required TF-IDF resources are then integrated into the Swift iOS application for prediction.

🔄 Application Process

User Message → Text Preprocessing → TF-IDF Vectorization → Trained ML Model → Model Inference → Sarcasm Classification → Display Result

🔗 Model Integration

Python → Training Data → Text Preprocessing → TF-IDF Vectorization → Train ML Model → Export Model/Resources → Swift iOS App → User Message → TF-IDF Processing → Model Inference → Sarcastic / Not Sarcastic

🛠️ Tech Stack

* Swift – iOS application development
* Python – Machine learning model development
* TF-IDF – Text feature extraction
* Machine Learning – Sarcasm classification
* iOS SDK – Native iOS functionality

🎯 Project Purpose

This project demonstrates how a Python-developed machine learning model can be integrated into a Swift iOS application. It covers the complete workflow from text preprocessing and TF-IDF feature extraction to model inference and displaying the final sarcasm classification.

💡 Use Case

The application can be used to experiment with detecting sarcasm in written messages, demonstrating how machine learning can help analyze text where the literal meaning may differ from the intended meaning.
