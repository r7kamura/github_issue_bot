# Github Issue Bot
Chatter bot IRC interface to manage GitHub Issues.

## Usage
`<--` is your input and `-->` is bot's output on IRC.

### list

```
<-- list
--> list: #1 foo
--> list: #2 bar
```

### show

```
<-- #2
--> show: #2 bar
```

### create

```
<-- create baz
--> created: #3 baz
```

with assignee...

```
<-- create boo [alice]
--> created: #4 boo [alice]
```

### edit

```
<-- edit #1 poo
--> edited: #1 poo
```

with assignee...

```
<-- edit #1 poo [alice]
--> edited: #1 poo [alice]
```

### close

```
<-- close #2 bar
--> closed: #2 bar
```

## Deploy
Assume that you are going to deploy this bot on Heroku.

```
# Fork this repo, and clone the code from your repo.
$ git clone git@github.com:<your-name>/github_issue_bot.git
$ heroku create <your_favorite_bot_name> --stack cedar
$ heroku config:add  \
  IRC_SERVER="..."   \
  IRC_PORT="..."     \
  IRC_CHANNEL="#..." \
  IRC_USERNAME="..." \
  GITHUB_USER="..."  \
  GITHUB_REPO="..."  \
  GITHUB_TOKEN="..."
$ git push heroku master
$ heroku ps:scale bot=1
```

### How to get github access token
Type the following command.

```
$ curl -u 'github_username' -d '{"scopes":["repo"],"note":"Help example"}' https://api.github.com/authorizations
```
