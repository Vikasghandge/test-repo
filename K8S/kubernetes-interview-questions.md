#### Q1] HOW TO SOLVE THE AUTH AND PERMISSIONS LEVELS ISSUES IN K8S LIKE AUTH FAIL
- First Off All We Need To Check Proper Logs, and Events 
- role and permissions. if there is any missconfiguration of creds or maybe creds expired we have to check.

#### Q2] SUPPOSE YOU HAVE APPLICATION WHICH IS RUNNING ON K8S AND THAT APPLICATION NEED CREDS FROM AWS SECRET MANAGER.
- we first of all add your creds inti aws secret manager like username and password and name that secret like = my secrets.
- then create the policy for the aws secret manager copy arn form aws secret manager and paste it into json formate.
- the add that policy to the role and then after that create service account and bind that role to the service account.
- then attach that service account to the that required pods which we need the creds.

#### Q3] WHAT IF YOUR CREDS BY MISTEKEN PUSHED INTO THE PUBLIC REPO BY MISTEKEN DEVLOPER PUSHED INTO REPO WHAT STEPS WOULD YOU TAKE.
- first of all we need to remove that printed creds.
- the delete the creds that are exposed
- then replace with new creds.
- then and some filter and configure tools which will make sure creds should not be expose into the repo.
- and also remove everything from git history.

#### Q4] WHAT IF CPU LIMIT EXCEED AND THERE IS ISSUE ON CPU LEVEL HOW WOULD HOW RESOLVE IT.
- first for check regular commands
- kubectl logs <pod>
- kubectl describe pod <pod> | grep "ALLOCATED QUTTA" # CHECK RESOURCE QUTA
- kubectl get events
- if the you need cpu increase the limit of cpu if it is 500 m do it 800 m.

####

  
