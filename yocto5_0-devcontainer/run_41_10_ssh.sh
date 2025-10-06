source sources/poky/oe-init-build-env build

# ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"

echo "---------------"

set -x

# Do NOT write to ~/.ssh/known_hosts
# Do AVOID this questions: Are you sure you want to continue connecting (yes/no)? 
ssh -p 2222 -o StrictHostKeyChecking=No -o UserKnownHostsFile=/dev/null root@localhost $@
