Steps to use WSL Ubuntu

 

in Windows Features, check Virtual Machine Platform and Windows Subsystem for Linux

in Powershell, run `wsl --set-default-version 2`

Download Ubuntu from Microsoft Store (or run `wsl` in PowerShell)

 

Add the following to /etc/wsl.conf on System

```

# Enable extra metadata options by default

[automount]

enabled = true

root = /mnt/

options = "metadata,umask=22,fmask=11"

mountFsTab = false

 

# Enable DNS – even though these are turned on by default, we'll specify here just to be explicit.

[network]

generateHosts = true

generateResolvConf = true

```

Close all WSL instances, run `wsl --shutdown` in PowerShell

back in instance, `mount -l` should show `metadata` in the options for /mnt/c

 

in Powershell with VPN running, run `ipconfig /all` to get primary and secondary DNS server IPs

`wsl`

delete /etc/resolv.conf (it's a symlink)

replace /etc/resolve.conf containing

```

nameserver [PRIMARY IP]

nameserver [SECONDARY IP]

```

`sudo chattr +i /etc/resolv.conf` (write-protecting)

exit

Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000

 

copy dotfiles

install zsh

chsh -s $(which zsh)

 

symlink for deeper directories, ie:

``

 

to copy from tmux to Windows clipboard:

in .tmux.conf (requires WSL2)

```

bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel '/mnt/c/Windows/System32/clip.exe'

bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel '/mnt/c/Windows/System32/clip.exe'

```

 

symlink directories:

ln -s [link path] [src path]

 

 

markdown viewer:

sudo apt install curl xdg-utils

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt install nodejs

sudo npm -g install instant-markdown-d

 

 

 

 

 

To swap Ctrl and CapsLock:

in PowerShell (as Admin):

```

$hexified = "00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,3a,00,1d,00,00,00,00,00".Split(",") | % { "0x$_"};

 

$kbLayout = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout';

 

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified)

```
