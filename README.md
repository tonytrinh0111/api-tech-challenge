# API Gateway Challenge

## Architecture

![Simple API with DynamoDB backend](https://docs.aws.amazon.com/apigateway/latest/developerguide/images/custom-auth-workflow.png)

## Pre-requisite
* make, docker & docker-compose
* AWS_PROFILE is configured

## Validate template
`make validate`

## Deploy & undeploy the stack
`make deploy`

`make undeploy`


## Testing
* Run `make get_url` to get the Invoke URL
* Use Postman collection at  "./test/API Tech Challenge.postman_collection.json"
    * replace url with the Invoke URL
    * make sure that an item is insert in `auth_token` DynamoDB table and use that item's value as auth token header

## To-Do list
- Convert to SAM
- Unit Test
