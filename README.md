## Installation instructions

```sh
git clone git@github.com:phstc/shoryuken-putsreq.git

cd shoryuken-putsreq
```

Assuming you have [heroku toolbelt](https://toolbelt.heroku.com/) installed:

```sh
heroku create

git push heroku master
```

Create an [AWS account](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html) if you don't have one, and copy your [Access Key ID and Secret Access Key](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html):

```sh
heroku config:set AWS_ACCESS_KEY_ID=<your access key id>
heroku config:set AWS_DEFAULT_REGION=us-east-1
heroku config:set AWS_SECRET_ACCESS_KEY=<your secret access key>
```

Create your test queue:

```sh
heroku run bundle exec rake create_queue
```

## Running tests

```sh
heroku ps:scale worker=0

heroku run bundle exec rake

heroku ps:scale worker=1
```

Perfect! Now you can probably see your messages hitting PutsReq: [http://putsreq.com/7WzifsM2tgkiy4Xpaj26/inspect](http://putsreq.com/7WzifsM2tgkiy4Xpaj26/inspect).

But I would recommend you to create your own PutsReq bucket, with that you will be able to "Clear History" and get the "From first to last" result more precisely.

In order to do that, you need to change the PutsReq URL here: [https://github.com/phstc/shoryuken-putsreq/blob/master/test_worker.rb#L8](https://github.com/phstc/shoryuken-putsreq/blob/master/test_worker.rb#L8).

Then deploy your change:

```sh
git commit -m "Use my PutsReq bucket"

git push heroku master
```

Then execute the steps detailed in "Running tests" again.