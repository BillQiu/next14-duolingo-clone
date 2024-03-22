#### Search with `<replace-me>` and replace the text before running

#!/bin/bash
set -e
# Build the application using sam build
sam build
# Deploy the application to AWS using sam deploy
sam deploy --stack-name next-lambda-ssr --capabilities CAPABILITY_IAM --resolve-s3 --parameter-overrides NextBucketName=<replace-me>  --profile <replace-me> --region us-west-2
# Copy the js, css and other static files to s3 bucket
aws s3 sync .aws-sam/build/NextFunction/static/ s3://next-lambda-ssr/_next/static/
