NAME = skippy/awscli
VERSION = 1.8.1

all: build

build:
	docker build -t $(NAME):$(VERSION) .

test:
	docker run --rm $(NAME):$(VERSION) --version

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: test tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
