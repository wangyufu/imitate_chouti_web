#!/usr/bin/env python

class BaseReponse:
    def __init__(self):
        self.status = False
        self.data = None
        self.error = None
        self.no_login = None