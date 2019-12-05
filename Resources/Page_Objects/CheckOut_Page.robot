*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***

More items added to cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    ${item_value_previous}  Get Value  id=qty_paid_1
    Click Element  id=plusId_1
    ${item_value_new}  Get Value  id=qty_paid_1
    run keyword if  ${item_value_new} == ${item_value_previous}+1  Log  ${item_value_new} item in cart
    ...  ELSE  Fail  Item not added in cart
    Sleep  3s

Item removed from cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    ${item_value_previous}  Get Value  id=qty_paid_1
    Log  ${item_value_previous}
    Click Element  id=minusId_1
    ${item_value_new}  Get Value  id=qty_paid_1
    log  ${item_value_new}
    run keyword if  ${item_value_new} == ${item_value_previous}-1  Log  ${item_value_new} item in cart
    ...  ELSE  Fail  Item cannnot be removed from cart as cart is empty

Last item removed from cart
    Wait Until Element Is Visible  id=qty_paid_1  5
    Click Element  id=minusId_1
    User gets empty cart confirmation
    User selects Yes

User gets empty cart confirmation
     Wait Until Element Is Visible  class=popup_overlay  5

Select Yes
     Wait Until Element Is Visible  id=basket_confirmation_button_yes  5
     Click Element   id=basket_confirmation_button_yes
     wait until element is visible  id=WC_ShopCartDisplay_div_6  5
     Wait until page contains  your basket is empty

Select No
     Wait Until Element Is Visible  id=basket_confirmation_button_no  5
     Click Element   id=basket_confirmation_button_no


Select Checkout button
    Click Element  id=basket_top_checkout
    Sleep  5s

Login to proceed
     Wait until page contains  Log in