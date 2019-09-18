STACK_NAME=tech-challenge
KEY_NAME=MyName
KEY_VALUE=Tony
REGION=ap-southeast-2
RUNNER=docker-compose -f ./docker-compose.yml run --rm aws cloudformation --region $(REGION)

validate:
	$(RUNNER) validate-template  --template-body file://cloudformation/cf-template.yaml

deploy:
	$(RUNNER) deploy --capabilities CAPABILITY_IAM --template-file ./cloudformation/cf-template.yaml --stack-name $(STACK_NAME) --parameter-overrides $(KEY_NAME)=$(KEY_VALUE)

undeploy:
	$(RUNNER) delete-stack --stack-name $(STACK_NAME)

get_url:
	$(RUNNER) describe-stacks --stack-name $(STACK_NAME) --query "Stacks[0].Outputs[0].OutputValue"

