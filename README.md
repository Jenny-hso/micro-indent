# `indent`

Autoindent a new line if a current one matches a Go regular expression.

## Installation

To install the plugin, clone this repository to your `.config/micro/plug/` via `git clone https://github.com/Jenny-hso/micro-indent`.

Alternatively, you may install it via [the unofficial micro plugin channel](https://github.com/Neko-Box-Coder/unofficial-plugin-channel):
1. Add the unofficial channes to your channels list:
```
// settings.json
{
    "pluginchannels": [
        "https://raw.githubusercontent.com/Neko-Box-Coder/unofficial-plugin-channel/main/channel.json"
    ]
}
```
2. Install:
```bash
$ micro -plugin install indent
```

## Usage

To use the plugin, set the `indent.regex` setting in your `settings.json` to a non-empty regular expression:

Here's an example for Python 3:
```json
"ft:python": {
   "indent.regex": ":$"
}
```

## License

This plugin is licensed under CC0-1.0. For details, see [LICENSE](LICENSE).

## See also

- The [`dedent`](https://github.com/Jenny-hso/micro-dedent) plugin.
