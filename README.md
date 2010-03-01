# Exmouth Market

## What's this?
Simple Web UI for Tokyo Tyrant (NOT READY FOR RELEASE YET!!)

## What's currently supported?
HDB mset/mget/delete/vanish/stat

## Dependencies.

- [Tokyo Cabinet](http://1978th.net/tokyocabinet/)
- [Tokyo Tyrant](http://1978th.net/tokyotyrant/)

### Ruby gems
- [ruby-tokyotyrant](http://github.com/actsasflinn/ruby-tokyotyrant)
- [Sinatra](http://www.sinatrarb.com/) 
- json (sudo gem install json)

## How to setup

### Startup Tokyo Tyrant (anywhere you like). It will start as default port of 1978

<code>
  ttserver example.tch
</code>

### Setup your config file by adding hostname and port of Tokyo Tyrant

<code>
  cd $ROOT/config
  cp config.yml.example config.yml
</code>

### Startup Sinatra . It will start as default port of 4567

<code>
  cd $ROOT
  ruby main.rb
</code>

### Open Browser

## Why called Exmouth Market

It's a lovely market next to [New Bamboo](http://new-bamboo.co.uk/) office. Food market during lunchtime is heaven!!
I just named it by following the convention of Tokyo series, Miyazaki Resistance, and Oklahoma Mixer

## TODO
- Replace layout
- Add pagination
- Handle multiple tables
- Support Table DB
- Validation for invalid request
- Write Spec
