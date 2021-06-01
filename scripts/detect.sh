#!/bin/bash
################################################################################
#                                                                              #
#                   This is the detect script for utilities                    #
#                                                                              #
#                    @author Jack <jack@thinkingcloud.info>                    #
#                                 @version 1.0                                 #
#                          @date 2021-05-31 13:54:49                           #
#                                                                              #
################################################################################

module=$*

case ${module} in
	python)
		echo `/usr/bin/env which python`
		;;
	pytest)
		echo `/usr/bin/env which pytest`
		;;
esac
