oc new-app nginx~https://github.com/IbrahimmAdel/html --name=simple-html -n ahmedgomaa



oc get all --show-labels -n ahmedgomaa


oc delete all -l app=<application-name> -n ahmedgomaa
