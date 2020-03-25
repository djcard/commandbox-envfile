# commandbox-envfile

This module is a wrapper for the propertyFile functionality built into CommandBox but exclusively on creating, modifying and displaying .env files. 

# Installation

box install commandbox-envfile

# Usage

envfile show - Accepts a folder and a filename and displays the contents in the CLI

envfile set - Accepts and name and a value and adds it to the local .env file. Alternately accepts a folder and filename to receive the addition. Gives the option to create the file if it does not exist which can be bypassed with the --force flag.

envfile get - Accepts a name and displays the value of it if it exists.

envfile PopulateFromExample - Accepts the name of a file (defaults to .env) and an example (defaults to .env.example) and then loops through the example and asks the user for a value for each item in the example which is then written to the target file. 
