################################################################################
#                                                                              #
#                       This is the test for the helpers                       #
#                                                                              #
#                    @author Jack <jack@thinkingcloud.info>                    #
#                                 @version 1.0                                 #
#                          @date 2021-05-31 15:52:13                           #
#                                                                              #
################################################################################

from lib.helpers import *

def test_load_class():
    clz = load_class('lib.plugins.env.EnvironmentPlugin')
    assert clz, 'Class lib.plugins.env.EnvironmentPlugin not loaded'
