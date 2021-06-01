################################################################################
#                                                                              #
#    This is the module which provides the basic helpers for this project.     #
#                                                                              #
#                    @author Jack <jack@thinkingcloud.info>                    #
#                                 @version 1.0                                 #
#                          @date 2021-05-31 13:53:26                           #
#                                                                              #
################################################################################

from os import path
from benedict import benedict


def relative_path(p, file_name=None):
    """
    Get the absolute path of the file that relative to the first file
    """
    pp = path.abspath(path.dirname(p))
    if file_name:
        return path.join(pp, file_name)
    return pp


def load_class(name):
    names = name.split('.')
    mod = __import__('.'.join(names[:-1]))
    clz = names[1:]

    m = mod
    for p in clz:
        if hasattr(m, p):
            m = getattr(m, p)
        else:
            m = None
            break
    return m
