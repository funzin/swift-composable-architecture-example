MINT_PATH=".mint/lib"
MINT_LINK_PATH=".mint/bin"
MINT=MINT_LINK_PATH=$(MINT_LINK_PATH) MINT_PATH=$(MINT_PATH) mint

.PHONY: setup
setup:
	@make mint_bootstrap
	@make xcodegen

.PHONY: mint_bootstrap
mint_bootstrap:
	 $(MINT) bootstrap --link

.PHONY: xcodegen
xcodegen:
	 $(MINT) run xcodegen

.PHONY: swiftgen
swiftgen:
	$(MINT) run swiftgen

.PHONY: mockolo
mockolo:
	$(MINT) run mockolo -i GithubApp -s ./Target/GitHubApp/GitHubApp -d ./Target/GitHubApp/GitHubAppTests/Source/Mock/OutputMocks.swift

.PHONY: xcodegen_dump
xcodegen_dump:
	$(MINT) run xcodegen dump --type graphviz 
