import logging
import os

log = logging.getLogger(__name__)

def test():
  ''' Module Exitence Test '''
  log.info("do.test exists")
  return True

def update():
  ''' Update local Salt Config '''
  log.info("Updating Salt Config")
  log.info( __salt__['git.pull'](__grains__['mac_salt_home']) )
  log.info( "Salt Config Updated" )

__outputter__ = {
  'update': 'txt'
  }