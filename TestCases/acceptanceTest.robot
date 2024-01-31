*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Test Cases ***
Administrator Login with valid Credentials

    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    #Page Should Contain    Admin Main Page
    [Teardown]    Close Browser


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
    
Delete User Account 
    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    Wait Until Element Is Visible    class=table
    ${delete_button}=    Get WebElements    xpath://button[contains(text(), 'delete')]
    ${delete_button}=    Set Variable    ${delete_button[-1]}
    Mouse Over    ${delete_button}
    Click Element    ${delete_button}
    ${message}=    Handle Alert
    Should Contain    ${message}    Are you sure you want to delete
    [Teardown]    Close Browser


 Modify User Account
    Login    ${ValidAdminUserName}    ${ValidAdminPwd}
    Wait Until Element Is Visible    class=table
    ${modify_button}=    Get WebElements    xpath://button[contains(text(), 'modify')]
    ${modify_button}=    Set Variable    ${modify_button[-1]}
    Mouse Over    ${modify_button}
    Click Element    ${modify_button}
    Page Should Contain    Update    #change to title should be
    Wait Until Element Is Visible    id=modifyForm
    Input Text    id=modify_username    modifiedUser
    Submit Form
    #give alert and check 
    [Teardown]    Close Browser

# Creation of Capstone Record as Administrator
#     Login    ${ValidAdminUserName}    ${ValidAdminPwd}
#     Click Button    ${CreateBtn_MainPage}    #this clicks on the create button
#     ${login_form_visible}=    Run Keyword And Return    Element Should Be Visible    id=capstone-form    #this might id might change
#     Should Be True    ${login_form_visible}
#     FOR    ${key}    ${value}    IN    &{Capstone_Dict.items()}
#         Input Text    id=${key}    ${value}
        
#     END
    #changes
#     Click Button    id=submit
#     Handle Alert    ACCEPT
#     Alert Should Be Present    successfully created
    




*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${Broswer}
    Maximize Browser Window
    Wait Until Element Is Visible    id=loginForm
    Input Text    ${username_textbox}    ${username}
    Click Button    ${login_button}   
    Wait Until Page Contains    User Details Page    #to wait for the page title to load
