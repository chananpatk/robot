*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    CSVLibrary
Library    SeleniumLibrary
Variables    /Users/11474715/Library/CloudStorage/OneDrive-BankofAyudhyaPublicCompanyLimited/Documents/robot/data.yaml

*** Test Cases ***
Get csv testing
    ${CSV_FILE1}    set Variable    ${CURDIR}/test_data_robot_csv.csv
    ${CSV_FILE2}    set Variable    ${CURDIR}/information.csv
    ${DATA_CSV1}     Read Csv File To Associative    ${CSV_FILE1}
     ${DATA_CSV2}     Read Csv File To Associative    ${CSV_FILE2}
    #Log to console    ${DATA_CSV2}

    Open Browser Chrome    ${url}   ${browser}
    Maximize browser window
    Input Username    ${DATA_CSV1[0]['\ufeffusername']}
    Input Password    ${DATA_CSV1[0]['password']}
    Click Login
    Verify Text Products
    Click Add to Cart
    Verify Text Checkout Your Information
    Input Firstname    ${DATA_CSV2[0]['\ufefffirstname']}
    Input Lastname     ${DATA_CSV2[0]['lasttname']}
    Input Postalcode   ${DATA_CSV2[0]['Postalcode']}
    Click to Continue
    Verify Text Checkout Overview
    Click to Finish
    Verify Text THANK YOU FOR YOUR ORDER


*** Keywords ***
Open Browser Chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}  

Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}    
Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login
    Click Button    //*[@id="login-button"]

Verify Text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=10s 

Click Add to Cart 
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
    Sleep    2s

Verify Text Checkout Your Information
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Your Information")]    timeout=10s 
Input Firstname
    [Arguments]    ${firstname}
    Input Text    //*[@id="first-name"]    ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    //*[@id="last-name"]    ${lastname}

Input Postalcode
    [Arguments]    ${postalcode}
    Input Text    //*[@id="postal-code"]    ${postalcode}

Click to Continue
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input
    Sleep    2s

Verify Text Checkout Overview
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Overview")]    timeout=10s

Click to Finish
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Sleep    2s

Verify Text THANK YOU FOR YOUR ORDER
    Wait Until Element Is Visible    //*[@id="checkout_complete_container"]/h2    timeout=10s


     
