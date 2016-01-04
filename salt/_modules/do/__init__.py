import logging
import os

log = logging.getLogger(__name__)

def test():
  ''' Module Exitence Test '''
  log.info("Test Exists")

def update():
  ''' Update local Salt Code '''
  log.info("Updating Salt Config")
  current_directory = os.getcwd()
  log.info(current_directory)
  return __salt__['cmd.run']("cd " + current_directory + " && git pull")

__outputter__ = {
  'udpate': 'txt'
  }