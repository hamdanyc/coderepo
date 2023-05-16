#!/bin/bash
file_list=$(ls ../min_out/outline/*.txt)

for files in $file_list
do
    # get chatgpt to summarise text
    TEXT=$(cat $files | tr '\n' ' ') && \
    RS=$(curl -s https://api.openai.com/v1/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d '{
        "model": "text-davinci-003",
        "prompt": "'"List 3 to 5 main points and briefly summarised. Suggest title for each main points.: $TEXT"'",
        "max_tokens": 255,
        "temperature": 0
      }' | jq -r '.choices[].text' | tr -d '\"' | tr ']' '\n[')
    echo $RS
    echo -e "Terjemahan:\n\n"
    # Translate text to Malay
    MY=$(echo $RS | tr '\n' ' ') && \
    curl -s https://api.openai.com/v1/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d '{
        "model": "text-davinci-003",
        "prompt": "'"Translate to Malay.: $MY"'",
        "max_tokens": 255,
        "temperature": 0
      }' | jq -r '.choices[].text' | tr -d '\"' | tr ']' '\n['
done


