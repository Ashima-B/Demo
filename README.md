# Demo
Demo for the automation flow on Boots website using Robot framework

## Setup and Execution
**Pre-requisite:** Python 3.x needs to be installed

Clone the git repository into a folder using below command

`git clone https://github.com/Ashima-B/Demo.git`

OR Download source code as zip and extract

Then cd into Demo/Tools directory and run `Execute.bat`

This batch script will install required python dependencies and set the path for the `chromedriver` for the execution and executes the robot test cases.

## After test execution
Execution will create a Results directory with Test Results

Open `Report.html` in browser of choice to view the test run results

## Cleanup
To uninstall the pip packages which were installed as a part of execution please run `Cleanup.bat`

_*** Path setup is only for the run so it will be restored as normal after the execution**_