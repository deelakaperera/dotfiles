# Install node 22
# npm install -g yaml-language-server
# install kubectl
To use it: restart Neovim, run nvim deployment.yaml, give it a few seconds, then type api and press <C-Space>. The steps from before still apply.

For other resource types, either add a line to the table in yamlls.lua or put this comment as the first line of the file:
# yaml-language-server: $schema=https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.34.1-standalone-strict/statefulset-apps-v1.json
File names follow the pattern <kind>-<group>-<version>.json, for example cronjob-batch-v1.json or daemonset-apps-v1.json.

The schemas are still downloaded from GitHub each session, so completion needs an internet connection.
