play-local-osx:
	ansible-playbook --connection=local -i 127.0.0.1, playbook.yml -e docker_group=staff -e ansible_python_interpreter=/usr/local/bin/python3

play-local:
	ansible-playbook --connection=local -i 127.0.0.1, playbook.yml

play:
	ansible-playbook -i elk.vermilion.tech, playbook.yml -u ${ANSIBLE_SSH_USER}
