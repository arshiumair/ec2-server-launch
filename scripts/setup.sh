echo "updating packages"

sudo dnf update -y

#install nginx
echo "installing nginx"
sudo dnf install nginx -y

#run nginx
echo "starting nginx"

sudo systemctl start nginx
sudo systemctl enable nginx
