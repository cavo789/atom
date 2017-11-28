# Atom's configuration files

> My atom's configuration files

Because it takes hours to write them :wink: :gift:

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [License](#license)

## Install

Copy the desired file to your `%USERPROFILE%\.atom` folder; overwrite (or append) your current existing file (f.i. `init.coffee`) file by this one.

## Usage

### init.coffee

* When a file will be saved
	* For all text files
		* Autoindent the editor's content (only for somes "grammar" like "text.html.php" (whitelist concept))
		* Remove trailing whitespace and tab (i.e. at the end of the line)
		* If a line only contains tabs or spaces and nothing else, remove
these unneeded characters
		* Replace spaces blocks (min 3 max 4 consecutive spaces) by tab
		* If there are more than one consecutive empty lines, just keep one
	* Only for VBS
		* Replace some keywords, solve typo issue (f.i. replace `WScript.Echo`
by `wScript.echo` so files will be a few normalized)

### snippets.cson

List of snippets (i.e. abbreviations) that I use when I'm coding in PHP, markdown, vbs, ...

### styles.less

My own stylesheet for atom. Most probably useless for you.

## Contribute

PRs not accepted.

## License

[MIT](LICENSE)