import logging
import os

log = logging.getLogger(__name__)

def test():
  ''' Module Exitence Test '''
  log.info("do.test exists")
  return True

def help():
  ''' Output what needs to go into bash profile '''
  log.info("\nAdd the following to .bash_profile or .bashrc to source the MAC SALT bash configuration:\n\nif [ -f ~/.mac_salt/.bash_config ]; then \n\tsource ~/.mac_salt/.bash_config\nfi")

def update():
  ''' Update local Salt Config '''
  log.info("Updating Salt Config")
  log.info( __salt__['git.pull'](__grains__['mac_salt_home']) )
  log.info( "Salt Config Updated" )

__outputter__ = {
  'update': 'txt'
  }