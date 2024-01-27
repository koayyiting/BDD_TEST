*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:8080
${Broswer}    Chrome
${ValidAdminUserName}    Admin1
${ValidAdminPwd}    Admin123    
${Login_Button}    id=login-button
${username_textbox}    id=username-textbox
${pwd_textbox}    id=pwd-textbox

*** Test Cases ***
Administrator Login with valid Credentials

    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    Page Should Contain    Hi Administrator

*** Keywords ***
Login
    [Arguments]    ${Username}    ${Password}
    Open Browser    ${URL}    ${Broswer}
    Click Button    ${Login_Button}
    ${login_form_visible}=    Run Keyword And Return    Element Should Be Visible    id=login-form
    Should Be True    ${login_form_visible}
    Input Text    ${username_textbox}    ${Username}
    Input Password    ${pwd_textbox}    ${Password}
    Click Button    ${Login_Button}    #This is might be different from the previous button, change accordingly
