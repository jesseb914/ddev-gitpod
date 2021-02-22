[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/shaal/ddev-gitpod)

# ddev + Gitpod
## Set up a full Drupal dev environment in a browser

This project demonstrates a complete Drupal 9 development environment, utilizing ddev and Gitpod, through your browser.

## Video Demo

Watch a 5 minutes walkthrough video:

<a href="http://www.youtube.com/watch?v=ifk5dF6rGy0"><img src="https://user-images.githubusercontent.com/22901/107867673-c6fc7080-6e4a-11eb-81c9-542cd779026b.png" width=300 alt="Setup a full Drupal dev environment in a browser"></a>

## Prerequisites:
1. [Sign up for gitpod.io](https://gitpod.io/login)
1. Check [Enable Feature Preview](https://gitpod.io/settings) (To allow running docker inside docker)

## Try it out:
1. Click on the following link
  https://gitpod.io/#https://github.com/shaal/ddev-gitpod
1. Your environment is being prepared, wait for about 40 seconds (A splash screen will appear with a 3d Gitpod cube)
1. Theia (or VScode) IDE will be displayed.
1. Note that one terminal is running `sudo docker-up`, and another terminal in parallel is running `ddev start`
1. ddev will pull all required Docker images.
1. Find your website's URL `gp url 8080`
1. Open your website's URL in a browser, you should see Drupal's installation screen.
1. Run in terminal `ddev drush si demo_umami -y`
1. Open your website's URL in a browser, you should see Drupal's Umami demo.
1. Run in terminal `ddev xdebug on`
1. Open VScode's debugger, place a new breakpoint in `web/index.php`
1. Open your website's URL in a browser.
1. :tada:

## How does it work?
1. Gitpod - development environment based on Docker
    1. [.gitpod.yml](https://github.com/shaal/ddev-gitpod/blob/main/.gitpod.yml)
        1. Defines the main docker image this environment is built on - `.gitpod.Dockerfile`
        1. Run initial commands using 3 terminals in parallel:
            1. `gitpod-setup-ddev.sh`
            1. `composer install`
            1. `sudo docker-up`
    1. [.gitpod.Dockerfile](https://github.com/shaal/ddev-gitpod/blob/main/.gitpod.Dockerfile)
        1. Set base image to Gitpod's `workspace-full` ([link](https://github.com/gitpod-io/workspace-images/tree/master/full))
        1. Install ddev using brew
1. ddev - ridiculously simple setup for complex development environments
    1. [.ddev/config.yaml](https://github.com/shaal/ddev-gitpod/blob/main/.ddev/config.yaml) - main ddev configuration, can be generated by running `ddev config`
    1. [.ddev/gitpod-setup-ddev.sh](https://github.com/shaal/ddev-gitpod/blob/main/.ddev/gitpod-setup-ddev.sh) - generate config overrides for ddev to work in the Gitpod environment.
        1. Delete any existing Docker images and containers (due to Gitpod bug, that cause issues when restarting a workspace)
        1. Set certain ports to public, following Gitpod's syntax `[port]-[workspace-url]`
            1. `8080` - Drupal Website
            1. `8025` - Mailhog
            1. `8036` - PHPmyadmin
        1. Set `host.docker.internal` with the correct value of gitpod's host ip
        1. Starts ddev

## Thank you
[@rfay](https://github.com/rfay) for your endless patience and relentless support that made this project possible.


### Known issues:
* Once these Gitpod issues get resolved, starting a workspace will happen much faster:
    * [#2428 - `sudo docker-up` cannot run during prebuild](https://github.com/gitpod-io/gitpod/issues/2428)
    * [#3174 - Permissions in docker images are lost during gitpod restore](https://github.com/gitpod-io/gitpod/issues/3174)

### Future:
* [Figure out storage solutions](https://www.gitpod.io/docs/self-hosted/latest/install/storage)
* [PHPStorm as IDE on Gitpod](https://jetbrains.github.io/projector-client/mkdocs/latest/)
  * [WIP] [I can run PHPStorm in a browser on my computer, but not on Gitpod](https://community.gitpod.io/t/running-phpstorm-through-projector-in-gitpod/2760)
  * `docker run --rm -p 8887:8887 -it registry.jetbrains.team/p/prj/containers/projector-phpstorm`
  * [Latest JetBrains' status update](https://youtrack.jetbrains.com/issue/IDEA-226455#focus=Comments-27-4683103.0-0)
