FROM continuumio/miniconda3:24.1.2-0

# prepare environment
RUN apt update -y && apt upgrade -y
RUN conda config --append channels tongyuantongyu
RUN apt install -y libgl1-mesa-glx

# install vapoursynth
RUN conda install conda-forge::vapoursynth=69 -y

# install vapoursynth C++ plugins
RUN conda install tongyuantongyu::vapoursynth-bestsource=5 -y
RUN conda install tongyuantongyu::vapoursynth-fmtconv=30 -y

# install vapoursynth python plugins
RUN conda install tongyuantongyu::vapoursynth-mvsfunc=10.10 -y
RUN conda install tongyuantongyu::vapoursynth-vsutil=0.8.0 -y
RUN pip install git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git

# install python packages
RUN pip install numpy==1.26.4
RUN pip install opencv-python==4.10.0.82

# install PyTorch
RUN pip install torch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1 --index-url https://download.pytorch.org/whl/cu118

# install AI packages
RUN pip install vsrealesrgan
RUN python -m vsrealesrgan
