# Welcome to `Fun with SFDX` !
The goal of this Project is build awesome Salesforce Apps and study new Salesforce tools and features. If you're interested and want to join us, please read the instructions below to work as one of us.

You can collaborate with us by different ways:
* Fork this repo and when finish your development create a PullRequest against `QA` branch
* Ask to join as direct collaborator in this repo
* Create a new issue
* Share this project

## Minimum Requirements to Develop in this project:
 * Use your own DevOrg with DevHub enabled
 * SFDX CLI installed and ready to use in your own DevOrg. All repo is in SFDX Source code
 * Git / Git Client
 * A Github account

 ## Development workflow
The following development workflow is similar to a real environment workflow. Why? Just because we want that all collaborators, with low or high experience, familiarize with this process.

### Branch hierarchy:
    master    :final versions and accepted apps
    QA        :testing environment. New feature PR here please
    feature/* :development branches for each feature

### How do I start?
If you want to collaborate from our repo:
1. Fork this repository to your user.
2. Clone your forked repository
```
    git clone https://github.com/YOUR-USERNAME/fun-with-sfdx
```
3. From `master` create a new feature/* branch
```
    git checkout master
    git pull origin master
    git checkout -b feature/awesome-lightning-component
```
4. Create your [Scratch Org](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs_create.htm) _(first check that you're already connected to your DevHub with sfdx-cli)_ 
5. Push source code to your Scratch Org
6. Start the development

Once finished you development create a Pull Request from your feature branch against `QA` branch. We will check the code and feature. Any issues or code reviews, push against your feature branch and we will see the new additions in the Pull Request.

The Pull Request will create a Scratch Org for `QA` purpose, where we will test the feature and if everything is ok, the Pull Request will be accepted and merged into `QA`.

This final accion will execute a CI process against a DevOrg and run all Tests classes with `QA` content. If success, we will take care to create a new Pull Request and merge the content in `master`, deploying everything in the final DevOrg (our Dev Hub).

You can check the pipeline process here:

INSERT IMAGE HERE