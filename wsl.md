# WSL
> [!NOTE]
> WSL stands for Windows Subsystem for Linux

```bash
wsl --install ## install Linux distribution - default is Ubuntu
wsl --install -d debian ## install a specific distribution
wsl --unregister -d debian ## uninstall a distribution

wsl -l ## list installed Linux distributions
wsl -l -o ## list online available distributions

wsl ## lauch default Linux distro
wsl -d debian ## lauch a specific distribution

wsl -v ## see wsl version
wsl -l -v ## list installed Linux distributions and their version
```
