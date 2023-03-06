clean:
	find . -name "*.tfplan" -type f -delete
	find . -name "*.lock.hcl" -type f -delete
	find . -name "*.tfstate" -type f -delete
	find . -name "*.tfstate.backup" -type f -delete
	find . -name "*.terraform" -type d -exec rm -rf {} + 