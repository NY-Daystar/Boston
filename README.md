# Boston

[![Boston-CI](https://github.com/NY-Daystar/boston/actions/workflows/dotnet.yml/badge.svg)](https://github.com/NY-Daystar/boston/actions/workflows/dotnet.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Version](https://img.shields.io/github/tag/NY-Daystar/boston.svg)](https://github.com/NY-Daystar/boston/releases)
[![Total views](https://img.shields.io/sourcegraph/rrc/github.com/NY-Daystar/boston.svg)](https://sourcegraph.com/github.com/NY-Daystar/boston)

**\_Version: v0.0.1**

Ruby project to follow crypto-curreencies tends

-   Define crypto-currencies to follow
-   Set threshold for each currencies
-   Notifying by email when threshold is reached

# TODO setup le fichier config-sample

# TODO ajouter l'option send-mail a true ou false

## Summary

-   [Requirements](#requirements)
-   [How to use](#how-to-use)
-   [Get started](#get-started
-   [How it works](#how-it-works)
-   [Unit tests](#tests)
-   [For developer](#for-developers)
    -   [Setup secret to send mails](#encoding-secret-to-setup-mail)
-   [Contact](#contact)
-   [Credits](#credits)

## Requirements

-   [ruby](https://www.ruby-lang.org/fr/downloads/) >= 3.0.0
-   [rvm](https://rvm.io/rvm/install) >= 1.29.12
-   [rspec](https://rspec.info/documentation/) >= 3.12

## How to use

Set good version of ruby

```bash
$ source ~/.rvm/scripts/rvm
$ rvm list known
$ rvm install ruby@latest
$ rvm current
# ruby-3.0.0
```

## Get started

1. Clone repository

```bash
git clone git@github.com:NY-Daystar/Boston.git
```

2. Go into this project

```bash
cd Boston
```

3. Setup and launch project

```
make
```

4. If you want to re-install dependencies

```bash
bundle install

```

5. To launch project

```bash
ruby boston.rb
```

## How it works

This project requested every `10 seconds` data from `coingecko` api  
about cryptocurrencies and their values

It will check these datas with threshold defined

Send mail if one or multiple threshold is reached

## Tests

you can run unit tests with this command

```
rspec tests/*.rb
```

## For developers

### Encoding secret to setup mail

```ruby
ruby Cypher.rb <YOUR_SECRET>
```

## Contact

-   To make a pull request: https://github.com/NY-Daystar/boston/pulls
-   To summon an issue: https://github.com/NY-Daystar/boston/issues
-   For any specific demand by mail: [luc4snoga@gmail.com](mailto:luc4snoga@gmail.com?subject=[GitHub]%boston%20Project)

## Credits

Made by Lucas Noga.  
Licensed under GPLv3.
