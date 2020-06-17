build:
	go build -o tags
	mv tags /usr/local/bin

clean:
	rm /usr/local/bin/tags
