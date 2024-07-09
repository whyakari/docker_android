# Docker on Android
> and Resolve Problems

### Adding support of the Docker on Android
```
wget https://github.com/whyakari/docker_android/raw/main/docker_support.sh && chmod +x docker_support.sh && ./docker_support.sh
```
> just adjust the defconfig in the script according to your device.



### Problem 1
Error:
```
docker: Error response from daemon: failed to create task for container: failed to start shim: start failed: io.containerd.runc.v2: create new shim socket: listen unix /data/data/com.termux/files/usr/var/run/containerd/s/1da210b0827a1c772c72b223e4f1d42d8604457319c91bfc896ef8bb8919411e: bind: invalid argument: exit status 1: unknown.
ERRO[0000] error waiting for container:
```

There's an open bug report about it since last year -

https://github.com/termux/termux-packages/issues/18359

The current workaround is to use previous version of **containerd** -

```sh
curl -o containerd_1.6.21-1_aarch64.deb -L "https://www.dropbox.com/scl/fi/9ihg5gnlzwtbookjs5szy/containerd_1.6.21-1_aarch64.deb?rlkey=vsywpuz3e2x3edu72yklwvod6&st=tzl93ri9&dl=1" && pkg install -y --allow-downgrades --allow-change-held-packages ./containerd_1.6.21-1_aarch64.deb && apt-mark hold containerd
```

Thanks to [Near_Earth](https://www.reddit.com/user/Near_Earth/)
