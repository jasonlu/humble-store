humble-store
============
To run this project, you must have a Mac or Linux server with ```Ruby >= 2.0.0``` and ```Rails >= 4.0.0``` and ```MySql >= 5.5```
This instruction is based on Mac server, Linux instruction will be very similar to Mac version.
Is using Linux server, the most compatible distribtion is ```Ubuntu 12.04```

Instruction
============
1. Install Ruby and Homebrew by following the link below:
http://www.interworks.com/blogs/ckaukis/2013/03/05/installing-ruby-200-rvm-and-homebrew-mac-os-x-108-mountain-lion
2. Setup hosts file for proper domain handleing.
```bash
$ vim /etc/hosts
```
```vim
127.0.0.1 dev.local.me
127.0.0.1 admin.local.me
```
    
    This project uses subdomain to handle backstage access. A proper domain setup is required.
3. Install gems
During this step, you most likely will encounter few error, that would be cause of lacking required libraries, if error was raised, simply install missing library by using ```homebrew``` (In Linux server, use ```apt-get``` or ```yum install```)
Switch to the project folder.
```bash
$ bundle install
```

4. Setup DB
  * Generate a new MySql DB schema named: humble_store_dev
  * Generate an new user with username: ```user``` and password: ```password```
  * Grant all priviliges of schema: ```humble_store_dev``` to the user ```user```
  * Run shell commend at project folder.
```bash
$ rake db:migrate
```

5. Start app server
```bash
$ thin start
```

6. The site is up and running on port: 3000, access site by visiting http://dev.local.me:3000
Or visit http://admin.local.me:3000 for backstage site.

TODO
===========
* Backstage adminstrator authrization is not yet impletemented.
* Stastatic function not yet impletemented.
* User profile not yet impletemented.


Note
==========
* This project will not actually check the credit card information and make the charge.
* This project is only a POC (Proof of Concept) demo and has very limited functions.
* This instruction is only for development enviroment setup, not for porduction site.