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
