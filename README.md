# Pandoc RSS

This is a shell script that uses pandoc(1) with an XML template to
generate a sequence of `<item>…</item>` elements from markup source
files. You can use it to create an RSS feed from a series of files that
Pandoc can read metadata from, such as ReST or Pandoc-flavoured
Markdown.

**Note:** This is alpha software and there may be breaking changes.

## Dependencies

  - POSIX sh
  - GNU coreutils date(1) — to interpret and reformat dates
    [correctly](https://www.rssboard.org/rss-profile#data-types-datetime)
  - pandoc(1)

## Usage

General usage is

``` bash
pandoc-rss -f FORMAT FILE [FILE ...]
```

where FORMAT is a printf(1) format string with which each file’s
basename is used to form its RSS item’s GUID and link.

At minimum, each file’s metadata should include `date`, `description`,
and `title`. Make sure the content of the `date` variable is written in
a format that will be correctly interpretted by GNU date(1), which
pandoc-rss uses to transform it into the standard RSS-compatible format.

## Example

Here’s one way to use this tool. Let’s say you have two Markdown files
and the top and bottom fragments of your RSS XML file:

    $ tree
    .
    ├── 1960-08-12-green-eggs-and-ham.md
    ├── 1965-06-19-fox-in-socks.md
    ├── rss-after.xml
    └── rss-before.xml

```xml
$ cat rss-before.xml
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
<title>Example feed</title>
<description>A simple example of an RSS feed.</description>
<language>en-GB</language>
<link>http://example.org/rss.xml</link>
```

```xml
$ cat rss-after.xml
</channel>
</rss>
```

Construct your feed like so:

```sh
$ cp rss-before.xml rss.xml
$ pandoc-rss -f 'https://example.org/articles/%s.html' ./*.md >> rss.xml
$ cat rss-after.xml >> rss.xml
```

Finally you have your complete RSS feed:

```xml
$ cat rss.xml
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
<title>Example feed</title>
<description>A simple example of an RSS feed.</description>
<language>en-GB</language>
<link>http://example.org/rss.xml</link>
<item>
<title>Green Eggs and Ham</title>
<link>https://example.org/articles/1960-08-12-green-eggs-and-ham.html</link>
<guid>https://example.org/articles/1960-08-12-green-eggs-and-ham.html</guid>
<description>Classic 1960 children’s book by Dr. Seuss.</description>
<pubDate>Fri, 12 Aug 1960 00:00:00 UTC</pubDate>
</item>
<item>
<title>Fox in Socks</title>
<link>https://example.org/articles/1965-06-19-fox-in-socks.html</link>
<guid>https://example.org/articles/1965-06-19-fox-in-socks.html</guid>
<description>Classic 1965 children’s book by Dr. Seuss.</description>
<pubDate>Sat, 19 Jun 1965 00:00:00 UTC</pubDate>
</item>
</channel>
</rss>
```

## Bugs and notes

  - Not tested with filenames that have spaces or other characters
    considered special in URLs.

## To-do

  - [ ] For each item element, include the rendered HTML as the content
    of the description element. Use either CDATA encoding or escape
    `<` and `>` using HTML character entities `&lt;` and `&gt;`.

    It is the author's opinion that this should be default
    behaviour, but let's include an option not to do this
    since the spec considers this "a decision entirely at
    the discretion of the publisher" ([RSS Best Practices Profile
    4.1.1.20.4](https://www.rssboard.org/rss-profile#element-channel-item-description)).
    Alternatives are:

    - Use the `description` metadata variables as the description element
    - Use the `subtitle` metadata variables as the description element
    - Use the `abstract` metadata variables as the description element
    - Omit the description element altogether, making the title
      element required

    See [Metadata
    variables](https://pandoc.org/MANUAL.html#metadata-variables).

      - [ ] Print warnings about relative links in the description
        element.
