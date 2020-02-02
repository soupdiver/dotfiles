#export LC_CTYPE=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

# Paths for macOS machines
if [ $(uname -s) = "Darwin" ]
then
  export GOPATH="/Users/felix/gocode"
  export GOROOT="/usr/local/Cellar/go/$(ls /usr/local/Cellar/go | head -n1)/libexec"
fi

# Golang
if [ -n $GOPATH  ]
then
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -n $GOROOT ]
then
  export PATH="$GOROOT/bin:$PATH"
fi
