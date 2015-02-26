# terminator

An extremely lightweight terminal based Jenkins build monitor written using Python.

### Linux Terminal

![Screenshot of Ubuntu Terminal](docs/images/ubuntu.png)
  
### Windows Command Prompt

![Screenshot of Windows Command Prompt](docs/images/windows.png)


## Prerequisites

- Python 3.4
- Pip 3

## Installation

Install all the requirements.

```bash
$ cd terminator
$ pip install -r requirements.txt
```

You might need elevated privileges to install some requirements.

```bash
$ sudo pip install -r requirements.txt
```

## Usage

```python
$ python -m terminator <jenkins url> "job-one job-two job-three"
```

### To change the polling interval

```python
$ python -m terminator <jenkins url> "job-one job-two job-three" -i INTERVAL
```

Here `INTERVAL` is in seconds.


### If your Jenkins needs authentication

```python
$ python -m terminator <jenkins url> "job-one job-two job-three" -u USERNAME -p
```

### If your must override terminal width

```python
$ python -m terminator <jenkins url> "job-one job-two job-three" -w WIDTH
```

Sometimes you might want to use `tput cols` to get the terminal width.

```python
$ python -m terminator <jenkins url> "job-one job-two job-three" -w "$(tput cols)"
```

### If you don't like the default font

```python
$ python terminator <jenkins url> "job-one job-two job-three" -f FONT
```

`FONT` can be one of the [pyfiglet fonts](https://github.com/pwaller/pyfiglet/tree/master/pyfiglet/fonts). Just make
sure that the font you choose does not break your terminal width.
