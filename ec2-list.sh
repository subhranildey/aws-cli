#!/bin/bash

aws ec2 describe-instances --output text   --query 'Reservations[].Instances[].[Tags[?Key==`Name`] | [0].Value, PublicIpAddress]' | grep -v None | sort | awk -v 'OFS=\t' '{print $1,$2}'
