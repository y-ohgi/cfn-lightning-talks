#!/bin/sh

BUCKET=ohgi-cfn

aws s3 sync ./stack s3://${BUCKET}/stack
aws s3 sync ./templates s3://${BUCKET}/templates

aws cloudformation update-stack \
    --stack-name hoge \
    --template-url https://s3-ap-northeast-1.amazonaws.com/ohgi-cfn/templates/securitygroups.yaml \
    --parameters file://parameters/securitygroups.json
#    --capabilities
