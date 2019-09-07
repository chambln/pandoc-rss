# Pandoc RSS

This is a simple wrapper around pandoc(1) that uses an XML template to
generate RSS `<item>…</item>` elements from a source file.

# Usage

General usage is

``` bash
pandoc-rss PREFIX [FILES]
```

where PREFIX field is not canonical to Pandoc. It’s used as the RSS
item’s GUID and link. It can be specified in the YAML header or on the
command line.

At minimum, your metadata should include `date`, `description`, and
`title`.

## Examples

Command:

``` bash
pandoc-rss 'https://example.org/' fox-in-socks.md green-eggs-and-ham.md
```

Output:

``` xml
<item>
<title>Fox in Socks</title>
<link>https://example.org/fox-in-socks</link>
<guid>https://example.org/fox-in-socks</guid>
<description>Classic 1965 children’s book by Dr. Suess.</description>
<pubDate>June 19, 1965</pubDate>
</item>
<item>
<title>Green Eggs and Ham</title>
<link>https://example.org/green-eggs-and-ham</link>
<guid>https://example.org/green-eggs-and-ham</guid>
<description>Classic 1960 children’s book by Dr. Suess.</description>
<language>en-US</language>
<pubDate>August 12, 1960</pubDate>
</item>
```
