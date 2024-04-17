<p align="center"><img src="https://img.shields.io/docker/pulls/iolave/clamav?logo=docker"></img></p>

# ClamAV daemon docker image

<p align="center"><img src="https://i.imghippo.com/files/HLZfZ1713358376.png"></img></p>

This image spins up a ClamAV daemon instance allowing to build services alongside it with tools like the [nodejs clamscan package](https://www.npmjs.com/package/clamscan).


- Feel free to experiment modifying the `./config/fresclam.conf` file for your needs.
- Docker args are not allowed yet for settings like `fresclam.conf` and `clamd.conf`
- Exposes port `3310`.

## Usage
### Build locally
Clone this repository or download the [latest release](https://github.com/iolave/docker-clamav/releases) and run the following docker build command:

```bash
docker build -t iolave/clamav .
```

### Pre-build image
```bash
docker run -p 3310:3310 iolave/clamav
```

## Tags
View available tags in the [docker hub repo](https://hub.docker.com/r/iolave/clamav/tags).
