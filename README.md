# Github Issue Bot
Chatter bot IRC interface to manage GitHub Issues.

## Usage

### list

```
me:  list
bot: list: #1 foo
bot: list: #2 bar
```

### show

```
me:  #2
bot: show: #2 bar
```

### create

```
me:  create baz
bot: created: #3 baz
```

with assignee...

```
me:  create boo [alice]
bot: created: #4 boo [alice]
```

### edit

```
me:  edit #1 poo
bot: edited: #1 poo
```

with assignee...

```
me:  edit #1 poo [alice]
bot: edited: #1 poo [alice]
```

### close

```
me:  close #2 bar
bot: closed: #2 bar
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
