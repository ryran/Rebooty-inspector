For now, two screenshots and the help page:

**Run live on a RHEL 5 machine**

![rhel5](http://people.redhat.com/rsawhill/rebooty-v0.1.1-rhel5.png)

**Run on a RHEL 6 sosreport**

![rhel6](http://people.redhat.com/rsawhill/rebooty-v0.1.1-rhel6sos.png)

**Help page**

```
$ Rebooty-inspector -h
Usage: Rebooty-inspector [-l|-a|-e #] [-q|-v|-n #] [-o OS] [-f LOG] [-r DIR] [-gx]
Inspect recent startup events to see if they are preceded by clean shutdowns

By default, only most recent boot is inspected and explanation is printed
If it followed a graceful shutdown, exit with success; else exit w/ code 9
This behavior is changed by using the --all option

OPTIONS

  -l, --logit     Log result via logger cmd
                    See NOTES below on this option
  -a, --all       Expand search to all startup events
                    Disables exit on first match; can't be used with --logit
  -e, --event=#   Inspect specific event number (as reported by --all)
                    Implies --glob --all --lines=40

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

  -r, --root=DIR  Specify root path (defaults to: '/')
                    Useful to allow running on a sosreport; implies --glob

  -g, --glob      Add '*' character to LOG, i.e., multiple logs will be parsed
                    Useful if system uptime is so great that main log has no
                    record of last startup
                    (Use this option if you see exit code 7)
  -x, --nocolor   Disable terminal color-escapes

NOTES

This tool expects standard syslog/rsyslog log file formats.
It cannot handle customized rsyslog templates or use of non-standard loggers
like syslog-ng. Consolidated logs [from multiple hosts] could cause trouble.

Many things that aren't configurable with options can be tweaked with
environment variables (including log messages sent with --logit).
Reference variables names declared at the start of the script.

Version info: Rebooty-inspector v0.1.0 last mod 2015/07/20
Contact rsaw@redhat.com or <github.com/ryran/Rebooty-inspector>
```
