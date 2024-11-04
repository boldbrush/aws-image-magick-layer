# Amazon Linux 2 ImageMagick Binaries (From Source)

This repository builds standalone ImageMagick binaries for Amazon Linux 2 that can be copy-pasted to any AWS Lambda function or EC2 instance.

**Blog post:** https://www.bytescale.com/blog/installing-imagemagick-on-amazon-linux-2/

**AWS Lambda Full Example:** https://github.com/bytescale/aws-lambda-image-magick-resize-example

## Quick Start

1. Run `make` to build for `arm64` Amazon Linux.
   - you also specify the platform, either `amd64` or `arm64` like so: `make PLATFORM=amd64`
   - check other make shortcuts in the `makefile`.

2. `./binaries/result` on your host machine now contains a portable set of ImageMagick binaries!
   - simply compress the whole `result` folder and upload it to AWS Layers
