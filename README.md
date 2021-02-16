# RTSP Snapshot



Simple docker image to grab snapshot from a RTSP stream using ARM64 device like RPi as a fork from https://github.com/Thom-x/rtsp-snapshot.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities

In order to run this container you'll need docker installed.

* [RaspberryPi](https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Run the image

```shell
docker run "/path/to/snapshot/on/host:/var/www/localhost/htdocs/snapshots" -e URL=rtsp://192.168.1.63:8080/stream1 -p 80:80 rtsp-snapshot
```

Take a snapshot :

http://localhost/snapshot.cgi

List snapshots :

http://localhost/snapshots

#### Environment Variables

* `URL` - URL of the stream to grap snapshot from

#### Volumes

* `/var/www/localhost/htdocs/snapshots` - Snapshot folder location

## Built With

* mini_httpd 1.23-r1
* ffmpeg 2.8.11-r0


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
