# Description

This is simple <code>package.json</code> generator tool. It helps me to start new projects without typo errors. This tool has templates, so it can automatically create all needed files for new projects. You can extend it with new templates.

# Install

    git clone https://github.com/javascriptiscoolpl/package-json-template.git

# Settings

### Defaults

Default settings are available in file (as bash variables):

    bash/build.bash

### Project types

To see supported project types run:

    ls templates

# Usage

### Build new project (auto mode)

To build all needed files using default settings run:

    npm run build

### Build new project (slower ask mode)

To build all needed files using slower ask mode run:

    npm run ask

### Clean all

To clean projects folder run:

    npm run clean

# License

MIT
