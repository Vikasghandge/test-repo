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

#### Q5] IF ACCIDENTALLY YOU PUSHED YOU DEV AND TEST ENV INTO THE PRODUCTION AN OVERWRITE YOUR PROD INFRA IN CASE WHAT STEPS WOULD TO TAKE THE SORT OUT THIS.
- acess the damage.
- check the terraform state which is changed using commnd: 'terraform state list' / 'terraform plan'
- step: 2)  check for the terraform make have created backup of your prod infra: 'ls -la terraform.tfstate.backup*'
- restore the previous version of tfstatefile from s3 buccket
- steps 3] manaually find out what are the changes happen and reomove unneccessary changes.
- steps use blue green deployment stratigy create seprate infra using previous statefile infra create it then switch the traffic to new infra delete old infra.
- step 4] precautions to prevent this kind of conflicts.
- 1) always keep backups of infra into remote location.
  2) use terraform workspace to avoid conflicts .
  3) and before applying the changes always add approval stage
  4) proper tag resources and name like prod or dev or test.

  
