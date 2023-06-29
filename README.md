# Docker Template for Astro Projects (Devcontainer)
Template for deploying development environments using dockers for web applications created with Astro.

 We are using ```Docker Compose``` with a single service. [Astro](https://astro.build)<font size="2"> is being used to develop the web app and the app  is containerized using a Docker container.

> **Note:** Initially this repository is intended to be used as development container, a way of using Dockers containers with development environments installed inside them, and not in your main system, in a service infrastructure context very similar to the existing one in a production environment.

## 1. Install prerequisites
This project has been mainly created for Unix (Linux/MacOS). Perhaps it could work on Windows if you use [WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/training/modules/get-started-with-windows-subsystem-for-linux/2-enable-and-install)

All requisites should be available for your distribution. The most important are :

* [WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install)<font size="2"> (Windows users)</font>
* [Git](https://git-scm.com/downloads)
* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Visual Studio Code](https://https://code.visualstudio.com)<font size="2"> (You can use whatever IDE allows you to work inside containers)</font>

Check if `docker-compose` is already installed by entering the following command: 

```sh
which docker-compose
```

Check Docker Compose compatibility :

* [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/)

## 2. Docker image and service overview
* [node:current-alpine](https://hub.docker.com/_/node/)


|   Server   | Port |  Service URL |
|------------|------| -------------
| Astro APP  | 3000 | http://localhost:3000/                                       |      


## 3. How to use this repository?
Here are some summary guidelines for using this repository to start a new ``` dockerized Astro project```.

### 3.1. Clone the repository
```sh
git clone https://github.com/jraicr/docker-astro-template.git myProject
```

After cloning you can change or remove the remote origin from this repository and set up your own for the project. How to use git is beyond the scope of this document.

**Related links**
 - [Managing remote repositories](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories)
 - [Adding locally hosted code to GitHub](https://docs.github.com/en/get-started/importing-your-projects-to-github/importing-source-code-to-github/adding-locally-hosted-code-to-github)


### 3.2. Configure environment variables
First you must add to your ```.bashrc``` or ```.zshrc``` file the following variable exports:

  - Open ```.bashrc``` or ```.zshrc``` with a text editor like nano:

```sh
cd ~
nano .bashrc
```

  - Write the following lines at the end of the file:

```sh
export UID="$UID"
```

Secondly you must be editing the docker compose environment file to setup the services:

- Copy ```.devcontainer/.example.env``` to ```.devcontainer/.env``` Here you will configure everything you need to make the container services work correctly:
‎

  - You should configure ```PROJECT_NAME``` variable.
  ‎

- You are able to change the ports used for internal container and exposed service .

:information_source: **See [configuration](#4-configuration)** for more details.

### 3.3. Generate a new Astro project
- To generate a new Astro project uses this command from the project root:
```sh
sh -c bash_tools/scripts/generate_new_astro_project.sh
```
This will generate a new project with the latest version of Astro.

### 3.4. Deploy containers for development
- **Compose up** command:
```sh
docker compose -f ".devcontainer/docker-compose.yml" up -d --build 
```

- **Compose down** command:
```sh
docker compose -f ".devcontainer/docker-compose.yml" down  
```

If you are using **VS Code** as your main IDE, alternatively you can open the project folder and do a right click on docker-compose file in order to manage it. This require to have installed [Docker VSCode extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker). After composing up the containers you should be able to connect to web services in your web browser.

To start working inside a container from ```VS Code``` you will need [Remote Development extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) **(if you are in windows you will need WSL 2)** you can press F1 and type ```Attach to running container``` then select the webapp container to start working inside it. You can also do it from the Dockers view in VS Code and doing a right click on the container you are interested to work in and select ```Attach Visual Studio Code```.

:information_source: **See [developing inside a container](https://code.visualstudio.com/docs/devcontainers/containers)** for more details.

## 4. Astro web application project
The image used in the webapp container is used to work with the latest version of Astro framework.

Before composing up the containers it is important to have ready the folder with the project, since the webapp container will be mounting this folder as a volume.

## 5. Contributing to this repository
Feel free to contribute to this project with any changes. Make a fork of the repository and clone it on your computer, make changes as you see fit and create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).