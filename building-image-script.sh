#登入 image repository 以便將開發完成的image上傳
docker login

#取得BPM的application source code
WORKPATH=$(pwd)
rm -R ./application-source-code
mkdir ./application-source-code
cd    ./application-source-code
git clone https://github.com/JamesShieh0510/bpm.git
 chmod -R 777 ./bpm
cd $WORKPATH


#建立image
version=1.0.0
docker build -t autolab/bpm:$version ./


#將image上傳到image repository上
docker commit -m "BPM Containerized App, Autolab, NCKU" $image_id autolab/bpm:$version
IMAGE_REPOSITORY_USER=autolab
IMAGE_NAME=bpm:$version
docker tag autolab/bpm:$version $IMAGE_REPOSITORY_USER/$IMAGE_NAME
docker images autolab/*
docker push $IMAGE_REPOSITORY_USER/$IMAGE_NAME

#執行container化的bpm
docker run -p 8089:8054 autolab/bpm:$version
#. ./building--image-script.sh