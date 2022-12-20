#!/bin/bash

curl "http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true&alt=json" -H "Metadata-Flavor: Google" >> /tmp/metadata.json
gcutil cp -R /tmp/metadata.json gs://$Bucket_name/