========================================================
Testing environment for FLL challenges using micropython
========================================================

About The Project
=================


This project releases a container containing the tools required to test FLL code unitary

.. image:: https://badgen.net/github/checks/nadegelemperiere/fll-test-docker
   :target: https://github.com/nadegelemperiere/fll-test-docker/actions/workflows/release.yml
   :alt: Status
.. image:: https://img.shields.io/static/v1?label=license&message=MIT&color=informational
   :target: ./LICENSE
   :alt: License
.. image:: https://badgen.net/github/commits/nadegelemperiere/fll-test-docker/main
   :target: https://github.com/nadegelemperiere/fll-test-docker
   :alt: Commits
.. image:: https://badgen.net/github/last-commit/nadegelemperiere/fll-test-docker/main
   :target: https://github.com/nadegelemperiere/fll-test-docker
   :alt: Last commit

Built With
----------

.. image:: https://img.shields.io/static/v1?label=python&message=3.11.0rc1&color=informational
   :target: https://www.python.org/
   :alt: Python

Packaged with
-------------

.. image:: https://img.shields.io/static/v1?label=Docker&message=20.10.23&color=informational
   :target: https://www.docker.com/
   :alt: Docker

Getting Started
===============

.. code:: bash

   docker image build -t nadegelemperiere/fll-test-docker .

You can also get it from the docker hub

.. code:: bash

   docker image pull nadegelemperiere/fll-test-docker

Then you can use it for example to a analyze python code quality with lint

.. code:: bash

   docker run  -it --rm \
            --volume $scriptpath/../:/package:rw \
            --workdir /package \
            fll-test-docker:latest \
            pylint --rcfile=/package/.pylintrc /package/module

Issues
======

.. image:: https://img.shields.io/github/issues/nadegelemperiere/fll-test-docker.svg
   :target: https://github.com/nadegelemperiere/fll-test-docker/issues
   :alt: Open issues
.. image:: https://img.shields.io/github/issues-closed/nadegelemperiere/fll-test-docker.svg
   :target: https://github.com/nadegelemperiere/fll-test-docker/issues
   :alt: Closed issues

Known limitations
=================

Roadmap
=======

Contributing
============

.. image:: https://contrib.rocks/image?repo=nadegelemperiere/fll-test-docker
   :alt: GitHub Contributors Image

License
=======

This code is under MIT license

Contact
=======

Nadege Lemperiere - nadege.lemperiere@gmail.com

Acknowledgments
===============
exi
[![Powered by the Spatial Math Toolbox](https://github.com/petercorke/spatialmath-python/raw/master/.github/svg/sm_powered.min.svg)](https://github.com/petercorke/spatialmath-python)