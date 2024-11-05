# FaceListener related source code

This repository holds related source code for the paper
"[FaceListener: Recognizing Human Facial Expressions via Acoustic Sensing on Commodity Headphones](https://pittisl.github.io/publication/2022-facelistener/)"
as published in the 21st ACM/IEEE International Conference on Information Processing in Sensor Networks (IPSN), 2022.
You may find the original paper [here](https://doi.org/10.1109/IPSN54338.2022.00019).

## File Description

### Files from third-party

* yoloface-master/ dir: The YoloFace model source code for face keypoint recognition. (model weights not included, can be downloaded)

### Files under `Jupyter/` directory

* `facial_keypoints.ipynb`: An *early* design of using NN to achieve facial keypoints detection, including  
training and testing, as well as the model weights and training/testing data. Note that this implementation  
is different from the final version in the paper.

The NN model implementation as seen in the paper is not available now.

### Files under `Model/` directory

* `pcm_analysis_script.m`: Analyze pcm wave files collected from earphone.
* `mix_spec_afterbgr_script.m`: Script to plot mixed spectrogram after background removal.

#### Misc files under `Model/` directory

* `LEVD.m`: Local Extreme Value Detection (LEVD) algorithm.
* `NewDisplayCallback.m`: Callback function, to display the position of the data cursor.
* `PCM_*.m`: Misc functions in handling PCM wave format.
* `MultiFFTPlot.m`: FFT plotting function for PCM audio files.
* `plot_contour.m`: Plot the contour of wave figure in MATLAB.
* `waveformDisplayOverTime.m`: Display waveform in real time in MATLAB.
* `ReadAudioFile.m`: Read audio files into MATLAB as variables.

### `Facial-sound-main/` directory

* `CropsFacesYolo.py`: Crop the face area from image, using YoloFace.
* `ExtVideoAudio.py`: Extract the audio track from recorded video.
* `ProcAudio.py`: Extrace L/R audio track from recorded video.
* `ProcImages.py`: Crop face area from image, using OpenCV.
* `VideoImages.py`: Process video to generate image sequences.
* `README.md`: Brief explanation about the files in `Facial-sound-main/` dir.

* * *

## License

Unless otherwise noted, all files under this repository are released with
the following copyright information:

```
Copyright (c) 2020-2024 Intelligent Systems Lab, University of Pittsburgh. All Rights Reserved.
```

For files under `yoloface-master/`, please refer to the individual `LICENSE`
file within the directory.
