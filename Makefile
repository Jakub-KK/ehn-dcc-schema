AJV=	./node_modules/.bin/ajv -c ajv-formats


test:: compile validate-examples check-formatting

compile::
	@echo "Compiling schemata..."
	-$(AJV) compile -r "DGC.*.schema.json" -s "DGC.schema.json"

check-formatting::
	@echo "Checking JSON formatting..."
	@for file in DGC.*.json example-*.json; do \
		jq . <$$file >$$file.tmp; \
		if ! cmp $$file $$file.tmp; then \
			echo "Please reformat $$file"; \
		fi; \
		rm $$file.tmp; \
	done

validate-examples::
	-$(AJV) validate -r "DGC.*.schema.json" -s "DGC.schema.json" -d "example-*.json"


reformat::
	for file in *.json; do jq . <$$file >$$file.tmp && mv $$file.tmp $$file; done

install-ajv:
	npm install ajv ajv-cli ajv-formats