# flutter_docker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.Created by telegrambot using PYTHON as programming langage and mongodb atlass as a database

Introduction :

This library provides a pure Python interface for the Telegram Bot API. It's compatible with Python versions 3.6+. PTB might also work on PyPy, though there have been a lot of issues before. Hence, PyPy is not officially supported.

In addition to the pure API implementation, this library features a number of high-level classes to make the development of bots easy and straightforward. These classes are contained in the telegram.ext submodule.

A pure API implementation without telegram.ext is available as the standalone package python-telegram-bot-raw. See here for details.

Note
Installing both python-telegram-bot and python-telegram-bot-raw in conjunction will result in undesired side-effects, so only install one of both.

Telegram API support:
All types and methods of the Telegram Bot API 5.2 are supported.

Installing
You can install or upgrade python-telegram-bot with:

$ pip install python-telegram-bot --upgrade
Or you can install from source with:

$ git clone https://github.com/python-telegram-bot/python-telegram-bot --recursive
$ cd python-telegram-bot
$ python setup.py install
In case you have a previously cloned local repository already, you should initialize the added urllib3 submodule before installing with:

$ git submodule update --init --recursive
Optional Dependencies
PTB can be installed with optional dependencies:

pip install python-telegram-bot[passport] installs the cryptography library. Use this, if you want to use Telegram Passport related functionality.
pip install python-telegram-bot[ujson] installs the ujson library. It will then be used for JSON de- & encoding, which can bring speed up compared to the standard json library.
pip install python-telegram-bot[socks] installs the PySocks library. Use this, if you want to work behind a Socks5 server.
Getting started
Our Wiki contains a lot of resources to get you started with python-telegram-bot:

Introduction to the API
Tutorial: Your first Bot
Other references:

Telegram API documentation
python-telegram-bot documentation
Learning by example
We believe that the best way to learn this package is by example. Here are some examples for you to review. Even if it is not your approach for learning, please take a look at echobot.py, it is the de facto base for most of the bots out there. Best of all, the code for these examples are released to the public domain, so you can start by grabbing the code and building on top of it.

Visit this page to discover the official examples or look at the examples on the wiki to see other bots the community has built.

Logging:
This library uses the logging module. To set up logging to standard output, put:

import logging
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
at the beginning of your script.

You can also use logs in your application by calling logging.getLogger() and setting the log level you want:

logger = logging.getLogger()
logger.setLevel(logging.INFO)
If you want DEBUG logs instead:

logger.setLevel(logging.DEBUG)
Documentation
python-telegram-bot's documentation lives at readthedocs.io.

Getting help:
You can get help in several ways:

We have a vibrant community of developers helping each other in our Telegram group. Join us!
In case you are unable to join our group due to Telegram restrictions, you can use our IRC channel.
Report bugs, request new features or ask questions by creating an issue or a discussion.
Our Wiki pages offer a growing amount of resources.
You can even ask for help on Stack Overflow using the python-telegram-bot tag.
Contributing
Contributions of all sizes are welcome. Please review our contribution guidelines to get started. You can also help by reporting bugs.

Donating
Occasionally we are asked if we accept donations to support the development. While we appreciate the thought, maintaining PTB is our hobby and we have almost no running costs for it. We therefore have nothing set up to accept donations. If you still want to donate, we kindly ask you to donate to another open source project/initiative of your choice instead.

License:
You may copy, distribute and modify the software provided that modifications are described and licensed for free under LGPL-3. Derivatives works (including modifications or anything statically linked to the library) can only be redistributed under LGPL-3, but applications that use the library don't have to be.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# FlutterTest
