# Generate PDFs from the Markdown source files
#
# In order to use this makefile, you need some tools:
# - GNU make
# - Pandoc
# - LuaLaTeX
# - DejaVu Sans fonts

# Directory containing source (Markdown) files
source := ./test

# Directory containing pdf files
output := ./output

# All markdown files in src/ are considered sources
sources := $(sort $(wildcard $(source)/*.md))

all: $(output)/output.pdf $(output)/output.epub

# Recipe for converting a Markdown file into PDF using Pandoc
$(output)/%.pdf:
	mkdir -p $(@D)
	pandoc \
		--variable fontsize=11pt \
		--variable geometry:"top=1.5cm, bottom=2.5cm, left=1.5cm, right=1.5cm" \
		--variable geometry:a4paper \
		--table-of-contents \
		--pdf-engine=xelatex \
		-f markdown  $(sources) \
		-o $@

$(output)/%.epub:
	mkdir -p $(@D)
	pandoc \
		--table-of-contents \
		-f markdown  $(sources) \
		-o $@

.PHONY : clean

clean:
	rm -f $(output)/*.pdf
