# TeamTells Infrastructure Launchpad

## Overview
This repository serves as a comprehensive hub for all CI/CD, automation, deployment, and auto-configuration resources related to the TeamTells project.

**Note:** While this repository is optimized for use with IntelliJ IDEA for ease of use, manual control remains an option for those who prefer it.

## Repository Structure

The repository is organized into several directories, each serving a specific purpose:

- `ansible`: This directory houses all Ansible configuration files.
- `backend`, `web`: These are submodules linked to the actual repositories. Please update as necessary.
- `ci`: This directory contains various scripts for automatic pipelines and getting started. It includes:
    - `Jenkinsfile`: *(Planned for future implementation)*
    - `Dockerfile`: This file creates an image for a complete CI/CD environment.
    - `scripts`: This subdirectory contains several scripts:
        - `fresh-machine-prepare.sh`: This script is intended to run to terraform a fresh machine before ansible usage.
        - `build.sh`: *(Planned for future implementation)* This script is intended to build images.
        - `test.sh`: *(Planned for future implementation)*
        - `deploy.sh`: This script runs Ansible and accepts one argument indicating the selected environment (dev/prod).
- `k8s`: *(Planned for future implementation)* This directory will contain Kubernetes deployment configurations.
- `docker`: This directory contains docker-compose configuration.
  - `build`: This directory contains unversioned deployment data (layout suitable for docker-compose deployment).

## Deployment Instructions

1. Using Docker
    1. Navigate to the `ci` directory.
    2. Build the Docker image: `docker build -t tt_ci_image .`
    3. Run the Docker container with the following command: `docker run -it tt_ci_image /bin/bash`.
       Once inside the Docker container, you can run Ansible commands as you would in a regular terminal.

2. Using Local Ansible Installation
    1. Install Ansible by following instructions at <https://docs.ansible.com/ansible/latest/installation_guide/index.html>.

To deploy, navigate to the `ci/scripts` directory and execute the relevant scripts to build, test (if available), and deploy the project.

## Manual Ansible Execution

You can manually run Ansible using either a Docker image in the `ci` directory or an available Ansible installation in your environment. Here are the steps for both methods:
1. Prepare environment
2. Navigate to the `ansible` directory.
3. Run the Ansible playbook: `ansible-playbook main.yml -i staging`
