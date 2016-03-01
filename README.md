# Digital Mortgage Acceptance Tests

The following provides information on running and writing the acceptance tests for
the digital mortgage project.


## Running the Acceptance Tests

To run the acceptance tests, navigate into the *develop/dm-acceptance-tests* folder in
your VM and then execute the following command:

`./run_tests.sh`

If you wish to run just specific scenarios/user stories then you can amend the above
command by supplying the tag for the specific tests that you wish to run on the end
as in the following example:

`./run_tests.sh --tags @us5`

## Running Linting

You should always run the linting script as part of the development of acceptance
tests for a user story. Passing rubocop linting is part of the definition of done
and it should be run and any issues fixed before a story is signed off, to run the
linting script execute the following command in the *develop/dm-acceptance-tests*
folder of your VM:

`./run_linting.sh`

## Writing Scenarios

The file *features/business_process.feature* contains all of the happy paths/main
business flows through the system, if you have a scenario that adds to or amends
one of these flows then consider refactoring these scenarios rather than creating
a new scenario which exercises the same flow.

## Test Data

Creation of deed data to be used as part of acceptance tests is handled by the Deed
class in the file *features/data/deed.rb*. If you wish to create the data for a
deed then you simply need to create a new instance of the class:

`@deed = Deed.new(1)`

This will setup all of the data needed to create a deed through the API and will
create a number of borrowers equal to that passed through in the brackets, in this
instance one.

If you wish to amend any of the default data that was setup when you created the
deed as shown above, say if you want to test an error flow by setting up a deed
with missing or invalid data then you simply need to call that particular attribute
and assign it a new value:

`@deed.title_number = 'DN123456789'`

Once you have setup the deed data according to the specifications of the test then
you will need to convert it into a ruby hash so that it can be sent to the API as
part of the payload. Simply call the to_hash function of the Deed class:

`@deed_hash = @deed.to_hash

Finally if you wish to access the deed data used to create a deed via the API as
part of a test, say if you wanted to check that the title number is displayed on
a page then simply call the particular attribute for the deed you created:

`page.should have_content(@deed.title_number)`


## Calling steps from within steps  [AF 1/3/16]

In Cucumber it is possible to call an existing step, from inside a different step body.
These `helper steps` can be used to make feature files more readable, and to utilize
existing code.

example:
`Given(/^I setup a deed with <(\d+)> borrowers$/) do |borrower|
  # Creates a deed, with entered number of [borrowers].`
  step %(I have valid deed data with <#{borrower}> borrowers)
`end`

Inside this step, the `I have valid deed data with <#{borrower}> borrowers` step is
being called. It is using the parameter [borrower] being passed in by the parent step
i.e `I setup a deed with <(\d+)> borrowers` to execute.


## Amending a deed [AF 1/3/16]

`Sample Deed`
@borrowers=
  [{:forename=>"Jayne",
    :surname=>"Cobb",
    :gender=>"Female",
    :address=>"0B Borrower Street, Plymouth, PL3 2PP",
    :dob=>"01/03/2016",
    :phone_number=>"07063286046"}],
 @identity_checked="Y",
 @md_ref="e-MD12344",
 @property_address="1 High Street, High Wycombe, CR0 6TY",
 @title_number="Q87">

New generic steps have been created to amend any of the above variables.
The `testdebt_generic_test_data_step.feature` contains an example.

For example if we want to amend the first name for a borrower on a deed:
We can use:

Given I setup a deed with <1> borrowers
And I amend "forename" to "Timmy"
And I create the deed

OR

Given I setup a deed with <1> borrowers
And I amend "forename" to "Timmy" for borrower <1>
And I create the deed

Both are valid, because the step uses `Optional Values` see below.


## Optional Values

Cucumber supports the use of optional values, when writing steps.
In the above example cucumber is expecting to see `And I amend "forename" to "Timmy"`
but `for borrower <1>` is optional, so if it is present it knows how to process it, and
likewise, if it is not present it can also process.

This is occurs in the step name, by surrounding the optional value in (?:)?

E.g `/^I amend "([^"]*)" to "([^"]*)"(?: for borrower <(\d+)>)?$/`

Cucumber can understand this as
1. /^I amend `"([^"]*)" to "([^"]*)?$/`  or
2. /^I amend `"([^"]*)" to "([^"]*)" for borrower <(\d+)>)?$/`

Depending on what is used in the feature file.


## Default Values
`Example`
And(/^I retrieve the unique user id for borrower (?:<(\d+)>)?$/) do `|borrower|`

In ruby parameters can be assigned default values.
This can increase the robustness of code, be specifying a value, for the cases
when an expected parameter is not passed in.

Using the above example, we have the line:
  `borrower ||= 1`

This specifies the variable `borrower` is assigned the value of 1, UNLESS
a value is passed into the step as an argument.
