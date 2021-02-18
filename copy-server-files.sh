#!/bin/bash

downloadUrl="https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2"
archiveFilePath="./AssaultCube_v1.2.0.2.tar.bz2"
archiveMainDirectoryName="AssaultCube_v1.2.0.2"
outputDirectory="/ac-server"


# Install the packages that are needed to download and extract the AssaultCube server files
apt-get install -y wget
apt-get install -y bzip2

# Download the current AssaultCube 1.2.0.2 release
wget "$downloadUrl"

# Extract the AssaultCube server files
filesToExtract=(
    # These files are the ones that are required inside the container
    "$archiveMainDirectoryName/bin_unix/linux_64_server"
    "$archiveMainDirectoryName/server.sh"

    # Extract the default config files, may be overwritten by a volume
    "$archiveMainDirectoryName/config/forbidden.cfg"
    "$archiveMainDirectoryName/config/maprot.cfg"
    "$archiveMainDirectoryName/config/motd_en.txt"
    "$archiveMainDirectoryName/config/nicknameblacklist.cfg"
    "$archiveMainDirectoryName/config/serverblacklist.cfg"
    "$archiveMainDirectoryName/config/servercmdline.txt"
    "$archiveMainDirectoryName/config/serverinfo_en.txt"
    "$archiveMainDirectoryName/config/serverkillmessages.cfg"
    "$archiveMainDirectoryName/config/serverpwd.cfg"

    # Extract the default server packages, may be overwritten by a volume
    "$archiveMainDirectoryName/packages/audio/ambience"
    "$archiveMainDirectoryName/packages/maps"
    "$archiveMainDirectoryName/packages/models/mapmodels"
    "$archiveMainDirectoryName/packages/textures"
)

mkdir "$outputDirectory"
tar -xvf "$archiveFilePath" -C "$outputDirectory/" --strip-components=1 "${filesToExtract[@]}"

# Remove the downloaded archive
rm "$archiveFilePath"

# Remove the temporary installed packages
apt-get autoremove -y wget
apt-get autoremove -y bzip2
