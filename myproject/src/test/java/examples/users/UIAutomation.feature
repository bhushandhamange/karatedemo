@uiAutomation
Feature: UI Automation - Book Appointment

Scenario: Login Scenario
    Given driver 'https://katalon-demo-cura.herokuapp.com/'
    * maximize()
    And click('#btn-make-appointment')
    And input('#txt-username', 'John Doe')
    And input('#txt-password', 'ThisIsNotAPassword')
    And click('#btn-login')
    * waitUntil("document.readyState == 'complete'")
    * screenshot()
    * def urldriver = driver.url
    * print urldriver
    Then click('#combo_facility > option:nth-child(2)')
    Then click('#chk_hospotal_readmission')
    Then click('#radio_program_medicaid')
    Then input('#txt_visit_date','12/06/2024')
    Then input('#txt_comment','Pain in eye')
    Then click('#btn-book-appointment')
    * waitUntil("document.readyState == 'complete'")
    And match text('#comment') == 'Pain in eye'
    * close()



