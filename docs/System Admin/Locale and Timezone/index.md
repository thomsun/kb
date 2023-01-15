# Locale and Timezone

## Locale

To see current setting
```
$ locale
```

To set locale
```
$ sudo update-locale LANG=en_US.UTF-8
```

## Timezone

To see current system time
```
$ timedatectl
```

To list available timezone
```
$ timedatectl list-timezones
```

To set timezone
```
$ sudo timedatectl set-timezone America/Los_Angeles
```