#!/bin/bash

#for readability and instructions
RED='\033[1;31m' #Bold red
NC='\033[0m' # No Color
BLUE='\033[0;36m' # Blue
BLACK='\033[1;30m' # Bold Black

#Name and github email
EXPECTED_ARGS=2

echo "you must have a github account to continue with this process"
echo -e "if you don't, press ctrl-c, create an account here:${BLUE} https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github${NC}"
echo "and rerun this script once you have created one"
echo " "

#check if student provides both name and email
if [ $# -ne $EXPECTED_ARGS ]; then
    echo "Please provide your name as one word, and the email associated with your github"
    echo "like this: ./githelp.sh jenna jenloveslinux@gmail.com"
    echo "rerun with the correct format!"
    exit 1
fi

#configure git w name and email
git config --global user.name $1
git config --global user.email $2

echo " "
echo "this next step will create your key to connect with github, when prompted"
echo -e "${RED}press enter for each prompt, ${NC}or choose where you want to save your key"
echo " "

#generate key to link w github
ssh-keygen

echo " "
echo -e "${RED}COPY THE WHOLE STRING BELOW INTO GITHUB HERE: ${BLUE} https://github.com/settings/keys ${NC}"
cat ~/.ssh/id_rsa.pub
echo " "

#don't have all the instructions print out at once
sleep 3s
echo "once you've copied the string above into your ssh keys on github"
echo "your github is set up in the lab environment!"
echo "for more information or trouble shooting help, check out:"
echo -e "${BLUE}https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent${NC}"

