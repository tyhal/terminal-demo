<h1 align="center">
    terminal demo.
</h1>
<p align="center">
    Make a terminal demo as an svg using existing tools
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/tyhal/terminal-demo/main/demo/demo.svg?sanitize=true" width="572" alt="terminal demo">
</p>

A simple use case of termsvg with cast text read from a file instead of a manual process

## Dependencies

- [termsvg](https://github.com/mrmarble/termsvg)
- python3

## Usage

```shell
./script/terminal-demo <file_path>
```

## Input File

Just what you want to send to your shell with tabs using `\t`

```text
echo hello world
cd \td\t
cat basic.txt
```