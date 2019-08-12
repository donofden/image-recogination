from imageai.Detection import ObjectDetection
import os

execution_path = os.getcwd()

detector = ObjectDetection()
detector.setModelTypeAsRetinaNet()
detector.setModelPath(os.path.join(execution_path, "resnet.h5"))
detector.loadModel()
detections = detector.detectObjectsFromImage(
    input_image=os.path.join(execution_path, "image.jpg"),
    output_image_path=os.path.join(execution_path, "image-recogination.jpg"))

for eachObject in detections:
    print(eachObject)
    print(eachObject["name"], " : ", eachObject["percentage_probability"])
