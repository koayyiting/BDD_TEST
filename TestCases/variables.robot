*** Variables ***
${URL}    https://devopsteamb2023.github.io/DevOps_Oct2023_TeamB_Development/account/signup_login.html    #this might have to change
${Broswer}    Chrome
${Login_form}    id=loginForm
${ValidAdminUserName}    Shaniah
${ValidAdminPwd}    adminpwd1    
${login_button}    id=login_button
${username_textbox}    id=login_username
${pwd_textbox}    id=login_password
${signup_username}    luke
${signup_password}    LUKEEE
${name_textbox}    id=name
${Capstone_title}    id=title
${Contact_Role}    id=role
${CreateBtn_MainPage}    id=create
${CreateForm_Text}    Create New Capstone Entry
@{Capstone_Entry}    Tan KK    Quantum Mechanics    Staff    4    KK Company    3    Tan BB    Write Here
&{Capstone_Dict}    name=Tan KK    title=Quantum Mechanics    role=Staff    NumOfStd=4    company=KK Company    year=3    POC=Tan BB    des=write here
