#docker login -u autolab -p auto63906
WORKPATH=$(pwd)
docker login
rm -R ./application-source-code
mkdir ./application-source-code
cd    ./application-source-code
git clone https://github.com/JamesShieh0510/bpm.git
 chmod -R 777 ./bpm
cd $WORKPATH

version=0.0.1
docker build -t autolab/bpm:$version ./
#docker run -it autolab/bpm:$version
docker run -p 8089:8054 autolab/bpm:$version
#sudo docker commit -m "autolab bpm container app" $image_id autolab/bpm:0.0.1
#docker images bpm*

#. ./building--image-script.sh