include .env
export

RUNNER=docker-compose -f ./docker-compose.yml run --rm aws cloudformation

validate:
	$(RUNNER) validate-template --template-body file://cloudformation/cf-template.yaml

deploy:
	$(RUNNER) deploy --capabilities CAPABILITY_IAM --template-file ./cloudformation/cf-template.yaml --stack-name $(STACK_NAME) --parameter-overrides $(KEY_NAME)=$(KEY_VALUE)

