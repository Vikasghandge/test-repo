git guidence -------

first of all you need to create your account on git.

make sure don't forget your git username and password.

now lets start creating git repository. 

create one reop give the name to repo ex[my_test-repo] and add readme file into that repo.

if your repo is public then no need to ssh or token but if your repo is private then you have to crate on token.
how to create token?

go into git setting scroll down to end you will get devlpoer setting then create one classic token.
and keep it private make sure,
now your repo ready to clone on your machine.

take ssh of your server then create one directory [viksa] cd vikas for public git-repo you need to run some commands.

cd /vikas
```
git init
```
```
git config --global user.name "vikasghandge"
```
```
git config --global user.email "your git password ********* "
```
to check run command git config --list ----> it will show list of config users
now you can use git  clone command.
```
git clone https://github.com/Vikasghandge/test-repo.git  #----> this commnad will clone your repo into your machine basically it will create one copy repo on your machine. 
<------  this is for public repository
```
```
git clone --mirror <repository-url>     ---> this command will clone repo with all branches
```
for private repository.
```
git clone https://<add here your token url > @github.com/Vikasghandge/test-repo.git   # ---> with help of this you #can access privte repository.
```

after successfully clone your repo into machine you can create files or directories and branhes.
lets create one file 

cd /vikas/my_test-repo     touch example.txt

git add (.) for all or exmaple.txt ----> git add command will add your file into staging area.

git commit -m " adding example.txt into remote repo"  #---> it will commit changes and create snapshor or backup
it will generate commit id [git log] <----- for git logs.

```
git push origin main     # ----> this command will push your file into remote repository finally.
```
```
git pull origin main    #----> this command will retrive data direct into your working area.
```
it is combination of git fetch and git merge changes into your working directory.
```
git fetch origin main ---->     #this command will retrive your data into local repo from remote repo.
```
suppose if you by mistaken deleted your file from local how to retrive.
```
git checkout -f  # ----> this command will retrive back your file.
```
suppose you have removed very important file from your local as well as from your remote repository then how would you retrive this file?
use command    git log  find out commit id where you had deleted that impo file and copy it.
```
git revert <your commit id>
```
it will retrive your file then you can push it again into your remote repository.
```
git branch          #----->    #it will show all branches
```
```
git branch <devops>   # <----- it will create new branch
```
```
git checkout -b <devops2>     ----> this will create new branch and switch that branch
```
```
git merge <branch name>           # ----> git merge it will merge two branche with togather.
```
```
git stash        #----> it will save temporary file in case if you dont want save this file now.
```
.gitignore ---> git will not track gitignore

| Feature               | git merge                                            | git rebase                                     |
|-----------------------|------------------------------------------------------|------------------------------------------------|
| **Purpose**           | Combines two branches, creating a new merge commit.  | Moves your branch to the tip of another branch by replaying commits. |
| **Commit History**    | Preserves the full history, showing all branch points. | Rewrites history to create a linear sequence of commits. |
| **Commit Structure**  | A merge commit is created, representing the join.    | No merge commit; commits are replayed on the new base. |
| **Use Case**          | When you want to preserve the original branch history. | When you want a clean, linear history for readability. |
| **Conflict Handling** | Conflicts resolved during the merge process.         | Conflicts need to be resolved for each commit during rebase. |
| **Command Example**   | `git merge feature-branch`                           | `git rebase main`                             |
| **Risk**              | Less risky since it doesn’t rewrite history.         | Risky if pushed branches are rebased, leading to divergence. |
| **When to Use**       | Use for collaborative work where history matters.    | Use for maintaining a clean commit history (e.g., before merging a feature branch). |


### diffrence between git pull and fetch

| Feature               | git fetch                                           | git pull                                        |
|-----------------------|-----------------------------------------------------|------------------------------------------------|
| **Purpose**           | Retrieves the latest changes from the remote without applying them to your working branch. | Retrieves the latest changes from the remote and merges them into your current branch. |
| **Working Directory** | Does not change the working directory or branch.   | Updates your working directory and branch with remote changes. |
| **Commit History**    | Only downloads remote commits; no merge or rebase occurs. | Downloads and merges (or rebases) changes into your local branch. |
| **Command Behavior**  | Safe to use; no changes to the current branch.      | Can cause conflicts if local changes diverge from remote. |
| **Command Example**   | `git fetch origin main`                             | `git pull origin main`                          |
| **Use Case**          | Use when you want to see changes before integrating them. | Use when you want to update your branch directly with remote changes. |
| **Risk**              | No risk to local changes.                           | Potential conflicts if local and remote changes differ. |
| **When to Use**       | Use to inspect or review changes before merging.    | Use to quickly sync with remote changes. |



