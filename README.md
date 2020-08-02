# Pandoc RSS

This is a simple script that can be used to generate an RSS feed from
the content and metadata of markup files.

It is implemented in POSIX shell, though GNU date(1) is needed to
transform date metadata to conform with [RSS Best Practices section
3.2](https://www.rssboard.org/rss-profile#data-types-datetime).

**Note:** This is alpha software and there may be breaking changes.

## Usage

See pandoc-rss(1).

## Bugs and notes

  - Not tested with filenames that have spaces or other characters
    considered special in URLs.

## To-do

  - [x] Add options for specifying channel title, link and description
  - [x] Add Makefile rule to install the man page
  - [x] Cite pandoc-rss as the generator element
  - [x] Produce a standalone feed if and only if at least the channel
    title, description and link are provided.
  - [ ] Add option to specify the channel language
  - [ ] With no input-file, read file names line-by-line from stdin
  - [ ] Finish writing the man page
  - [ ] Infer the guid/permalink format based on the channel link; for
    example if the channel link is `http://example.net` then the
    format is `http://example.net/%s.html`.
  - [ ] Print warnings about relative links in the description element
    (this is non-trivial)
