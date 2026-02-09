#!/usr/bin/env python3

from samsungtvws import SamsungTVWS
tv = SamsungTVWS("192.168.178.25")  # No port needed for newer models
tv.shortcuts().power()
