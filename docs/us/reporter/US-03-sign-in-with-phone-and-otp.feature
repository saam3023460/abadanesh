Feature: Sign In Using Phone Number and OTP
  As a registered user
  I want to sign in using my phone number and a one-time password (OTP)
  So that I can securely access my Abadanesh account without having to remember a password

  Background:
    Given I am on the sign-in page

  Scenario: Successfully sign in with a valid OTP
    Given I am a registered user
    When I enter my registered phone number
    And request an OTP
    And receive the OTP
    And enter the valid OTP
    Then the system shall authenticate me
    And grant me access to my account

  Scenario: Request OTP using an unregistered phone number
    When I enter a phone number that is not associated with an account
    And request an OTP
    Then the system shall inform me that no account is associated with the phone number
    And shall not authenticate me

  Scenario: Enter an incorrect OTP
    Given I have requested an OTP
    When I enter an incorrect OTP
    Then the system shall reject the authentication attempt
    And inform me that the OTP is invalid

  Scenario: Enter an expired OTP
    Given I have requested an OTP
    And the OTP has expired
    When I enter that OTP
    Then the system shall reject the authentication attempt
    And inform me that the OTP has expired

  Scenario: Request a new OTP
    Given I have requested an OTP
    When I request another OTP
    Then the system shall send a new OTP
    And invalidate the previously issued OTP

  Scenario: Request OTP using an invalid phone number
    When I enter an invalid phone number
    And request an OTP
    Then the system shall reject the request
    And inform me that the phone number is invalid

