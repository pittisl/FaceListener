# Read and save images from video
# Use tensorflow/env
from os import times
import cv2 as cv

class LocalVideo:
    def __init__(self, path):
        self.videoPath = path
        self.videoObj = cv.VideoCapture(self.videoPath)
        self.videoFPS = self.videoObj.get(cv.CAP_PROP_FPS)
        self.videoFrames = self.videoObj.get(cv.CAP_PROP_FRAME_COUNT)
        self.frameTimestamps = []

    def saveImages(self, savePath):
        # Extract all images
        success = True
        while success:
            # Note: CAP_PROP_POS_MSEC has some issues, 0.0 at last several frames
            frameNum_CV = self.videoObj.get(cv.CAP_PROP_POS_FRAMES)
            success, image = self.videoObj.read()
            if success:
                # Get frame timestamp in ms
                framePosMs = frameNum_CV*(1000/self.videoFPS)
                self.frameTimestamps.append(framePosMs)
                cv.imwrite(savePath + f"frame{framePosMs:.3f}.jpg", image)
                #cv.imwrite(savePath + "frame%d.jpg" % frameCnt, image)
        if self.videoFrames != frameNum_CV:
            print("May miss some frames")
        self.videoObj.release()

    def getTimestampes(self):
        return self.frameTimestamps


if __name__ == '__main__':
    vid = LocalVideo("G:\\Research\\Data\\test_video.mp4")
    vid.saveImages("G:\\MacSharedFolder\\Data\\images\\")