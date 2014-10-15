docker.bandersnatch
===================

docker container running on debian jessie for bandersnatch [https://pypi.python.org/pypi/bandersnatch]

data store
===========

example:

on the host, create /srv/pypi

.. code-block:: rst

    mkdir -p /srv/pypi

run the container:

.. code-block:: rst

docker run -d -v /srv/pypi:/srv/pypi --name pypi-mirror leftxs/bandersnatch
