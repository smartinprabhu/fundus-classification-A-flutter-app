import tensorflow as tf

# Load the Keras model
model = tf.keras.models.load_model('/Users/martinprabhu/eye_defect_detection/model.h5')

# Convert the model to TensorFlow Lite format
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# Save the TensorFlow Lite model to a file
with open('model.tflite', 'wb') as file:
    file.write(tflite_model)
