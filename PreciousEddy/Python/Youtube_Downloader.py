## install "pip install yt-dlp"

import yt_dlp

# Enter the url for the download

url = input("Enter the vidoe url: ")

ydl_opts = {}

with yt_dlp.YoutubeDL(ydl_opts) as ydl:
    ydl.download([url])
    
print("Yippeee😊, Video Downloaded Successfully")