![](https://github.com/martialonline/zsh/workflows/Continuous%20Integration/badge.svg)

<p align="center">
  <img src="https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png" width="30%" alt="Oh My Zsh">
</p>

This project acts as a wrapper for installing **Oh My Zsh**. It enables you to install the popular framework selecting a custom theme and plugins without having to edit the `.zshrc` configuration file afterwards.

Oh My Zsh is an open source, community-driven framework for managing your [zsh](https://www.zsh.org/) configuration.

## Getting Started

### Prerequisites

* A Unix-like operating system: macOS, Linux, BSD
* [zsh](https://www.zsh.org) (v4.3.9 or more recent)
* `git` (recommended v1.7.2 or higher)
* `curl` or `wget`

### Installation

Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

The table below shows avaiable arguments for the setup script.

| CLI Argument | Description | Default |
| :----------------------- | :------------ | :------------ |
| `-t` | The theme to install | `"robbyrussell"` |
| `-p` | The plugins to install (separated with a space) | `""` |
| `-h` | Displays the help |  |

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/martialonline/zsh/master/setup.sh)" "" -t robbyrussell -p "docker git"
```

#### via wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/martialonline/zsh/master/setup.sh)" "" -t robbyrussell -p "docker git"
```

### Plugins

Check the Oh My Zsh [wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) to see what plugins are available.

### Themes

Check the Oh My Zsh [wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) to see what themes are available.

### Manual Installation

#### 1. Clone the repository

```shell
git clone https://github.com/martialonline/zsh.git
```

#### 2. Run the setup script

```shell
cd zsh && ./setup -t robbyrussell -p "docker git"
```

#### 3. Change default shell

```shell
chsh -s $(which zsh)
```
