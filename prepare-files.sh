#!/bin/bash

archiveFilePath="./AssaultCube_v1.2.0.2.tar.bz2"
archiveMainDirectoryName="AssaultCube_v1.2.0.2"
tmpOutputDirectory="./ac-server"

if [ ! -f "$archiveFilePath" ]; then
  echo "$archiveFilePath not found!"
fi

if [ -d "$tmpOutputDirectory" ]; then
  rm -r "$tmpOutputDirectory"
fi

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

mkdir "$tmpOutputDirectory"
tar -xvf "$archiveFilePath" -C "$tmpOutputDirectory/" --strip-components=1 "${filesToExtract[@]}"
