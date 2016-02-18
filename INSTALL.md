# angular-dev

This is an empty base project for angula1 1 applications. We use 
the package `generator-angular` for scaffolding the basic template. 
This package includes scaffolding, Karma, Jasmine, Grunt, Bower, Yeoman.

See http://www.toptal.com/angular-js/your-first-angularjs-app-part-2-scaffolding-building-and-testing
for a tutorial get get a simple project with unit test setup. Another tutorial 
from the Yeoman site can be found here: http://yeoman.io/codelab/index.html

## Getting started
First fulfil the minimal requirements, install node.js for your platform. For
debian this is (it can also be installed in userspace):

    sudo apt-get install nodejs npm

Make sure to run the latest npm version

    sudo npm update npm

Then get the minimal required node modules to get us started with the project:

    # create empty packages config if not exists
    #[ ! -f packages.json ] && echo '{}' > packages.json 
    npm init --yes
    # install basic packages
    npm install --save yo grunt-cli bower generator-angular

Install the unit testing module jasmine

    npm install karma-jasmine karma-chrome-launcher --save-dev
    
Create an empty project

    yo angular

Let's say no to Gulp, Compass and yes to Bootstrap. Then, when prompted about which modules to include (resource, cookies, sanitize and route), we'll select only angular-route.js.

Say 'a' to "Overwrite package.json".

Now go get you a coffee, this will take a couple of minutes.

Finally a test if the empty project works:

    grump serve

The project should open in chrome, if not point chrome to http://localhost:9000

Finally add some git ignore rules and commit the project to git.

    echo '*~' >> .gitignore
    git add `git ls-files --others --exclude-standard`
    git commit -am "Added empty project"
    git push


