name: .Net CI/CD with github actions
on:
  push:
    branches:
      - master
  workflow_dispatch:
jobs:  
  deploy:
    runs-on: ubuntu:latest
    
    steps:      
      - name: Checkout
        uses: actions/checkout@v2
      
      - name: Build the Docker image
        run: docker build -t dotnetimage:latest .
      
      - name: Build a Docker Container with exiting image
        run: docker run -d -dotnetcontainer -p 80:80 dotnetimage:latest 
