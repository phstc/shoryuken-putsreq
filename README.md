It's a sample app for http://www.pablocantero.com/blog/2015/03/14/sidekiq-redis-vs-shoryuken-aws-sqs/

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

Open the [Shoryuken Bucket on PutsReq](http://putsreq.com/7WzifsM2tgkiy4Xpaj26/inspect), click on Fork and copy "Your PutsReq URL" then:

```sh
heroku config:set BUCKET_URL=http://putsreq.com/<your token>
```

## Running tests

```sh
heroku ps:scale worker=0

heroku run bundle exec rake

heroku ps:scale worker=1
```

All done! Open your bucket on PutsReq and check the results!
