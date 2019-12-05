*** Settings ***
Library   SeleniumLibrary
Library  ../Libraries/OS_Info.py

*** Keywords ***

Open and Maximize Chrome Browser
    Open Browser  http://www.boots.ie  chrome
    Maximize Browser Window

Get system under test information
    ${OS_Name}  get os sut
    Run Keyword If  "${OS_Name}" == "windows"  Log  This is Windows OS
    ...  ELSE IF   "${OS_Name}" == "darwin"   Log  This is Mac OS
