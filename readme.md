# Example Project setup using Docker and pipenv
This provides the starting point for setting up a docker file with a  
pipenv environment

## Starting development container in VS Code
- Open folder
- Build the contain and open as development containe 

    ```(Strg+Shift+P): >Remote-Containers: Open Folder in Container```


## Update dependencies
- To add packages update Pipfile and then run:     
    ```pipenv install --dev```


## Build the docker image
```$ docker build . --tag dockerproject:1.0```

### Run image without mount 
```$ docker run -d -it --name devtest dockerproject:1.0```

### Run image with a mount point
```$ docker run -d -it --name devtest -v E:\Uni\Research\DockerProjectTest\fileExchange\:/workspaces/DockerProjectTest  dockerproject:1.0```

### Stop docker image
```$ docker container stop devtest```

### Remove docker image
```$ docker container rm devtest```

## Call a script from inside the running container
docker exec devtest /bin/sh -c "/.venvs/-x-v5uFv0/bin/python ./test_python.py"