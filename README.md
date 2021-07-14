# rpiplay_docker
This repo tries to provide a docker image for the awesome [RPiPlay](https://github.com/FD-/RPiPlay) software.


[Docker Hub link](https://hub.docker.com/r/hown3d/rpiplay)

## Credits
To build the image, I used [RPiPlay-docker-builder](https://github.com/nicolaspernoud/RPiPlay-docker-builder) - Thank you so much @nicolaspernoud 

## Before you start
Before running the image, you should (unless already done) bump the video memory of your raspberry pi to 256 MB.
To do that, you can use `raspi-config > Advanced Options > Memory Split`.
Please also read [this issue](https://github.com/FD-/RPiPlay/issues/8).

## Usage
Run the image:
```
docker run \
  --net=host \
  --privileged \
  djhofmann/rpiplay
```
- Host network is obviously required. 

### Environment variables
You may provide the following environment variables

| Variable | Description | Default |
| -------- | ----------- | ------- |       
|RPI_PLAY_AUDIO |RPiPlay audio mode |hdmi |
|RPI_PLAY_NAME |Network name |RPiPlay |
|RPI_PLAY_EXTRA_ARGS |Extra args (e.g. `-l`) |*none* |

Please also see the [RPiPlay Usage documentation](https://github.com/FD-/RPiPlay#usage).


