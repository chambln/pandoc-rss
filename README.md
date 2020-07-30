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

  - [ ] Write a man page

  - [x] For each item element, include the rendered HTML as the content
    of the description element. Use either CDATA encoding or escape
    `<` and `>` using HTML character entities `&lt;` and `&gt;`.

    - [x] It is the author's opinion that this should be default
      behaviour, but let's include an option not to do this
      since the spec considers this "a decision entirely at
      the discretion of the publisher" ([RSS Best Practices Profile
      4.1.1.20.4](https://www.rssboard.org/rss-profile#element-channel-item-description)).
      Alternatives are:
      
      - Use the `description` metadata variable as the description element
      - Use the `subtitle` metadata variable as the description element
      - Use the `abstract` metadata variable as the description element
      - Omit the description element altogether, making the title
        element required

      See [Metadata
      variables](https://pandoc.org/MANUAL.html#metadata-variables).

  - [ ] Print warnings about relative links in the description
    element.
