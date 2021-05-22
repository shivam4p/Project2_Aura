# Lead P1

## Getting Started

1. Clone.
`git clone https://github.com/12Apr21-Salesforce/p1_lead.git`

2. Authorize your playground org.

3. run `sfdx force:source:deploy -x manifest/package.xml`
You will get below errors:
![Error1](https://imgur.com/t5Dz1l5.png)

4. Change the username to point to an username that exists in the playground you are trying to deploy to. (your own system admin account username works)
- Workflows/Site_Manager__c workflow
- Workflows/Operations_Goal__c workflow
- Queues/Site_Manager_Queues.queue-meta
![SMQ](https://imgur.com/m8kC37u.png)
![NOG](https://imgur.com/ynWbOBW.png)
![PSD](https://imgur.com/HsIh3Ue.png)


Deploy source in `manifest/package.xml` to Org
[![ok.png](https://i.postimg.cc/HsggfKSy/ok.png)](https://postimg.cc/c6X23DGx)
