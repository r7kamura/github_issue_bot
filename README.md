# Github Issue Bot
Chatter bot IRC interface to manage GitHub Issues.

## Deploy
Assume that you are going to deploy this bot on Heroku.

```
# Fork this repo, and clone the code from your repo.
$ git clone git@github.com:<your-name>/chatroid.git
$ heroku create <your_favorite_bot_name> --stack cedar
$ heroku config:add  \
  IRC_SERVER="..."   \
  IRC_PORT="..."     \
  IRC_CHANNEL="#..." \
  IRC_USERNAME="..." \
  GITHUB_USER="..."  \
  GITHUB_REPO="..."  \
  GITHUB_TOKEN=.".."
$ git push heroku master
$ heroku ps:scale bot=1
```

## etc
To get github access token, please type the following command.

```
$ curl -u 'github_username' -d '{"scopes":["repo"],"note":"Help example"}' https://api.github.com/authorizations
```
