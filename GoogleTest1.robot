*** Settings ***
Documentation   Segundo test
...             vamos a probar... Que La Fuerza nos Acompañe

Library    SeleniumLibrary
Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown
Default Tags    sanity
*** Test Cases ***
MyFirstTest
    [Documentation]     When visit the page it should show the text Hello World
    [Tags]    smoke
    Log    Hello World...
    Log    end
MySecondTest
    [Documentation]     When visit the page it should show the text Hello World
    [Tags]    example
    Log    I am inside 2nd test
    Set Tags    regression1
    Remove Tags    regression1
MyThirdTest
    [Documentation]     When visit the page it should show the text Hello World
    Log    I am inside 3rd test
    Log    end
MyFourthTest
    [Documentation]     When visit the page it should show the text Hello World
    Log    I am inside 4th test
    Log    end


# FirstSeleniumTest
    # Open Browser    https://google.com    chrome
    # Set Browser Implicit Wait    5
    # Input Text      name=q                Automation step by step
    # Press Keys    name=q    ENTER
    # # Click Button    name=btnK
    # Sleep    2
    # Close Browser
    # Log    Test Completed
# SampleLoginTest
    # [Documentation]    This is a sample login test
    # Open Browser      ${URL}    chrome
    # Set Browser Implicit Wait    5
    # LoginKW
    # Click Element     id=welcome
    # Click Element     link=Logout
    # Close Browser
    # Log               Test completed
    # Log               This test was executed by %{username} on %{os}

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LGOINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    [Documentation]     When visit the page it should show the text Hello World
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LGOINDATA}[password]
    Click Button      id=btnLogin