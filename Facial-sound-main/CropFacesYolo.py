# Crop the face area with YoloFace
# Must be ran under proper virtual env (env_yolo)
# Must include modelweights
# Must include cfg file
# Command example: python yoloface.py --image samples/image000.jpg --output-dir outputs/

import os


class LocalImagesYolo:
    def __init__(self, imagesPath, yoloPath):
        self.imagesPath = imagesPath
        self.yoloPath = yoloPath

    def yoloImages(self, outputPath):
        for img in os.listdir(self.imagesPath):
            os.system("python " + self.yoloPath + "yoloface.py" + \
            " --image " + self.imagesPath + img + \
            " --output-dir " + outputPath + \
            " --model-weights " + self.yoloPath + "model-weights/yolov3-wider_16000.weights" + \
            " --model-cfg " + self.yoloPath + "cfg/yolov3-face.cfg")

if __name__ == '__main__':
    dataset = LocalImagesYolo("G:/MacSharedFolder/Data/images/", \
        "C:/Users/xingzhe-mac/Documents/yoloface/")
    dataset.yoloImages("G:/MacSharedFolder/Data/faces_cropped/")
