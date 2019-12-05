*** Settings ***
Library  SeleniumLibrary



*** Keywords ***

Verify page loaded
     Wait Until Page Contains  shop by department

Insert product into search bar
    [Arguments]  ${Product_Name}
    Wait Until Element Is Visible  id=AlgoliaSearchInput  5
    Input Text   id=AlgoliaSearchInput  ${Product_Name}
    Click Element  id=algolia-search-button

