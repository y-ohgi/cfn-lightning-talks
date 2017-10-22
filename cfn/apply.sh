#!/bin/sh


TARGET=$1
ACTION=$2
PREFIX=$3
BUCKET=ohgi-cfn

if [ "${PREFIX}" = "" ] ; then
    PREFIX=develop
fi


aws s3 sync ./templates s3://${BUCKET}/templates

aws cloudformation ${ACTION}-stack \
    --stack-name ${PREFIX}-${TARGET} \
    --template-url https://s3-ap-northeast-1.amazonaws.com/${BUCKET}/templates/${TARGET}.yaml \
    --parameters file://parameters/${TARGET}.json
#    --capabilities CAPABILITY_IAM
