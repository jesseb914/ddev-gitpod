ddev poweroff
# Remove docker containers and specific docker images, because of a gitpod bug
docker rm -f $(docker ps -aq) || true
images_found=$(docker images | awk '/^drud\/ddev-(webserver|ssh-agent|dbserver)/ { print $3 }') || true
if [[ "$images_found" ]]; then
    docker rmi -f $images_found
fi

mkcert -install
ddev config global --instrumentation-opt-in=true --router-bind-all-interfaces=true
.ddev/gitpod-generate-overrides.sh
.ddev/gitpod-generate-fqdns.sh
.ddev/gitpod-generate-xdebug-host-ip.sh
ddev start
echo Your website is available at this url:
echo $(gp url 8080)
