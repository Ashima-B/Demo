*** Settings ***
Library   SeleniumLibrary

*** Keywords ***

Open and Maximize Chrome Browser
    Open Browser  http://www.boots.ie  chrome
    Maximize Browser Window