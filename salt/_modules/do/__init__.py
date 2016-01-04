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
  current_directory = os.getcwd()
  log.info(current_directory)
  log.info( __salt__['git.pull'](current_directory) )
  log.info( "Salt Config Updated" )

__outputter__ = {
  'update': 'txt'
  }