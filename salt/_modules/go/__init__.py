import logging
import os

log = logging.getLogger(__name__)

def big():
  ''' Running High State '''
  __salt__['state.highstate'](test=False)

__outputter__ = {
  'update': 'txt'
  }