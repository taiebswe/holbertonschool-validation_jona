HUGO=hugo
CLEAN=rm -rf

build:
	$(HUGO)

post:
	$(CLEAN) ./content/posts/$(POST_NAME).md 
	$(HUGO) new posts/$(POST_NAME).md
	sed -i 's/My First Post/${POST_TITLE}/g' ./content/posts/$(POST_NAME).md

clean:
	$(CLEAN) ./dist/
