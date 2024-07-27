# Scripts

### ```install_other.sh```

This bash script performs the following actions:

1. Updates the package list and installs necessary packages:
    - `powertop`
    - `htop`
    - `rsync`
    - `samba`
    - `smartmontools`

2. Configures scheduled tasks using `cron`:
    - Appends two new cron jobs to the `crontab` file:
        - Will run `powertop` with the `--auto-tune` option every time the system reboots.
        - Will run the `backup_docker_volumes.sh` script located in `/home/gus` at midnight every day.
#### Usage
`sudo ./install_other.sh`

<hr>

### ```docker_all.sh```
This script manages Docker Compose services across multiple directories. Depending on the argument provided (`up` or `down`), it will either start (`up -d`) or stop (`down`) the Docker Compose services in each specified directory.

#### Usage

1. Run the script with `up` to start services.
2. Run the script with `down` to stop services.

<hr>
#