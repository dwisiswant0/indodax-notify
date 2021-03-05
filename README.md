# Indodax Notify

![indodax notify](https://user-images.githubusercontent.com/25837540/110147415-380dc300-7e0e-11eb-98b1-2c769b95e464.png)

Get newest cryptocurrency coin price notifications from Indodax market on your desktop!

## Installation

It's fairly simple, just clone it:

```console
$ git clone https://github.com/dwisiswant0/indodax-notify.git
```

### Dependencies

1. curl
2. [jq](https://stedolan.github.io/jq/download/)
2. [notify-send](https://github.com/vlevit/notify-send.sh) _(custom)_, download:

```console
$ (sudo) wget -q "https://github.com/vlevit/notify-send.sh/raw/master/notify-send.sh" -O /usr/local/bin/notify-send
$ (sudo) wget -q "https://github.com/vlevit/notify-send.sh/raw/master/notify-action.sh" -O /usr/local/bin/notify-action
# (sudo) chmod +x /usr/local/bin/notify-*
```

## Usage

First, initialize by passing functions with built-in `source` shell command.

```bash
source "src/functions.sh" .
```

To get latest price, simply just call `getPrice` function with required arguments, such as symbol, pair, and order (buy/sell).

```bash
getPrice "btc" "idr" "buy"
```

Formatting price? Call `format "price"` function instead.

To send notification to your desktop, call `sendNotif` with pair, price and coin arguments (must be sequence).

```bash
sendNotif "idr" "699.000.000" "btc"
```

### Advanced

Cron every _N_ minutes/hours/days or whatever you want!

For examples, cron for every hours:

```bash
0 */1 * * * /opt/indodax-notify/main.sh
```

### Examples

See examples at [main.sh](https://github.com/dwisiswant0/indodax-notify/blob/master/main.sh) and edit according to your needs for test.

```console
$ ./main.sh
```

## Legal

This tool can be freely copied, modified, altered, distributed without any attribution whatsoever. However, if you feel like this tool deserves an attribution, mention it. It won't hurt anybody :)

Please, read the [license terms](https://github.com/dwisiswant0/indodax-notify/blob/master/LICENSE). Don't worry, it can be read in less than 30 seconds, unless you have some sort of reading disability - in that case, I'm wondering why you're still reading this text. Really. Stop. Please. I mean, seriously. Why are you still reading?

## Contributions

Since this tool includes some contributions, and I'm not an asshole, I'll publically thank the following users for their help:

- [@vlevit](https://github.com/vlevit) for his drop-in replacement for `notify-send` with more features.