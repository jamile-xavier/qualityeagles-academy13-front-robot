*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Realizar login
    [Documentation]    Keyword usada para realizar login
    [Arguments]    ${mail}    ${password}
    Input Text   id:email   ${mail}    
    Input Password   id:password    ${password}
    Click Button    class:css-1ucues4    
    Wait Until Element Is Visible    class:css-18le3pj
    Capture Element Screenshot    class:css-18le3pj

Realizar login sem sucesso
    [Documentation]    Keyword usada para testar o login com dados incorretos
    [Arguments]    ${mail}    ${password}
    Input Text    id:email   ${mail}    
    Input Password   id:password    ${password}
    Click Button    class:css-1ucues4    
    Wait Until Element Is Visible    class:MuiAlert-standardError
    Wait Until Element Contains    locator=class:MuiAlert-standardError    text=E
    Capture Page Screenshot    


