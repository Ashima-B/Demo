*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${botanics_text}=  Botanics
${organic_text}=  organic
*** Keywords ***

Verify page loaded
    [Arguments]  ${name}
    Wait Until Page Contains  ${name}

Select sub-category from product page
    Click Element   id=SBN_organic_4_-1009_3074457345619273472


Product added to Cart
    Scroll Element Into View  id=productPageAdd2Cart
    wait until element is visible  id=productPageAdd2Cart
    Click Element  id=productPageAdd2Cart

Proceed to checkout
    Wait Until Element Is Visible  id=widget_minishopcart  5
    Sleep  2s
    Click Element  id=widget_minishopcart
    Click Element  id = GotoCartButton2

Item should be added to cart
    Wait Until Page Contains  your basket
    ${status}  Get Value  class= basket_quantity
    run keyword if  ${status} == 1  Log  1 item in cart
    ...  ELSE IF  Fail  item not in cart