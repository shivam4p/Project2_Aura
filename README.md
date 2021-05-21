# Lead P1

## How to start

1. Clone.
`git clone https://github.com/12Apr21-Salesforce/p1_lead.git`

2. Checkout to `dev` branch.
`git checkout dev`

3. Authorize your playground org.

4. run `sfdx force:source:deploy -x manifest/package.xml`
You will get below errors:
![Error1](https://imgur.com/t5Dz1l5.png)

Change the username to point to an username that exists in the playground you are trying to deploy to. (your own system admin account username works)
- Workflows/Site_Manager__c workflow
- Workflows/Operations_Goal__c workflow
- Queues/Site_Manager_Queues.queue-meta
![SMQ](https://imgur.com/m8kC37u.png)
![NOG](https://imgur.com/ynWbOBW.png)
![PSD](https://imgur.com/HsIh3Ue.png)


Try running below command
 `sfdx force:source:deploy -x manifest/package.xml`

You will get below error:
```
The queue: Site_Manager_Queues has not been setup to support the object: Mining_Project_Id__c.  This must be configured in the setup UI Queues editor. (33:19)
```
![Error5](https://imgur.com/0tJxKPh.png)


Deploy in order:
1. Objects
![Objects](https://imgur.com/eD79TxB.png)
2. Queues
![Queues](https://imgur.com/6s6B9GC.png)
3. Everything else (right click on package.xml and click `SFDX: 
![Manifest](https://imgur.com/0tJxKPh.png)Deploy Source in Manifest to Org`)



## Below steps are only required on first time being pulled.

Because the files you just edited will differ for each of us, we will stop these from being tracked by git. 

Add the code block below to `.gitignore`
```
force-app/main/default/queues/Site_Manager_Queues.queue-meta.xml
force-app/main/default/workflows/Operations_Goal__c.workflow-meta.xml
force-app/main/default/workflows/Site_Manager__c.workflow-meta.xml
```

Copy and paste below git command in your terminal
```
git rm -r --cached force-app/main/default/queues/Site_Manager_Queues.queue-meta.xml force-app/main/default/workflows/Operations_Goal__c.workflow-meta.xml force-app/main/default/workflows/Site_Manager__c.workflow-meta.xml
```
`git rm -r --cached` command is necessary to delete the cached git files that will cause problem when trying to add an already tracked file to `.gitignore`

git status to make sure these appear as `deleted`
![finalgitstatus](https://imgur.com/FDVGqTF.png)

Finally, checkout to your own branch.
`git checkout -b [newbranch]`

Stage all changes,
`git add .`

Commit
`git commit -m 'your commit message'`