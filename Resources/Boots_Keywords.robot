*** Settings ***
Library  SeleniumLibrary
Resource  ./Page_Objects/Landing_Page.robot
Resource  ./Page_Objects/Product_Page.robot
Resource  ./Page_Objects/CheckOut_Page.robot

*** Keywords ***

Search for product
    [Arguments]  ${Product_Name}
    Landing_Page.Verify page loaded
    Landing_Page.Insert product into search bar  ${Product_Name}

Results for searched product is displayed
    Product_Page.Verify page loaded  Botanics

User can select the sub category
    Product_Page.Select sub-category from product page
    Product_Page.Verify page loaded  organic

User can add the selected item to cart
    Sleep  2s
    Product_Page.Product added to Cart

User can click on proceed checkout button
    Product_Page.Proceed to checkout


Verify that item is added in cart
    Product_Page.Item should be added to cart


User can add more item to cart
    CheckOut_Page.More items added to cart

User can remove item from cart
    CheckOut_Page.Item removed from cart

User can remove last item from cart
    CheckOut_Page.Last item removed from cart
    CheckOut_Page.User gets empty cart confirmation
    CheckOut_Page.Select Yes

User gets empty cart confirmation
     CheckOut_Page.User gets empty cart confirmation

User selects Yes
     CheckOut_Page.Select Yes

User selects No
     CheckOut_Page.Select No

User clicks on Checkout button
     CheckOut_Page.Select Checkout button

User must loggin to proceed
     CheckOut_Page.Login to proceed

User enters the email id
    Landing_Page.Enter the email id

User enters the password and selects Log In
     Landing_Page.Enter the password and Log In