import logging
import os

log = logging.getLogger(__name__)

def test():
  ''' Module Exitence Test '''
  log.info( 'go.test exists' )
  return True

def big():
  ''' Running High State '''
  __salt__['state.highstate'](test=False)

__outputter__ = {
  'test': 'txt',
  'update': 'txt'
  }