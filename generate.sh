#!/bin/bash

ssh-keygen -t rsa -b 4096 -m pem -f terraform && mv terraform.pub modules/vm/terraform.pub && mv terraform terraform.pem && chmod 400 terraform.pem