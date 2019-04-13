# 2.0.2 / 2019-04-12

* [FEATURE] Set user-agent to include gem name, ruby version, and a custom "user_agent_prefix" option.
* [ENHANCEMENT] Updated goodcop to use new version that includes rubocop-performance checks

# 2.0.1 / 2017-10-03

* [ENHANCEMENT] Broke out some of the parsing code into linodeapi/helpers to make it easier to read
* [FEATURE] Support using multiple LinodeAPI::Raw instances with different endpoint URIs at the same time

# 2.0.0 / 2017-10-03

* [FEATURE] LinodeAPI::Retryable class that automatically retries supported errors
* [ENHANCEMENT] Cleaned up LinodeAPI::Raw's parameter handling
* [FEATURE] Added unique error codes to lib/linodeapi/errors.rb for API/HTTP errors

# 1.0.1 / 2016-07-01

* [FEATURE] Expose LinodeAPI.spec_version

# 1.0.0 / 2015-01-19

* [ENHANCEMENT] Stabilized API

