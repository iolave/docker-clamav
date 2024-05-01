# CHANGELOG
## v1.1.0
### MINOR
- Changed default exposed port to `3310` as [clamav docs](https://docs.clamav.net) says.
### PATCH
- Adds `version` file for managing releases.

## v1.0.1
### PATCH
- Moved apt dependencies to config `config/apt-dependencies.json` file.
- Adds a GitHub workflow that checks for newer versions of apt packages.
- Adds docker hub tags link to README.

## v1.0.0
### MAJOR
- Adds `fresclam.conf` file to allow user settings.
- Exposes port `6666` for daemon.