#!/bin/sh

INPUT=$1
OUTPUT=$2

showHelp()
{
    echo "$0 <input_image> [output_directory]"
}

if [ -z ${INPUT} ]; then
    showHelp
    exit 0
fi

if [ -f ${INPUT} ]; then
    if [ -d ${OUTPUT} ] ; then
        if [ -z ${OUTPUT} ] ; then
            OUTPUT="out/"
        else
            OUTPUT="${OUTPUT}/"
        fi
    fi

    echo "Converting ${INPUT} into ${OUTPUT}..."

    rm -fr "${OUTPUT}icons/" && mkdir -p "${OUTPUT}icons/"

    convert "${INPUT}" -scale 192x192 "${OUTPUT}icons/icon-192x192.png"
    convert "${INPUT}" -scale 256x256 "${OUTPUT}icons/icon-256x256.png"
    convert "${INPUT}" -scale 384x384 "${OUTPUT}icons/icon-384x384.png"
    convert "${INPUT}" -scale 512x512 "${OUTPUT}icons/icon-512x512.png"

    cp manifest.json "${OUTPUT}"

    echo "Done."
else
    showHelp
fi
