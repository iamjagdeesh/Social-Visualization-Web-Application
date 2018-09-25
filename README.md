# Social Visualization Web Application
## CSE 591 Adaptive Web
## Assignment 1: Social visualization with behavior logging.

## Description
It is a web application with login / logout / register functionality which tracks the activities of user on Stackoverflow website and generates visualization to discover patterns in the data collected.

1. Backend for this application was developed using Spring Boot which creates REST APIs.
2. Postgres is the database used to persist the data.
3. Frontend for this application was developed using React, a JavaScript library.
4. Visualization were created using Recharts library.

## Steps to run the application

### Postgres DB installing and setup
1. Install Postgres Database
2. Default user should and will be "postgres"
3. Create a database named "AdaptiveWeb" or Run file CreateAndConnectToDBScript.sql inside db-scripts folder to do that.
4. Run file TableCreationAndDataInsertScript.sql to create tables and insert data.

### Java environment for backend service
1. CD into the "userprofile" folder.
2. Run "mvn clean install" (Maven has to be installed)
3. Run "java -jar target/userprofile-0.0.1-SNAPSHOT.jar" and the backend server will be up and running on http://localhost:9090

### Front-end react application
1. Yarn has to be installed (https://yarnpkg.com/en/docs/install#windows-stable)
2. CD into the app folder.
3. Run "yarn install"
4. Run "yarn start" and now the front-end application will be running at http://localhost:3000/

### Chrome extension to track stackoverflow events
1. Go to chrome browser (More tools -> extensions)
2. Drag and drop the ext folder onto this page
3. Extension will be installed and allow the extension to run in developer mode

### Usage
1. Go ahead and hit the application at http://localhost:3000/
2. Users aaa, bbb, ccc are already created with password as "123".
3. New users can be registered from the registration page.
4. Wrong password or trying to register the existing the user will not make the application move to home page to display login history or visualizations.
