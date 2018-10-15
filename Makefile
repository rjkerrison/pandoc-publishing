# Generate PDFs from the Markdown source files
#
# In order to use this makefile, you need some tools:
# - GNU make
# - Pandoc
# - Xelatex

# Directory containing source files
source := ./src

# Directory containing pdf files
output := ./output

# Source subdirectories are inputs
inputs := $(wildcard $(source)/*/)

pdf_outputs := $(patsubst $(source)/%/,$(output)/%.pdf,$(inputs))
epub_outputs := $(patsubst $(source)/%/,$(output)/%.epub,$(inputs))

$(output)/%.pdf : $(source)/%
	mkdir -p $(@D)
	pandoc \
		--variable fontsize=11pt \
		--variable geometry:"top=1.5cm, bottom=2.5cm, left=1.5cm, right=1.5cm" \
		--variable geometry:a4paper \
		--table-of-contents \
		--pdf-engine=xelatex \
		-f markdown $(sort $(wildcard $</*.md)) \
		-o $@

$(output)/%.epub : $(source)/%
	mkdir -p $(@D)
	pandoc \
		--table-of-contents \
		-f markdown $(sort $(wildcard $</*.md)) \
		-o $@

.PHONY : clean

all: $(pdf_outputs) $(epub_outputs)

clean:
	rm -f $(output)/*
