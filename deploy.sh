#!/bin/bash
git clone https://github.com/shibir07/Product-Content-store-API.git
cd Product-Content-store-API
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null file.txt travistest@54.185.219.247:/tmp
