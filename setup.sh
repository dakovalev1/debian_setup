apt update -y
apt upgrade -y
curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64' --output vscode.deb
dpkg -i vscode.deb
apt install -f -y
mkdir getifaddrs_skip
echo -e '#include <errno.h>\n#include <ifaddrs.h>\nint getifaddrs(struct ifaddrs **ifap) {\n\terrno = EOPNOTSUPP;\n\treturn -1;\n}' > getifaddrs_skip/getifaddr.c
