# Extract the soundtrack from recorded video
# Must be ran under proper virtual env (env_moviepy)
import moviepy.editor as mp

class VideoAudio:
    def __init__(self, path):
        self.videoPath = path
        self.video = mp.VideoFileClip(self.videoPath)

    def extractAudio(self, savePath):
        self.video.audio.write_audiofile(savePath)


if __name__ == '__main__':
    vid = VideoAudio("G:/Research/Data/test_video.mp4")
    vid.extractAudio("G:/MacSharedFolder/Data/test_video_audio.wav")