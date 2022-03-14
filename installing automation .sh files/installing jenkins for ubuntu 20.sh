sudo apt update


if [[ -n $(java -version| grep "Command 'java' not found") ]]
then
     sudo apt install default-jre -y
     sudo apt install default-jdk -y 
else
    echo "You have java"
fi



wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -



sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'



sudo apt update

sudo apt install jenkins -y

sudo systemctl start jenkins

if [[ -n $(sudo systemctl status jenkins | grep "active") ]]
then
    echo "Your Jenkins is inactive"
else
    sudo ufw allow 8080

    sudo ufw allow OpenSSH
    sudo ufw enable
    sudo ufw status
fi



