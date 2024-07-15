## notes

to ignore env in your local, please run this command right after cloning/pull

```
git update-index --assume-unchanged appsettings.Development.json
git update-index --assume-unchanged appsettings.json
```

## build images

docker build -t bergeract-be:latest .

## run container with volume and env

docker run -d -v bergeract-be-volume:/publish/Assets \
-e db_connection_string="" \
-e db_data_source="" \
-e db_user_id="" \
-e db_password="#" \
-e ASPNETCORE_ENVIRONMENT=Development \
-p 5000:80 --name bergeract-be bergeract-be

## get all continer

docker ps -a

## stop container on the top

docker stop $(docker ps -q -n 1)

## remove container on the top

docker rm -f $(docker ps -q -n 1)

## make sure all continer deleted

docker ps -a