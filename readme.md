# Blueprint Website

![bp](http://bptech.berkeley.edu/assets/logo-full-large-d6419503b443e360bc6c404a16417583.png "BP Banner")

## Setup

First, make a file for your environment variables:

    touch config/environment_variables.rb

We're using Devise so you should set `Devise.secret_key` in the `environment_variables.rb` file.

Copy over the `database.yml` file from `config/sample/database.yml` to `config/database.yml`:

    cp config/sample/database.yml config/database.yml

Create the database using:

    createdb blueprint_development

Migrate the database:

    rake db:migrate

To seed the database, we have a rake task that loads users specifically for development purposes only.

    rake db:seed:development

For faster development, you might want to add yourself to the `db/seeds/development.rb` file.

Start the server:

    rails s

Happy developing!

## Heroku Deployment

There's a file, `/config/environment_variables.rb`, which contains environment variables (mostly keys) that are not safe to upload to GitHub (added to .gitignore) so if you create this file, you can set your environment variables here easily.
For example:

    ENV['S3_BUCKET'] = 'calblueprint-prod'

Since we use Git to deploy to Heroku, this file won't be included, so you'll have to set the environment variables manually, and this can be done just once. The equivalent of the above on Heroku is:

    heroku config:add S3_BUCKET=calblueprint-prod

## License

Copyright 2013 Blueprint, Technology for Nonprofits

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Amazon S3 File Storage

We are using Amazon S3 for file storage, so ask Michelle for credentials if you absolutely need them.
