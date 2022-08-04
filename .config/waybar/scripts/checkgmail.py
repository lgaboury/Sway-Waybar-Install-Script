#!/usr/bin/env python

import imaplib,time
cnt = 0
obj = imaplib.IMAP4_SSL('imap.gmail.com','993')
obj.login('google username','password')
obj.select()
typ, data = obj.search(None,'UnSeen')
for num in data[0].split():
    cnt += 1
print (cnt)
obj.close()
obj.logout()
