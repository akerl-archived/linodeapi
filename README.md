linodeapi
=========

[![Gem Version](https://img.shields.io/gem/v/linodeapi.svg)](https://rubygems.org/gems/linodeapi)
[![Build Status](https://img.shields.io/circleci/project/akerl/linodeapi/master.svg)](https://circleci.com/gh/akerl/linodeapi)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/linodeapi.svg)](https://codecov.io/github/akerl/linodeapi)
[![Code Quality](https://img.shields.io/codacy/60b77ea8214241b5ac970bcdfd584587.svg)](https://www.codacy.com/app/akerl/linodeapi)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Ruby API wrapper for the [Linode API](https://www.linode.com/api)

## Usage

Create an API object from the LinodeAPI::Raw class, by providing it with either an API key or username and password:

```
require 'linodeapi'

api_one = LinodeAPI::Raw.new(apikey: 'YOUR_KEY_HERE')
api_two = LinodeAPI::Raw.new(username: 'akerl', password: 'cyberpond')
```

The Raw API object is a faithful representation of Linode's [API spec](https://www.linode.com/api/utility/api.spec), parsed directly from the upstream source at runtime. Calls can be made using the methods shown in Linode's [API docs](https://www.linode.com/api):

```
# cat list.rb
require 'linodeapi'

api = LinodeAPI::Raw.new(apikey: 'KEY')

result = api.linode.list

puts "#{result.size} Linodes found: #{result.map(&:label).join(', ')}"
p result.first
```

```
# ruby list.rb
6 Linodes found: miro, olhado, quara, grego, ela, quim
#<OpenStruct alert_cpu_enabled=0, alert_bwin_enabled=0, alert_bwquota_enabled=0, alert_diskio_threshold=1000, backupwindow=4, watchdog=1, distributionvendor="Arch", datacenterid=6, status=1, alert_diskio_enabled=0, create_dt="2014-07-30 20:09:12.0", totalhd=49152, alert_bwquota_threshold=80, totalram=2048, alert_bwin_threshold=5, linodeid=591319, alert_bwout_threshold=5, alert_bwout_enabled=0, backupsenabled=0, alert_cpu_threshold=90, planid=2, backupweeklyday=0, label="miro", lpm_displaygroup="cluster", totalxfer=3000>
```

Arguments passed in are named just like in the docs:

```
api.linode.ip.list(linodeid: 591319)
```

The library will raise an exception if you exclude a required parameter:

```
api.linode.create
# ArgumentError: linode.create requires planid
```

### Retryable helper

The LinodeAPI::Retryable class automatically handles 429 errors (really, any HTTP error that is accompanied by a Retry-After header).

This class behaves identially to the LinodeAPI::Raw class, with 2 additional parameters at creation: `max_retries` sets the total number of requests it will attempt per call and `max_delay` sets the maximum delay between attempts. They default to 3 tries and 60 seconds, respectively.

## Installation

    gem install linodeapi

## License

linodeapi is released under the MIT License. See the bundled LICENSE file for details.

