# sortphotos-docker

A dockerized version of [andrewning/sortphotos][sortphotos-url] including all needed dependencies.

## Bundled Software

 * `python3=3.11.12-r1`
 * `py3-pip=23.1.2-r0`
 * `perl=5.36.2-r1`
 * `exiftool=12.60-r0`

## Usage
```sh
docker run --rm -it ghcr.io/matthiasbalke/sortphotos:0.2.0 <sortphotos arguments here>
```

To sort all pictures form `/Users/Me/MessyDirectory` into `/Users/Me/Pictures`, mount `/source` and `/target` directory into container and run with desired `sortphotos` arguments.

```sh
docker run --rm -it ghcr.io/matthiasbalke/sortphotos:0.2.0 \
           --mount type=bind,src=/Users/Me/MessyDirectory,dst=/source \
           --mount type=bind,src=/Users/Me/Pictures,dst=/target \
           --recursive --test /source /target
```

## Build Locally
```sh
# build the image locally (tag: matthiasbalke/sortphotos:local)
./dev-build.sh
```

## Releases

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## License

MIT License

Copyright (c) 2025 Matthias Balke

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[sortphotos-url]: https://github.com/andrewning/sortphotos
[semver]: http://semver.org/spec/v2.0.0.html
