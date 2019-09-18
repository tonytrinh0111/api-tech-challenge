RUNNER=docker-compose -f ./docker-compose.yml run --rm aws cloudformation
STACK_NAME=tech-challenge
KEY_NAME=MyName
KEY_VALUE=Tony
REGION=ap-southeast-2

validate:
	$(RUNNER) validate-template --region $(REGION) --template-body file://cloudformation/cf-template.yaml

deploy:
	$(RUNNER) deploy --capabilities CAPABILITY_IAM --template-file ./cloudformation/cf-template.yaml --stack-name $(STACK_NAME) --parameter-overrides $(KEY_NAME)=$(KEY_VALUE)

undeploy:
	$(RUNNER) delete-stack --stack-name $(STACK_NAME)

get_url:
	$(RUNNER) --region $(REGION) describe-stacks --stack-name $(STACK_NAME) --query "Stacks[0].Outputs[0].OutputValue"
