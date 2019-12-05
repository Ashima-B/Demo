pip install -r ../Dependencies/requirements.txt
IF EXIST %cd% SET PATH=%PATH%;%cd%
robot -d ../Results ../Tests/Boots_demo.robot
