from suds.client import Client
import ssl
import sys
import argparse
import logging
import os


LOGGER = logging.getLogger(__name__)

# This tells the SSL runtime to trust the provided certificate without credentials
_create_unverified_https_context = ssl._create_unverified_context

logging.basicConfig(filename="./esec-delete.log", level=logging.DEBUG)

# TODO: Ensure the domain name is in the /windows/system32/drivers/etc/hosts file
#url = 'https://TST-ESEC-H204.tst.esec.net:8443/routerProject/services/DocumentServices?wsdl'

url = os.getenv('ESEC_URL')
adminUrl = os.getenv('ESEC_ADMIN_URL')
userServicesUrl = os.getenv('USER_SERVICE_URL')

client = Client(url)
adminClient = Client(adminUrl)
userClient = Client(userServicesUrl)

doTheDelete = False
ORGANISATION_ID = "TESTUT2 [36812]"

print("client initialised")

requestId = os.getenv('REQUEST_ID')


def process_input_options():
    parser = argparse.ArgumentParser(prog='esec_delete_users',
                                     description='Detele users in esecurity.')
    parser.add_argument('confirm_delete', default='.', metavar='False',
                        help='Set to "True" to do the delete ')
    parser.add_argument('organisation_name', metavar='organisation_name',
                        help='name of the LDAP organisation e.g Digital Mortgage, TESTUT2 [36812]')
    settings = parser.parse_args()
    return settings


def run_delete():
    LOGGER.info("ESEC delete init")
    settings = process_input_options()
    LOGGER.info("Settings from command line: %s" % str(settings))
    ORGANISATION_ID = settings.organisation_name

    #old account = LR Administrators
    res = adminClient.service.searchForUser(requestId, "*", "GB", ORGANISATION_ID, "Users")

    for user in res:
        user_name = user["userId"]
        #print("User Name: %s %s %s - status: %s" % (user_name, user["commonName"], user["surname"], user["accountStatus"]))

        if user_name[0:3] == "dm-":

            if user["accountStatus"] == "Active":
                print("Deleting user: %s" % user["userId"])
                try:
                    if settings.confirm_delete == "True":
                        res = adminClient.service.removeUser(requestId, user["userId"])
                        print("Remove user: %s - %s " % (user["userId"],str(res)))
                    else:
                        print("Remove user(TEST- NOT DELETED): %s - %s " % (user["userId"],0))
                except:
                    msg = str(sys.exc_info())
                    print(msg)
                    print("Error: Removing user: %s" % (user["userId"]))


if __name__ == "__main__":
    run_delete()