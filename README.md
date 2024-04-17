<p align="center"><img src="https://img.shields.io/docker/pulls/iolave/clamav?logo=docker"></img></p>

# ClamAV daemon docker image

<p align="center"><img src="https://i.imghippo.com/files/HLZfZ1713358376.png"></img></p>

This image spins up a ClamAV daemon instance allowing to build services alongside it with tools like the [nodejs clamscan package](https://www.npmjs.com/package/clamscan).


- Feel free to experiment modifying the `./config/fresclam.conf` file for your needs.
- Docker args are not allowed yet for settings like `fresclam.conf` and `clamd.conf`
- Exposes port `6666`.

## Create a container
```bash
docker run -p 6666:6666 iolave/clamav
```

## Tags
View available tags in the [docker hub repo](https://hub.docker.com/r/iolave/clamav/tags).
