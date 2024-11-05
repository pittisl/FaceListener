# Process the images
import cv2 as cv
import os

class LocalImages:
    LEFT_CROP_RATIO = 0.25
    RIGHT_CROP_RATIO = 0.75
    TOP_CROP_RATIO = 0.25
    BOTTOM_CROP_RATIO = 0.25
    FACECASCADE = cv.CascadeClassifier(cv.data.haarcascades + 'haarcascade_frontalface_default.xml')
    FACE_WIDTH_LIM = 400
    FACE_HEIGHT_LIM = 400

    def __init__(self, path):
        self.imagesPath = path
    
    def processImages(self, savePath):
        dataCnt = 0
        for img in os.listdir(self.imagesPath):
            imgObj = cv.imread(os.path.join(self.imagesPath, img))
            if imgObj is not None:
                # process the image
                img_proc = self.processSingleImage(imgObj)
                if img_proc is not None:
                    cv.imwrite(savePath + img, img_proc)
                    dataCnt += 1
            else:
                print("No images found!")

    def processSingleImage(self, img):
        height, width, channels = img.shape
        # crop the image
        img = img[:, int(self.LEFT_CROP_RATIO*width):int(self.RIGHT_CROP_RATIO*width)]
        #img = self.detectFaceArea(img_cropped)
        if img is not None:
            return img
    
    @classmethod
    # Use openCV library to detect face area
    def detectFaceArea(cls, img):
        imageGray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
        faces = cls.FACECASCADE.detectMultiScale(imageGray, 1.05, 6)
        """ for (x, y, w, h) in faces:
            cv.rectangle(img, (x,y), (x+w, y+h), (255, 0, 0), 2) """
        # only keep single face that is larger than pre-defined area
        if len(faces) == 1 and faces[0][2] >= cls.FACE_WIDTH_LIM \
                            and faces[0][3] >= cls.FACE_HEIGHT_LIM:
            # crop the face area
            img_face = img [faces[0][1]:faces[0][1]+faces[0][3], \
                            faces[0][0]:faces[0][0]+faces[0][2]]
            return img_face

if __name__ == '__main__':
    dataset = LocalImages("G:\\MacSharedFolder\\Data\\images\\")
    dataset.processImages("G:\\MacSharedFolder\\Data\\images_processed\\")
    
    # test facial area detection function
    """ img = cv.imread("image117.jpg")
    LocalImages.detectFaceArea(img)
    cv.imwrite("image_detect.jpg", img) """