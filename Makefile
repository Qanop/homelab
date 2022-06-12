# ----------------------------------------------------
# Init project "modules" and dependencies
# ----------------------------------------------------
dependencies: dependencies-system dependencies-ansible

dependencies-ansible:
	ansible-galaxy collection install ansible.posix

dependencies-system:
	sudo apt-get install sshpass

# ----------------------------------------------------
# Run full setup
# ----------------------------------------------------
all:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/all.yaml

# ----------------------------------------------------
# Run ansible PiHole playbooks
# ----------------------------------------------------
pihole-bootstrap: # set basic settings for new instance of raspberry
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/ansible-pihole/bootstrap-pihole.yaml

pihole-update: # update apt packages and pihole
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/ansible-pihole/update-pihole.yaml

# ----------------------------------------------------
# Run ansible Pi Basic Installs and Settings playbooks
# ----------------------------------------------------
pi-swap-settings:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/pi-swap-settings.yaml

# ----------------------------------------------------
# Apps
# ----------------------------------------------------
dashboard: heimdall

gramaddict:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/gramaddict.yaml

heimdall: 
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/heimdall-docker.yaml

home-assistant:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/home-assistant-docker.yaml

portainer:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/portainer-docker.yaml

rpi-monitor:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/rpi-monitor-docker.yaml

shlink:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/shlink-docker.yaml

speedtest-tracker:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/speedtest-tracker-docker.yaml

traefik:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/traefik-docker.yaml

wireguard:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/wireguard-docker.yaml
