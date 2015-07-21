- With no args, inspects most recent startup
- Use `--verbose` or `-v` to see the 2 relevant log entries
![a1](http://people.redhat.com/rsawhill/rebooty-v0.2.x-a1.png)

- Use `--all` or `-a` to inspect all events in log file (which defaults to `/var/log/messages` -- there's an option to change that as well)
- Use `--glob` or `-g` to search through older logs too (e.g., `/var/log/messages*`)
![a2](http://people.redhat.com/rsawhill/rebooty-v0.2.x-a2.png)

- Use `--lines` or `-n` to see arbitrary number of lines before startup event
![a3](http://people.redhat.com/rsawhill/rebooty-v0.2.x-a3.png)

- Pass a directory to run against sosreports
- Use `--event` or `-e` to specify a single startup event number to inspect (defaults to showing 40 lines)
![b1](http://people.redhat.com/rsawhill/rebooty-v0.2.x-b1.png)

Current help page:

```
Usage: Rebooty-inspector [-l|-a|-e #] [-q|-v|-n #] [-o OS] [-f LOG] [-gx] [ROOTDIR]
Inspect recent startup events to see if they were preceded by clean shutdowns

By default, only most recent boot is inspected and explanation is printed
If it followed a graceful shutdown, exit with success; else exit w/ code 9
This behavior can be changed by using the --all or --event= options

If a directory is passed as ROOTDIR, then that will be used instead of '/'
This is useful to parse sosreports

OPTIONS

  -l, --logit     Log result via logger cmd
                    See NOTES below on this option
  -a, --all       Expand search to all startup events
                    Disables exit on first match; can't be used with --logit
  -e, --event=#   Inspect specific event number (as reported by --all)
                    Implies --all --lines=40

  -q, --quiet     Don't print any messages to stdout (useful with --logit)
  -v, --verbose   Include relevant log entries in output
  -n, --lines=#   Print # number of lines prior to startup event; implies -v

  -o, --os=OS     Specify OS to determine what to search for in log
                    Default: auto-detects based on /etc/redhat-release
                    Does NOT auto-detect by reading LOG file
                    Choices: 5, 5-rsyslog3, 5-rsyslog5, 6, and 7
                             (All referring to RHEL)

  -f, --file=LOG  Specify non-default log file, e.g., one from another system
                    Default: '/var/log/messages'

  -g, --glob      Add '*' character to LOG, i.e., multiple logs will be parsed
                    Useful if system uptime is so great that main log has no
                    record of last startup (or if you want to see all events)
  -x, --nocolor   Disable terminal color-escapes

NOTES

This tool expects standard syslog/rsyslog log file formats.
It cannot handle customized rsyslog templates or use of non-standard loggers
like syslog-ng. Consolidated logs [from multiple hosts] could cause trouble.

Many things that aren't configurable with options can be tweaked with
environment variables (including log messages sent with --logit).
Reference variables names declared at the start of the script.

Version info: Rebooty-inspector v0.2.0 last mod 2015/07/21
Contact rsaw@redhat.com or <github.com/ryran/Rebooty-inspector>
```
