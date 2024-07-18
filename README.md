This serves as a basic container solution for a project that proves CF development occurring locally within containers.
We use a docker-compose file here.

Pulling this repository will allow for a quick setup of ColdFusion and the necessary datasource. THe minimum requirement is having Podman Desktop installed and basic python pip install to obtain podman compose.

podman compose up -d : this command will whip up the containers on your local machine when called in the directory of docker-compose.yml

After this point you may start developing, testing or further improving the container solution.

Next stages for this project include developing and enabling React componenets as migration towards React begins.
