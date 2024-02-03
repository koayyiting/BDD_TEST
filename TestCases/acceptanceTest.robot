*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    Collections
Resource    variables.robot

*** Test Cases ***

Sign up
    Open Browser    ${URL}    ${Broswer}
    Wait Until Element Is Visible    id=loginForm
    Click Button    id=nav-signup-tab
    Wait Until Element Is Visible    id=signupForm
    Input Text    id=signup_username    ${signup_username}
    Input Password    id=signup_password    ${signup_password}
    Click Button    id=signup_button
    #Alert Should Be Present    Account request sent
    ${message}=    Handle Alert   
    Should Contain    ${message}    Account request sent
    [Teardown]    Close Browser
