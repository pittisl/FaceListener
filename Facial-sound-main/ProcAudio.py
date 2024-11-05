# Extract the soundtrack from recorded video
# Must run under proper virtual env (env)
from scipy.io import wavfile
import matplotlib.pyplot as plt


class LocalAudio:
    def __init__(self, path):
        self.audioPath = path
        self.fs, self.data = wavfile.read(self.audioPath)
        self.data_ch1 = self.data[:,0]
        self.data_ch2 = self.data[:,1]

    def getAudioData(self):
        return self.data_ch1, self.data_ch2


if __name__ == '__main__':
    sound = LocalAudio("G:/MacSharedFolder/Data/test_video_audio.wav")
    data1, data2 = sound.getAudioData()
    plt.title("Signal Wave Channel 1")
    plt.plot(data1)
    plt.savefig("figure1.png")
    plt.title("Signal Wave Channel 2")
    plt.plot(data2)
    plt.savefig("figure2.png")