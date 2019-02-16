# Welcome to `Fun with SFDX` ! [![Production Build Status](https://travis-ci.org/Raspikabek/fun-with-sfdx.svg?branch=master)](https://travis-ci.org/Raspikabek/fun-with-sfdx)

The goal of this Project is build awesome Salesforce Apps and study new Salesforce tools and features. If you're interested and want to join us, please read the instructions below to work as one of us.

You can contribute with us by different ways:
* Fork this repo and when finish your development create a Pull Request against `QA` branch
* Ask to join as direct contributor in this repo
* Create a new issue
* Share this project

## Minimum Requirements to Develop in this project:
 * Use your own DevOrg (create one from [here](https://developer.salesforce.com/signup)) with [DevHub enabled](https://help.salesforce.com/articleView?id=sfdx_setup_enable_devhub.htm&type=0)
 * [SFDX CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm) installed and ready to use in your own DevOrg. All repo is in sfdx source code
 * Git + Optional Git Client (like [SourceTree](https://www.sourcetreeapp.com/), [GitKraken](https://www.gitkraken.com/invite/p1qno5xb) or [Github Desktop](https://desktop.github.com/))
 * A Github account

 ## Development workflow
The following development workflow is similar to a real environment workflow. Why? Just because we want everyone, with low or high experience, familiarize with this process.

### Branch hierarchy:
    master    :final versions and accepted apps
    QA        :testing environment. New feature PR here please
    feature/* :development branches for each feature

### How do I start?
If you want to contribute:
1. Fork this repository to your user (if you're not a contributor in the repo)
2. Clone the repo (forked or this one)
```
git clone https://github.com/YOUR-USERNAME/fun-with-sfdx
```
If you're a Contributor:
```
git clone https://github.com/Raspikabek/fun-with-sfdx
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

The Pull Request will run a RunAllTests against our `QA` org. If the build success we will check the feature and functionality in a Scratch Org. If you want to create a Scratch Org with the Pull Request code, run the `createTestScratchOrg.sh` script.

When everything is ok we will merge the PR and a CI Proccess will deploy everything against `QA`. If success, we will take care to create a new Pull Request and merge the content in `master`, deploying everything in the final DevOrg (our Dev Hub).