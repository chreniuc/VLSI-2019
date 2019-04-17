# VLSI-2019

Docker image can be foud here for medelsim: https://hub.docker.com/r/xaerdna/modelsim

You can run it like this:

```bash
xhost +

# -v to mount a folder to save your projects
docker run --name="modelsim" -v $(pwd)/modelsim:/modelsim -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -it xaerdna/modelsim
```

In the container:

```bash
cd /root/altera/15.0/modelsim_ase/linux

./vsim
```
