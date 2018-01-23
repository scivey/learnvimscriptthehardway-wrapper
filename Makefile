
all: render

.PHONY: render

render:
	@./scripts/build-vimscript-html.zsh

serve: render
	@./scripts/serve.zsh -p 8000

