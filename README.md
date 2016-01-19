# Digital Mortgage Acceptance Tests

The following provides information on running and writing the acceptance tests for
the digital mortgage project.


## Running the Acceptance Tests

To run the acceptance tests, navigate into the develop/dm-acceptance-tests folder in
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
linting script execute the following command in the develop/dm-acceptance-tests
folder of your VM:

`./run_linting.sh`
