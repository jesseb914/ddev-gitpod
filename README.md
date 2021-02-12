[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/shaal/ddevenv)

# ddev + Gitpod
## Running local environment on the cloud

This project demonstrate setting up a full Drupal 9 development evironment utilizing ddev on Gitpod. 

## Prerequisites:
1. [Sign up for gitpod.io](https://gitpod.io/login)
1. Check [Enable Feature Preview](https://gitpod.io/settings) (To allow running docker inside docker)

## Try it out:
1. Click on the following link
  https://gitpod.io/#https://github.com/shaal/ddevenv
1. Your environment is being prepared, wait for about 40 seconds (A splash screen will appear with a 3d Gitpod cube)
1. Theia (or VScode) IDE will be displayed.
1. Note that one terminal is running `sudo docker-up`, and another terminal in parallel is running `ddev start`
1. ddev will pull all required Docker images.
1. Find your website's URL `gp url 8080`
1. Open your website's URL in a browser, you should see Drupal installation screen.
1. Run in terminal `ddev drush si demo_umami -y`
1. Open your website's URL in a browser, you should see Drupal Umami demo.
1. Type in terminal `ddev xdebug on`
1. Open VScode's debugger, place a new breakpoint in `web/index.php`
1. Open your website's URL in a browser.
1. :tada: :exploding_head:

## How does it work?
1. Gitpod - development environment based on Docker
    1. [.gitpod.yml](https://github.com/shaal/ddevenv/blob/main/.gitpod.yml)
        1. Defines the main docker image this environment is built on
        1. Make ports public (8080, 8025, 8036)
        1. Run initial commands like `composer install`, `sudo docker-up`, `ddev start`
    1. [.gitpod.Dockerfile](https://github.com/shaal/ddevenv/blob/main/.gitpod.Dockerfile)
        1. Set base image to [workspace-full](https://github.com/gitpod-io/workspace-images/tree/master/full)
        1. Install ddev using brew
1. ddev - rediciliously simple setup for complex development environments
    1. [.ddev/config.yaml](https://github.com/shaal/ddevenv/blob/main/.ddev/config.yaml) - main ddev configuration, can be generated by running `ddev config`
    1. [.ddev/generate-fqdns.sh](https://github.com/shaal/ddevenv/blob/main/.ddev/generate-fqdns.sh) - A script that opens the special ports 8080, 8025 and 8036 in gitpods syntax `[port]-[workspace-url]`
    1. [.ddev/generate-xdebug-host-ip.sh](https://github.com/shaal/ddevenv/blob/main/.ddev/generate-xdebug-host-ip.sh) - A script that sets `host.docker.internal` with the correct value of gitpod's host ip.

## Thank you
[@rfay](https://github.com/rfay) for your endless patience and relentless support that made this project possible.


### Known bugs:
* [Workspace doesn't restart correctly](https://github.com/gitpod-io/gitpod/issues/3174)

### Future:
* [Figure out storage solutions](https://www.gitpod.io/docs/self-hosted/latest/install/storage)
* [PHPStorm as IDE on Gitpod](https://jetbrains.github.io/projector-client/mkdocs/latest/)
