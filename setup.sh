apt update -y
apt upgrade -y
# setup vscode
curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64' --output vscode.deb
dpkg -i vscode.deb
apt install -f -y
dpkg -i vscode.deb
# setup python
apt install python3-dev python3-venv -y
python3 -m venv .venv
echo 'source /root/.venv/bin/activate' >> .bashrc
source .bashrc
pip install numpy scipy jupyter
# skip getifaddrs
apt install gcc -y
mkdir getifaddrs_skip
echo -e '#include <errno.h>\n#include <ifaddrs.h>\nint getifaddrs(struct ifaddrs **ifap) {\n\terrno = EOPNOTSUPP;\n\treturn -1;\n}' > getifaddrs_skip/getifaddr.c
gcc getifaddrs_skip/getifaddr.c -o getifaddrs_skip/getifaddr.so -shared
# LD_PRELOAD=/root/getifaddrs_skip/getifaddr.so jupyter-notebook
