# KMP
# Members in Team
### Kyle Sheeley 
### Matendo Reguma
### Patrick McCardle
# Quick demo instructions
## 1) 
### Download and install all pre-reqs

#### First, clone this repo
#### Move into the install_scripts directory
#### Run all 3 scripts (download_and_install_docker, download_and_install_atom, nvm_install)

## 2)
### Move into the testAutomation/project/enketo directory
### There is an enketo-express.zip folder. Unzip that by first confirming you have unzip ```sudo apt-get install unzip```, then once you are certain you do, type ```unzip enketo-express.zip``` 

## 3)
### Copy the Docker_run_script from the enketo directory into the newly created enketo-express-2 directory, this is the project root.
### Move into the project root and run the Docker_run_script that you just moved
### While that is working you can open up another terminal and run ```docker ps``` to confirm that the containers are up and running. From the same terminal you may type ```docker logs -f ``` to confirm that there is an npm install happening inside the enketo container

## 4)
### When the script is done running it will bash you into the project root from within the container, you may ```exit``` out of that container to be returned to your local machine, where you can perform the demo.
### move to the testAutomation directory and copy/replace the Gruntfile.js located in the PROJECT ROOT with the Gruntfile.js that is in the testAutomation directory
### From the project root download and apply the test reporter mochawesome.```sudo apt-get install npm``` then ``` npm install --global mocha``` then ```sudo npm install --save-dev mochawesome``` then ``` npm install --global mocha``` and then ```mocha Gruntfile.js --reporter mochawesome```

## 5) 
### Now you can move into the scripts folder from the testAutomation directory
### Perform (sudo) ./runAllTests.sh

### Testing report will be displayed across 5 tabs

### !!! 
### If full testing report does not display, cd into the project root, then into the mochawesome-report directory typing ```xdg-open filename.html``` will open the files
