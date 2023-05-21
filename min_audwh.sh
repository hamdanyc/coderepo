#!/bin/bash

file_list=$(ls ../audio/aud_part/*.m4a)

for files in $file_list
do

    curl https://api.openai.com/v1/audio/transcriptions \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -H "Content-Type: multipart/form-data" \
      -F model="whisper-1" \
      -F file="@$files" \
      -F response_format=vtt
done
