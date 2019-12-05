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

Enter the email id
    Input Text  class=gigya-input-text  ashima.2189@gmail.com

Enter the password and Log In
    Input Text  class=gigya-input-password  Ashima@2189
    Click Element   class=gigya-input-submit
    Sleep  4s