################################################################################
#                                                                              #
#                 This is the pip setup file for configurator                  #
#                                                                              #
#                    @author Jack <jack@thinkingcloud.info>                    #
#                                 @version 1.0                                 #
#                          @date 2021-05-31 17:54:15                           #
#                                                                              #
################################################################################

# -*- coding: utf-8 -*-
from setuptools import setup, find_packages

try:
    long_description = open("README.rst").read()
except IOError:
    long_description = ""

setup(
    name="configurator",
    version="0.0.1",
    description=
    "This is the package that will provides the configuration functions using liquid templates",
    license="MIT",
    author="Jack <jack@thinkingcloud.info>",
    packages=find_packages(),
    install_requires=[],
    long_description=long_description,
    classifiers=[
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.7",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
    ])
