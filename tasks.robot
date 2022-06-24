*** Settings ***
Library     RPA.Browser.Selenium
Library     RPA.Excel.Files
Library     String


*** Variables ***
${row}      1


*** Tasks ***
Main Task2
    States Test Website 2
Main Task1
    States Test Website 1




*** Keywords ***
Test Contries Of Pa For Webiste 1
    [Arguments]    ${name}
    Creating Pa Excel File For Website 1    ${name}
    Sleep    5s
    Click Element When Visible    //ion-icon[@name="settings-sharp"]
    Click Element When Visible    //*[contains(text(),'Show county names')]/../span/span
    Click Element When Visible    //*[contains(text(),'Close')]
    Sleep    2s
    Sleep    2s
    ${count}=    Get Element Count    //*[@id="map"]/div[2]/div[4]/div
    Open Workbook    ${name}_Excel_website2.xlsx
    FOR    ${i}    IN RANGE    1    ${count}+1
        Mouse Over    //*[@id="map"]/div[2]/div[4]/div[${i}]
        ${country_map}=    Get Text    //*[@id="map"]/div[2]/div[4]/div[${i}]
        ${country_map}=    Convert To Lower Case    ${country_map}
        ${country_bar}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[1]/h3
        ${country_bar}=    Convert To Lower Case    ${country_bar}
        ${country_bar}=    Get Substring    ${country_bar}    5
        ${Participent1}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/h3
        ${Participent2}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/h3
        ${Participent1_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[1]/span
        ${Participent1_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[2]/span
        ${Participent2_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[1]/span
        ${Participent2_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[2]/span
        ${row}=    Evaluate    ${i}+1
        Set Worksheet Value    ${row}    1    ${country_map}
        Set Worksheet Value    ${row}    2    ${country_bar}
        Set Worksheet Value    ${row}    3    ${Participent1}
        Set Worksheet Value    ${row}    4    ${Participent2}
        Set Worksheet Value    ${row}    5    ${Participent1_total_Vote}
        Set Worksheet Value    ${row}    6    ${Participent1_total_VotePer}
        Set Worksheet Value    ${row}    7    ${Participent2_total_Vote}
        Set Worksheet Value    ${row}    8    ${Participent2_total_VotePer}
        IF    '${country_map}'=='${country_bar}'
            Set Worksheet Value    ${row}    9    PASS
        ELSE
            Set Worksheet Value    ${row}    9    FAIL
        END
        Save Workbook
        Set Log Level    info
    END

Creating Pa Excel File For Website 1
    [Arguments]    ${name}
    Set Log Level    debug
    Create Workbook    path=${name}_Excel_website2.xlsx
    Set Worksheet Value    1    1    Country Name on Map
    Set Worksheet Value    1    2    Country Name on Side bar
    Set Worksheet Value    1    3    Participent1
    Set Worksheet Value    1    4    Participent2
    Set Worksheet Value    1    5    Participent1 Votes
    Set Worksheet Value    1    6    Participent1 Percentage
    Set Worksheet Value    1    7    Participent2 Votes
    Save Workbook
    Set Log Level    info

Test Contries Of Pa For Website 2
    [Arguments]    ${name}
    Set Local Variable    ${row}    1
    Creating Pa Excel File For Webiste 2    ${name}
    Sleep    5s
    Click Element When Visible    //ion-icon[@name="settings-sharp"]
    Click Element When Visible    //*[contains(text(),'Show county names')]/../span/span
    Click Element When Visible    //*[contains(text(),'Close')]
    Sleep    2s
    ${count}=    Get Element Count    //*[@id="map"]/div[1]/div[4]/div
    IF    '${count}'== '0'
        Click Element When Visible    //ion-icon[@name="settings-sharp"]
        Click Element When Visible    //*[contains(text(),'Show county names')]/../span/span
        Click Element When Visible    //*[contains(text(),'Close')]
        Sleep    2s
        ${count}=    Get Element Count    //*[@id="map"]/div[1]/div[4]/div
    END
    Open Workbook    ${name}_Excel_website1.xlsx
    FOR    ${i}    IN RANGE    1    ${count}+1
        Mouse Over    //*[@id="map"]/div[1]/div[4]/div[${i}]
        ${country_map}=    Get Text    //*[@id="map"]/div[1]/div[4]/div[${i}]
        ${country_map}=    Convert To Lower Case    ${country_map}
        ${country_bar}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[1]/h3
        ${country_bar}=    Convert To Lower Case    ${country_bar}
        ${country_bar}=    Get Substring    ${country_bar}    5
        ${Participent1}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/h4
        ${Participent2}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/h4
        ${Participent1_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[1]/span
        ${Participent1_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[2]/span
        ${Participent2_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[1]/span
        ${Participent2_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[2]/span
        ${row}=    Evaluate    ${i}+1
        Set Worksheet Value    ${row}    1    ${country_map}
        Set Worksheet Value    ${row}    2    ${country_bar}
        Set Worksheet Value    ${row}    3    ${Participent1}
        Set Worksheet Value    ${row}    4    ${Participent2}
        Set Worksheet Value    ${row}    5    ${Participent1_total_Vote}
        Set Worksheet Value    ${row}    6    ${Participent1_total_VotePer}
        Set Worksheet Value    ${row}    7    ${Participent2_total_Vote}
        Set Worksheet Value    ${row}    8    ${Participent2_total_VotePer}
        IF    '${country_map}'=='${country_bar}'
            Set Worksheet Value    ${row}    9    PASS
        ELSE
            Set Worksheet Value    ${row}    9    FAIL
        END
        Save Workbook
        Set Log Level    info
    END

Creating Pa Excel File For Webiste 2
    [Arguments]    ${name}
    Set Log Level    debug
    Create Workbook    path=${name}_Excel_website1.xlsx
    Set Worksheet Value    1    1    Country Name on Map
    Set Worksheet Value    1    2    Country Name on Side bar
    Set Worksheet Value    1    3    Participent1
    Set Worksheet Value    1    4    Participent2
    Set Worksheet Value    1    5    Participent1 Votes
    Set Worksheet Value    1    6    Participent1 Percentage
    Set Worksheet Value    1    7    Participent2 Votes
    Set Worksheet Value    1    8    Participent2 Percentage
    Save Workbook
    Set Log Level    info

States Test Website 1
    Open Available Browser    url=https://eddy.truefair.news/President/General/2020/state/    maximized=True
    Sleep    3s
    Wait Until Element Is Visible    //*[@id="map"]/div[2]/div[4]/div    timeout=20s
    ${count}=    Get Element Count    //*[@id="map"]/div[2]/div[4]/div
    FOR    ${i}    IN RANGE    1    ${count}+1
        Wait Until Element Is Visible    //*[@id="map"]/div[2]/div[4]/div[${i}]    timeout=20s
        Mouse Over    //*[@id="map"]/div[2]/div[4]/div[${i}]
        ${Statename_map}=    Get Text    //*[@id="map"]/div[2]/div[4]/div[${i}]
        ${Statename_bar}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[1]/h3
        ${Statename_bar}=    Convert To Lower Case    ${Statename_bar}
        ${Participent1}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/h3
        ${Participent2}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/h3
        ${Participent1_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[1]/span
        ${Participent1_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[2]/span
        ${Participent2_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[1]/span
        ${Participent2_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[2]/span
        ${StateName}=    Get Text    //*[@id="map"]/div[2]/div[4]/div[${i}]
        Go To    https://eddy.truefair.news/President/General/2020/state/${StateName}
        Run Keyword And Return Status    Test Contries of PA for webiste 1    ${Statename_bar}
    END

States Test Website 2
    Open Available Browser    url=https://rewrite--eddyv3.netlify.app/    maximized=True
    Sleep    3s
    Wait Until Element Is Visible    //*[@id="map"]/div[1]/div[4]/div    timeout=20s
    ${count}=    Get Element Count    //*[@id="map"]/div[1]/div[4]/div
    FOR    ${i}    IN RANGE    1    ${count}+1
        Wait Until Element Is Visible    //*[@id="map"]/div[1]/div[4]/div[${i}]    timeout=20s
        Mouse Over    //*[@id="map"]/div[1]/div[4]/div[${i}]
        ${Statename_map}=    Get Text    //*[@id="map"]/div[1]/div[4]/div[${i}]
        ${Statename_bar}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[1]/h3
        ${Statename_bar}=    Convert To Lower Case    ${Statename_bar}
        ${Participent1}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/h4
        ${Participent2}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/h4
        ${Participent1_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[1]/span
        ${Participent1_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[2]/div/div[2]/span
        ${Participent2_total_Vote}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[1]/span
        ${Participent2_total_VotePer}=    Get Text    //*[@id="root"]/div/div[1]/div[2]/div[3]/div/div[2]/span
        ${StateName}=    Get Text    //*[@id="map"]/div[1]/div[4]/div[${i}]
        Go To    https://rewrite--eddyv3.netlify.app/?election=President&electionType=General&year=2020&display=state&state=${Statename_map}&county=&district=&primaryMode=
        Run Keyword And Return Status    Test Contries of PA for website 2    ${Statename_bar}
    END
