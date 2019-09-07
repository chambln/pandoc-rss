# Pandoc RSS

This is a wrapper around pandoc(1) that uses an XML template to generate
RSS `<item>…</item>` elements from source files.

# Usage

``` bash
pandoc-rss -V guid:GUID [OPTIONS] [FILES]
```

At minimum, your metadata should include `date`, `description`, `title`
and `guid`.

The `guid` field is not canonical to Pandoc. It can be specified in the
YAML header or on the command line, and is used as the RSS item’s GUID
and link.

## Examples

``` bash
pandoc-rss -V 'guid:https://example.org/1965-06-19-fox-in-socks.html' fox-in-socks.md
```
