.PHONY: all html pdf docx markdown clean

all: dist/index.html dist/BrentRockwood-CV.pdf dist/BrentRockwood-CV.docx dist/BrentRockwood-CV.md dist/CNAME

dist:
	mkdir -p dist

dist/index.html: README.md template/html.pandoc | dist
	pandoc README.md \
		-o dist/index.html \
		--standalone \
		--template=template/html.pandoc \
		--variable pagetitle="Brent Rockwood - CV"

dist/BrentRockwood-CV.pdf: README.md | dist
	pandoc README.md \
		-o dist/BrentRockwood-CV.pdf \
		--pdf-engine=pdflatex \
		-V geometry:margin=1in \
		-V pagestyle=empty \
		-V fontsize=11pt \
		-V linkcolor=blue

dist/BrentRockwood-CV.docx: README.md | dist
	pandoc README.md \
		-o dist/BrentRockwood-CV.docx

dist/BrentRockwood-CV.md: README.md | dist
	cp README.md dist/BrentRockwood-CV.md

dist/CNAME: CNAME | dist
	cp CNAME dist/CNAME

html: dist/index.html
pdf: dist/BrentRockwood-CV.pdf
docx: dist/BrentRockwood-CV.docx
markdown: dist/BrentRockwood-CV.md

clean:
	rm -rf dist
