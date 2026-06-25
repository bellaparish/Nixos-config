git diff -U0
echo "Git commit message: "
read message
echo "Nixos Rebuilding ... "
sudo nixos-rebuild switch --flake ~/Nixos-config#Thinkpadt480s &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
git add .
git commit -m "$message" 
