# Pandoc RSS

This is a shell script that uses pandoc(1) with an XML template to
generate a sequence of `<item>…</item>` elements from markup source
files. You can use it to create an RSS feed from a series of files that
Pandoc can read metadata from, such as ReST or Pandoc-flavoured
Markdown.

**Note:** This is alpha software and there may be breaking changes.

## Dependencies

  - POSIX sh
  - GNU coreutils date(1) — to interpret and reformat dates to conform with
    [RSS Best Practices 3.2 Dates and Times](https://www.rssboard.org/rss-profile#data-types-datetime)
  - pandoc(1)

## Usage

See pandoc-rss(1).

## Bugs and notes

  - Not tested with filenames that have spaces or other characters
    considered special in URLs.

## To-do

  - [x] Add options for specifying channel title, link and description
  - [ ] Finish writing the man page
  - [ ] Add Makefile rule to install the man page
  - [ ] Print warnings about relative links in the description element
  - [x] Cite pandoc-rss as the generator element
  - [ ] Add option to specify the channel language
  - [ ] With no input-file, read file names line-by-line from stdin
