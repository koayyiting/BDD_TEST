*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:8080    #this might have to change
${Broswer}    Chrome
${Login_form}    id=loginForm
${ValidAdminUserName}    Shaniah
${ValidAdminPwd}    adminpwd1    
${login_button}    id=login_button
${username_textbox}    id=login_username
${pwd_textbox}    id=login_password
${name_textbox}    id=name
${Capstone_title}    id=title
${Contact_Role}    id=role
${CreateBtn_MainPage}    id=create
${CreateForm_Text}    Create New Capstone Entry
@{Capstone_Entry}    Tan KK    Quantum Mechanics    Staff    4    KK Company    3    Tan BB    Write Here
&{Capstone_Dict}    name=Tan KK    title=Quantum Mechanics    role=Staff    NumOfStd=4    company=KK Company    year=3    POC=Tan BB    des=write here

*** Test Cases ***
Administrator Login with valid Credentials

    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    Page Should Contain    Admin Main Page


Creation of Capstone Record as Administrator
    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    Click Button    ${CreateBtn_MainPage}    #this clicks on the create button
    ${login_form_visible}=    Run Keyword And Return    Element Should Be Visible    id=capstone-form    #this might id might change
    Should Be True    ${login_form_visible}
    FOR    ${key}    ${value}    IN    &{Capstone_Dict.items()}
        Input Text    id=${key}    ${value}
        
    END
    Click Button    id=submit
    Handle Alert    ACCEPT
    Alert Should Be Present    successfully created
    


*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${Broswer}
    ${login_form_visible}=    Run Keyword And Return    Element Should Be Visible    id=login-form
    Should Be True    ${login_form_visible}
    Input Text    ${username_textbox}    ${username}
    Input Password    ${pwd_textbox}    ${password}
    Click Button    ${login_button}    