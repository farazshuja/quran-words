
## trim all files using imagemagic
```
magick convert -trim  *.jpg // not converting the last file
```

## compress by losing some quality
```
magick convert -quality 25  source.jpg dest.jpg // not converting the last file
```

## rename files in dir using Powershell
```
dir | rename-item -NewName {$_.name -replace "Quranic Dictionary By Lutf ur Rahman_page-0552-",""}
```