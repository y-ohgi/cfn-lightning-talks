#!/bin/sh


TARGET=$1
ACTION=$2

BUCKET=ohgi-cfn
aws s3 sync ./stack s3://${BUCKET}/stack
aws s3 sync ./templates s3://${BUCKET}/templates

aws cloudformation ${ACTION}-stack \
    --stack-name hoge \
    --template-url https://s3-ap-northeast-1.amazonaws.com/${BUCKET}/templates/${TARGET}.yaml \
    --parameters file://parameters/securitygroups.json
#    --capabilities CAPABILITY_IAM
