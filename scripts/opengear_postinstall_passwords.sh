#!/bin/bash

# Users Password Setup
# openssl passwd -1
config -s config.users.user1.password='$1$yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'  # user1 is root
config -s config.users.user2.password='$1$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'  # user2 is your NonAdminUser

# Apply the change to users
config -r users
