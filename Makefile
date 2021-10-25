create:
	npm run build
	ansible-playbook deploy/publish.yml
	git init
	git add .
	git commit -m "init"
	git branch -m main
	gh repo create gists --public -y
	gh secret set DEPLOY_KEY < ~/.ssh/cheboksaru/deploy_rsa
	git push origin main
entry:
	ansible-playbook entry.yml
	@echo Please edit: `ls -d _imports/sections`/`ls -tr _imports/sections | tail -1` 
	@ansible-playbook entries.yml > /dev/null
entries:
	ansible-playbook entries.yml
