Pandoc RSS
==========

This is a shell script that uses pandoc(1) with an XML template to
generate a sequence of `<item>…</item>` elements from markup source
files. You can use it to create an RSS feed from a series of files that
Pandoc can read metadata from, such as ReST or Pandoc-flavoured
Markdown.

I wrote it to be used with tools such as the [static site generator]
that I use to generate [my website].

Dependencies
------------

This script is written in rc(1) shell, specifically Byron Rakitzis'
dialect. [I wrote an article on how to get that set up]. I might port it
to sh(1) at some point.

Usage
-----

General usage is

``` {.bash}
pandoc-rss PREFIX FILE [FILE ...]
```

where PREFIX is prepended to each file’s basename to make the RSS item’s
GUID and link. For example, if the PREFIX was
`https://example.org/posts/`, then a file called
`2019-09-08-top-10-saddest-anime-deaths.rst` would become
`https://example.org/posts/2019-09-08-top-10-saddest-anime-deaths`.

At minimum, your metadata should include `date`, `description`, and
`title`. Make sure the `date` variable can be correctly interpretted by
date(1)---the script transforms it into the standard RSS-compatible
format.

### Example

Here's one way to use this tool. Let's say you have two Markdown files
and the the top and bottom of your RSS XML file:

    $ ls
    1960-08-12-green-eggs-and-ham.md
    1965-06-19-fox-in-socks.md
    rss-after.xml
    rss-before.xml

``` {.xml}
$ cat rss-before.xml
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
<title>Example feed</title>
<description>A simple example of an RSS feed.</description>
<language>en-GB</language>
<link>http://example.org/rss.xml</link>
```

    $ cat rss-after.xml
    </channel>
    </rss>

First, invoke `pandoc-rss` to create the list of RSS items. Here we
redirect its standard output to `rss-items.xml`:

``` {.bash}
$ pandoc-rss 'https://example.org/articles/' *.md > rss-items.xml
```

Now sandwich that between your top and bottom XML fragments:

``` {.bash}
$ cat rss-before.xml rss-items.xml rss-after.xml > rss.xml
```

And finally you have your complete RSS feed:

``` {.xml}
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
<link>https://example.org/articles/1960-08-12-green-eggs-and-ham</link>
<guid>https://example.org/articles/1960-08-12-green-eggs-and-ham</guid>
<description>Classic 1960 children’s book by Dr. Seuss.</description>
<pubDate>Fri, 12 Aug 1960 00:00:00 UTC</pubDate>
</item>
<item>
<title>Fox in Socks</title>
<link>https://example.org/articles/1965-06-19-fox-in-socks</link>
<guid>https://example.org/articles/1965-06-19-fox-in-socks</guid>
<description>Classic 1965 children’s book by Dr. Seuss.</description>
<pubDate>Sat, 19 Jun 1965 00:00:00 UTC</pubDate>
</item>
</channel>
</rss>
```

  [static site generator]: https://github.com/chambln/red/
  [my website]: https://cosine.blue/
  [I wrote an article on how to get that set up]: https://cosine.blue/2019-06-26-rc-shell-setup.html
