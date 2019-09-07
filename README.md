# SYNOPSIS

``` bash
pandoc-rss [OPTIONS] -V guid:GUID [FILES]
```

# DESCRIPTION

This is a wrapper around pandoc(1) that uses an XML template to generate
RSS `<item></item>` elements from source files.

# USAGE

Metadata should include `date`, `description`, `title` and `guid`. The
`guid` metadata can be specified in the YAML header or on the command
line.

# EXAMPLES

``` bash
pandoc-rss -V 'guid:https://example.org/1965-06-19-fox-in-socks.html' fox-in-socks.md
```
