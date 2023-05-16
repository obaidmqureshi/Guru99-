*** Settings ***
Library                 Selenium2Library
Library                 FakerLibrary
Library                 Guru99locators.py
Variables               ../MyTestCases/G99homelocators.py
Variables               ../MyTestCases/G99Registration.py
Variables               ../MyTestCases/FakerRegistration.py

*** Variables ***
${URL}                  https://demo.guru99.com/test/newtours/
${browser}              chrome
${home_page_title}      Welcome: Mercury Tours
${Flights_page_title}   Find a Flight: Mercury Tours:

*** Test Cases ***
TC1: Open website and verify the URL and page title
    open browser    ${URL}      ${BROWSER}
    sleep               4
    log to console      Successfully opened the website!!!
    maximize browser window
    title should be         ${home_page_title}
    log title
TC2: List the differnt entities and links on the home page
    ${Get_home_page_element_count}=      get element count      xpath://a
    log to console      ${Get_home_page_element_count}

TC3:Verifying home page Vertical Menu links
    page should contain link        ${Home_link}
    page should contain link        ${Flight_link}
    page should contain link        ${Hotel_Link}
    page should contain link        ${Car_Rentals_link}
    page should contain link        ${Cruises_link}
    page should contain link        ${Destinations_link}
    page should contain link        ${Vacations_link}
    sleep                           3

TC4: Verifying Horizontal menu links
    page should contain link        ${SIGN_ON_link}
    page should contain link        ${REGISTER_link}
    page should contain link        ${SUPPORT_link}
    page should contain link        ${CONTACT_link}
    Sleep                           3
TC5: Verifying Username and password field and button default status\
    page should contain element     ${User_name_field}
    page should contain element     ${password_field}
    page should contain button      ${Submit_button}
TC6:Verify all the links are enabled by default
    ${Get_home_page_element_count}=      get element count      xpath://a
    log to console      ${Get_home_page_element_count}
    @{LinkItems}            create list
        FOR     ${i}            IN RANGE    1       ${Get_home_page_element_count}
             ${LinkText} =    GET TEXT        xpath:(//a)[${i}]
             log to console      ${LinkText}
        END

TC7: Opening Registration page
    click link      ${REGISTER_link}
    sleep           3
    ${Register_page_title}=     get title
    log to console      ${Register_page_title}
    title should be     Register: Mercury Tours
    sleep               3
TC8: Verify Registration page elements
    page should contain textfield  ${First_name_text_box}
    page should contain textfield  ${Last_name_text_box}
    page should contain textfield  ${Phone_no_text_box}
    page should contain textfield  ${Email_id_text_box}
    page should contain textfield  ${Address_text_box}
    page should contain textfield  ${City_text_box}
    page should contain textfield  ${State_province_text_box}
    PAGE SHOULD CONTAIN TEXTFIELD  ${Postal_code_text_box}
    page should contain element    ${Country_drop_down_box}
    page should contain textfield  ${User_Name_text_box}
    page should contain textfield  ${Password_text_box}
    page should contain textfield  ${Confirm_pwd_text_box}
    #page should contain button     ${Submit_button}

TC9: Registrating to the site using faker directory
    ${First_name}       FakerLibrary.Firstname
    input text      ${First_name_text_box}      ${First_name}

    ${Last_name}           FakerLibrary.lastname
    input text      ${Last_name_text_box}      ${Last_name}

     ${email_name}         FakerLibrary.email
    input text      ${Email_id_text_box}      ${email_name}
    sleep           4

    input text      ${Phone_no_text_box}        "9999900000"

    ${Adress_details}     FakerLibrary.Address
    input text          ${Address_text_box}     ${Adress_details}

   # ${City_detail}         FakerLibrary.city
   # input text          ${City_text_box}     ${City_detail}
  #  input text          ${City_text_box}        "HEMMINGTON"
  #  sleep               4
   # log to console

    #${State}               FakerLibrary.State
  #  input text          ${State_province_text_box}     ${State}

    # ${Postal_code}        FakerLibrary.Postcode
   # input text          ${Postal_code_text_box}     ${Postal_code}

    sleep               4
TC10:




*** Keywords ***



