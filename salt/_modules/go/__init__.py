import logging
import os

__version__ = '0.0.1'

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
