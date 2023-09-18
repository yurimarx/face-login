## Face Match
This is an application for face matching and facial login


## Installation ZPM
Open IRIS terminal in your IRIS with installed IPM. Run the command:

```objectscript
USER>zpm "install face-login"
```

## Installation docker

Clone/git pull the repo into any local directory

```bash
$ git clone https://github.com/yurimarx/face-login.git
```

Open the terminal in this directory and run:

```bash
$ docker-compose build
```

3. Run the IRIS container with your project:

```bash
$ docker-compose up -d
```

3. Open this URL in your browser: http://localhost:55038/facelogin/index.html 

4. Select the menu item Compare Faces
   
5. Choose 2 different images with the same person face and compare, wait some seconds for a result

6. Now, Choose 2 different images with different persons faces and compare, wait some seconds for a result
