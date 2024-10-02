# ----------------------------------------------------
# Init project "modules" and dependencies
# ----------------------------------------------------
dependencies: dependencies-system dependencies-ansible

dependencies-ansible:
	ansible-galaxy collection install ansible.posix

dependencies-system-debian:
	sudo apt-get install sshpass

dependencies-system-macos:
	brew install sshpass


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
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/server-configuration/rpi-swap-settings.yaml

pi-mounts:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/server-configuration/mounts.yaml

# ----------------------------------------------------
# Apps
# ----------------------------------------------------

gramaddict:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/other/gramaddict.yaml

# ----------------------------------------------------
# Automation Apps
# ----------------------------------------------------
home-assistant:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/automation/home-assistant.yaml

# ----------------------------------------------------
# Network Apps
# ----------------------------------------------------
network:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/network.yaml

portainer:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/network/portainer.yaml

speedtest-tracker:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/network/speedtest-tracker.yaml

traefik:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/network/traefik.yaml

wireguard:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/network/wireguard.yaml

# ----------------------------------------------------
# Monitoring Apps
# ----------------------------------------------------
monitoring:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/monitoring.yaml

prometheus:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/monitoring/prometheus.yaml

grafana:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/monitoring/grafana.yaml

# ----------------------------------------------------
# Mediarr Apps
# ----------------------------------------------------
mediarr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr.yaml

qbittorrent:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/qbittorrent.yaml

jellyfin:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/jellyfin.yaml

jellyseerr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/jellyseerr.yaml

sonarr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/sonarr.yaml

radarr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/radarr.yaml

prowlarr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/prowlarr.yaml

flaresolverr:
	ansible-playbook -i inventory.yaml -i inventory-secure.yaml playbooks/mediarr/flaresolverr.yaml
