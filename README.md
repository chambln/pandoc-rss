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

General usage is

``` bash
pandoc-rss [OPTIONS] [FILE]...
```

In the metadata of each of your source markup files (i.e. YAML block
for markdown), make sure the value of the `date` variable is written
in a format that will be correctly interpretted by GNU date(1).

## Bugs and notes

  - Not tested with filenames that have spaces or other characters
    considered special in URLs.

## To-do

  - [x] Add options for specifying channel title, link and description.
  - [ ] Write a man page
  - [ ] Print warnings about relative links in the description element.
  - [ ] Cite pandoc-rss as the generator element