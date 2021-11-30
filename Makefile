BUILD_DIR ?= .build
INFRASTRUCTURE_DIR ?= ../infrastructure
CONFIGURATION_FILE ?= ../configuration.tfvars
REPOSITORY ?= myrepository
AWS_BUCKET ?= mybucket
DATABRICKS_HOST ?= mydatabricks.com
DATABRICKS_TOKEN ?= mydatabrickstoken

_tearup:
ifneq ($(wildcard $(INFRASTRUCTURE_DIR)),)
	@echo 'The infrastructure folder was not find'
	@exit 127
endif
ifneq ($(wildcard $(CONFIGURATION_FILE)),)
	@echo 'The configuration file was not find'
	@exit 127
endif
ifneq ($(wildcard $(BUILD_DIR)),)
	@rm -rf $(BUILD_DIR)
endif
	@mkdir $(BUILD_DIR)
	@echo $(REPOSITORY)
	@terraform -chdir=$(BUILD_DIR) init --from-module=$(INFRASTRUCTURE_DIR) -backend-config="region=$${AWS_DEFAULT_REGION}" -backend-config="bucket=$(AWS_BUCKET)" -backend-config="key=$(REPOSITORY).tfstate"

deploy: _tearup
	@terraform -chdir=$(BUILD_DIR) plan --var-file=$(CONFIGURATION_FILE) -out plan-out
	@terraform -chdir=$(BUILD_DIR) apply plan-out

drop: _tearup
	@terraform -chdir=$(BUILD_DIR) destroy --var-file=$(CONFIGURATION_FILE) -auto-approve

