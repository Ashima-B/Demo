*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/Boots_Keywords.robot
Suite Setup  Open and Maximize Chrome Browser
Suite Teardown  Close Browser
# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Test Cases ***
Logged out user can search for product
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Search for product  Botanics

Logged out user can view the product
    Search for product  Botanics
    Results for searched product is displayed

Logged out user can add product to cart from the sub category
    [Tags]  S1
    Search for product  Botanics
    Results for searched product is displayed
    User can select the sub category
    User can add the selected item to cart

Logged out user can add and remove items from cart
    [Tags]  S2
    Search for product  Botanics
    Results for searched product is displayed
    User can select the sub category
    User can add the selected item to cart
    User can click on proceed checkout button
    User can add more item to cart
    User can remove item from cart

Logged out can user can remove last item from cart
    [Tags]  S3
    Search for product  Botanics
    Results for searched product is displayed
    User can select the sub category
    User can add the selected item to cart
    User can click on proceed checkout button
    User can remove last item from cart

Logged out user canot proceed to checkout
    [Tags]  S4
    Search for product  Botanics
    Results for searched product is displayed
    User can select the sub category
    User can add the selected item to cart
    User can click on proceed checkout button
    User can add more item to cart
    User clicks on Checkout button
    User must loggin to proceed

Logged in user can proceed to checkout
    [Tags]  S5
    Search for product  Botanics
    Results for searched product is displayed
    User can select the sub category
    User can add the selected item to cart
    User can click on proceed checkout button
    User can add more item to cart
    User clicks on Checkout button
    User must loggin to proceed
    User enters the email id
    User enters the password and selects Log In



