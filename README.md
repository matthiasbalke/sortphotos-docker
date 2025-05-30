# sortphotos-docker

A dockerized version of [andrewning/sortphotos][sortphotos-url] including all needed dependencies.

## bundled software

 * `python3=3.11.12-r1`
 * `py3-pip=23.1.2-r0`
 * `perl=5.36.2-r1`
 * `exiftool=12.60-r0`


## usage
```sh
docker run --rm -it sortphotos:local <sortphotos arguments here> 
```

## example
To sort all pictures form `/Users/Me/MessyDirectory` into `/Users/Me/Pictures`, mount source and target directory into container and run with desired `sortphotos` arguments.

```sh
docker run --rm -it sortphotos:local \
           --mount type=bind,src=/Users/Me/MessyDirectory,dst=/source \
           --mount type=bind,src=/Users/Me/Pictures,dst=/target \
           --recursive --test /source /target
```

## build locally
```sh
# build the container locally
./dev-build.sh
```

[sortphotos-url]: https://github.com/andrewning/sortphotos