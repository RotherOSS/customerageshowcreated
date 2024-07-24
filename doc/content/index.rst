.. image:: ../images/otobo-logo.png
   :align: center
|

.. toctree::
    :maxdepth: 2
    :caption: Contents

Sacrifice to Sphinx
===================

Description
===========
The package CustomerAgeShowCreated allows to switch between Age and Created date in customer ticket lists via system configuration.

System requirements
===================

Framework
---------
OTOBO 10.1.x

Packages
--------
\-

Third-party software
--------------------
\-

Usage
=====
When an age treshold value is configured in the system configuration setting TimeShowCreatedAt, no further action is required. Affected places in the customer frontend are all ticket overviews, the ticket search as well as the Elasticsearch quick result popup.

Setup
-----
The system configuration setting TimeShowCreatedAt can be set to one of three values (1 day, 2 days, 7 days). The value represents a treshold age. For example, if the value is set to 1 day and the age of a ticket is above 1 day, then the age is shown as absolute date instead of time period.

Configuration Reference
-----------------------

Core::Autoload
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

AutoloadPerlPackages###2000-CustomerAgeSwitch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Return formatted Create date instead of Age if configured treshold age is surpassed.

Core::Time
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TimeShowCreatedAt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Shows creation date instead of age if ticket is older than configured value (days).

About
=======

Contact
-------
| Rother OSS GmbH
| Email: hello@otobo.io
| Web: https://otobo.io

Version
-------
Author: |doc-vendor| / Version: |doc-version| / Date of release: |doc-datestamp|
