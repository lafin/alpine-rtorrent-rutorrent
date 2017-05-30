Docker container with rTorrent and ruTorrent (stable and latest from github)
============================================================================

based on diameter/rtorrent-rutorrent

```bash
rm -rf ./test
mkdir test
docker run -dt --name alpine-rtorrent-rutorrent -p 8080:80 -p 443:443 -p 49160:49160/udp -p 49161:49161 -v $(pwd)/test:/downloads lafin/alpine-rtorrent-rutorrent:x86_64-stable
```