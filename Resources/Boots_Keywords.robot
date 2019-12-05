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
    Product_Page.
    Product_Page.Verify page loaded  organic

User can add the selected item to cart
    Sleep  2s
    Scroll Element Into View  id=productPageAdd2Cart
    wait until element is visible  id=productPageAdd2Cart
    Click Element  id=productPageAdd2Cart

User can click on proceed checkout button
    Wait Until Element Is Visible  id=widget_minishopcart  5
    Sleep  2s
    Click Element  id=widget_minishopcart
    Click Element  id = GotoCartButton2

Verify that item is added in cart
    Wait Until Page Contains  your basket
    ${status}  Get Value  class= basket_quantity
    run keyword if  ${status} == 1  Log  1 item in cart
    ...  ELSE IF  Fail  item not in cart

User can add more item to cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    ${item_value_previous}  Get Value  id=qty_paid_1
    Click Element  id=plusId_1
    ${item_value_new}  Get Value  id=qty_paid_1
    run keyword if  ${item_value_new} == ${item_value_previous}+1  Log  ${item_value_new} item in cart
    ...  ELSE  Fail  Item not added in cart
    Sleep  3s

User can remove item from cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    ${item_value_previous}  Get Value  id=qty_paid_1
    Log  ${item_value_previous}
    Click Element  id=minusId_1
    ${item_value_new}  Get Value  id=qty_paid_1
    log  ${item_value_new}
    run keyword if  ${item_value_new} == ${item_value_previous}-1  Log  ${item_value_new} item in cart
    ...  ELSE  Fail  Item cannnot be removed from cart as cart is empty

User can remove last item from cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    Click Element  id=minusId_1
    User gets empty cart confirmation
    User selects Yes

User gets empty cart confirmation
     Wait Until Element Is Visible  class=popup_overlay  5

User selects Yes
     Wait Until Element Is Visible  id=basket_confirmation_button_yes  5
     Click Element   id=basket_confirmation_button_yes
     wait until element is visible  id=WC_ShopCartDisplay_div_6  5
     Wait until page contains  your basket is empty

User selects No
     Wait Until Element Is Visible  id=basket_confirmation_button_no  5
     Click Element   id=basket_confirmation_button_no

User clicks on Checkout button
    Click Element  id=basket_top_checkout
    Sleep  5s

User must loggin to proceed
     Wait until page contains  Log in

User enters the email id
    Input Text  class=gigya-input-text  ashima.2189@gmail.com

User enters the password and selects Log In
    Input Text  class=gigya-input-password  Ashima@2189
    Click Element   class=gigya-input-submit
    Sleep  4s