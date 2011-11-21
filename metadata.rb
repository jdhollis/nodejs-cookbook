maintainer       "J.D. Hollis"
license          "Apache 2.0"
description      "Installs/Configures Node.js"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.5.2"
depends          "build-essential"

recipe           "nodejs", "Installs Node.js from source"
recipe           "nodejs::npm", "Installs npm - a package manager for node"