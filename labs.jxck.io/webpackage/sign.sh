# go get github.com/nyaxt/webpackage/go/signedexchange/cmd/gen-certurl
# go get github.com/nyaxt/webpackage/go/signedexchange/cmd/gen-signedexchange
# mv ./nyaxt/bin/* .
# rm -rf ./nyaxt

./gen-certurl /etc/letsencrypt/live/mozaic.fm/cert.pem  > cert.pem.msg

./gen-signedexchange \
  -uri https://mozaic.fm/index.html \
  -content /home/jxck/server/jxck.io/mozaic.fm/index.html \
  -certificate /etc/letsencrypt/live/mozaic.fm/cert.pem \
  -certUrl https://labs.jxck.io/webpackage/cert.pem.msg \
  -validityUrl https://labs.jxck.io/webpackage/cert.pem.msg \
  -privateKey /etc/letsencrypt/live/mozaic.fm/privkey.pem \
  -expire 24h0m0s \
  -o ./mozaic.sxg
