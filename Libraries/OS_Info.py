import platform
import os

def get_os_info():
    """
    this functions gives the OS details with the help os and platform inbuilt libraries
    :return:
    """
    os_info = platform.uname()
    return os_info

def get_os_sut():
    """
    this function gets current os name
    :return:
    """
    os_sut = get_os_info()[0].lower()
    print(os_sut)
    return os_sut



