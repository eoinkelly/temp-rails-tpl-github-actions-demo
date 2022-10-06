# eoin_template_app

    TODO: Copy this file into your project and fill out all of the sections with your relevant project details.

## Purpose

    TODO: Aim to answer these questions here:
        * Why does this application exist?
        * Is it an API or serve HTML or something different?
        * How much traffic is it expected to get?

## Operations:

This project follows
[Ackama standard branch and environment naming](https://github.com/ackama/wiki/wiki/Branch-naming-conventions-and-deployment-process)

    TODO: If this project cannot follow our standard naming conventions you must document why here.

| **Environment** | **URL** | **Hosting Platform**     | **Git Branch** | **Exception monitoring URL** | **Logs available at**                                            |
| --------------- | ------- | ------------------------ | -------------- | ---------------------------- | ---------------------------------------------------------------- |
| Staging         | TODO    | TODO (one of Heroku/AWS) | main           | TODO (E.G. RAYGUN URL)       | TODO (Examples: On-disk/Heroku/AWS Cloudwatch/Papertrail/Loggly) |
| Production      | TODO    | TODO (one of Heroku/AWS) | production     | TODO (E.G. RAYGUN URL)       | TODO (Examples: On-disk/Heroku/AWS Cloudwatch/Papertrail/Loggly) |

    TODO: Add columns to the table above if there are resources that are required for that environment e.g. a Redis, ElasticSearch etc.
    TODO: If we need to assume role into their AWS account you should mention that here (don't list the role name - leave that in 1Password)
    TODO: If there are any unusual aspects to the deployment of this app you should mention them e.g.
             * Uses Chef but is controlled by AWS Opsworks
             * Gets
    TODO: The typical log level for production environments are 'info' - if you are not using 'info' then please document why.

### SSH access

| **Environment** | **SSH access available** |
| --------------- | ------------------------ |
| Staging         | YES/NO                   |
| Production      | YES/NO                   |

    TODO: Include FULL details as to how a dev can SSH into deployed
          environments. Step by step instructions are helpful. This section will be
          really important to somebody responding to an ops incident so do that
          person (who may be you!) a favour and make the instructions very clear :-)

### Browser Support

| **Browser**            | **Supported Versions** |
| ---------------------- | ---------------------- |
| Internet Explorer      | 11+                    |
| Edge                   | 17+                    |
| Safari                 | Latest -2              |
| Chrome                 | Latest -2              |
| Firefox                | Latest -2              |
| iOS Safari             | Latest -2              |
| Chrome for Android     | Latest -2              |
| UC Browser for Android | Latest -2              |
| Samsung Internet       | Latest -2              |

    TODO: Confirm browser requirements with client/product owner. The above are all based on current NZ wide (and largely world wide) browser usage statistics and are set as our defaults.

## Secrets

All credentials and the `.env` file for this project are stored in Ackama
1Password vault named `TODO`

    TODO: Ensure that all secrets in this app are stored **only** in Ackama 1Password

## Healthchecks

A healthcheck endpoint is available at http://localhost:3000/healthchecks/all.
Healthchecks are configured in `config/initializers/health_checks.rb`. By
default, the following health checks are enabled:

- Default (app is running)
- App version (the git commit that is running)
- Database connectivity

Extra checks can be enabled or added within this initializer.

The health check endpoint has it's own authentication checks that can be
specified:

- `ENV["HEALTHCHECK_HTTP_BASIC_AUTH_USERNAME]`
- `ENV["HEALTHCHECK_HTTP_BASIC_AUTH_PASSWORD]`

This enables a unique set of credentials to exist for accessing the health
checks endpoint.

If either of these settings are unspecified, then the configuration will fall
back to the default HTTP basic auth settings:

- `ENV["HTTP_BASIC_AUTH_USERNAME]`
- `ENV["HTTP_BASIC_AUTH_PASSWORD]`

If neither of these credentials are configured, then the healthcheck endpoint
will be publicly available, which may be what you want, but maybe not.

## Project Resources:

| **Resource**    | **URL**                           |
| --------------- | --------------------------------- |
| Backlog URL     | TODO                              |
| CI URL          | TODO                              |
| Other resources | TODO (DELETE IF THERE AREN'T ANY) |

## People Involved

| **Role(s)**     | **Name(s)** |
| --------------- | ----------- |
| Team            | TODO        |
| Developers      | TODO        |
| Designer        | TODO        |
| Tester          | TODO        |
| Project Manager | TODO        |
| Account Manager | TODO        |
| Product Owner   | TODO        |

## Comms:

    TODO: Describe the team's chosen methods for communication (Slack, hangout, email, etc) and include any relevant details (Slack channel name).

## Developers

### Dependencies

Before running this app and its tests locally you will need:

1. PostgreSQL
1. Redis
1. Imagemagick
1. Docker
1. ElasticSearch

   TODO: Add any dependencies that must be installed by a dev before they can
   run this app and tests

### Running the app

    TODO: Include the step by step instructions for setting up a local environment.
    TODO: An Ackama project should not take more than 5 mins for a new developer to setup

1. Clone the project: `git clone git@bitbucket.org:rabidtech/THIS_REPO.git`
2. Run the setup script: `./bin/setup`
3. Create `.env` file by copying data from 1Password.

   TODO: Document if they need to run any seeds before running the app (unless
   it is part of ./bin/setup)

Then run the following commands:

```
# Terminal #1:
bundle exec rails s

# Terminal #2:
bundle exec sidekiq
```

### Running the tests

    TODO: Describe how to run the project's test suite. Are there any other
          tests that a new dev should know about? Performance tests?
          Include all testing info in this section.

```bash
# run all specs
bundle exec rspec spec

# run Capybara specs showing browser GUI (very useful for debugging when you
# pause a test with binding.pry)
HEADFUL=1 bundle exec rspec spec/features

# run lighthouse specs
npm run lighthouse-spec
```

### Source code annotations

The [chusaku](https://github.com/nshki/chusaku) and
[annotate](https://github.com/ctran/annotate_models) gems are installed in
development. Chusaku annotates controller actions with a comment detailing the
route. Annotate annotates models and fixtures with a comment detailing the DB
schema. You can run them manually via:

```bash
# update controller action annotation comments
bundle exec chusaku

# update model, fixture, spec annotation comments (not usually required, auto-runs on migrations)
bundle exec annotate
```

Annotate runs automatically after migrations. You will have to run Chusaku
manually after you add controller actions. CI verifies that these annotations
are up to date.

### Rake tasks

```
bundle exec rake developer:do_stuff
```

    TODO: Are there rake tasks new developers should know about? Document them here
    TODO: Is there anything else? If anything else is needed to get it properly running, include that here.

If there is anything that might prevent a new dev from following the above steps
and then running the tests successfully, make sure that it is documented.

## Documentation:

    TODO: If there is additional documentation (wiki, api-docs, etc) include the link to it here.

## Running in production

### security.txt

- `/.well-known/security.txt` exists with instructions which security
  researchers can use to contact us if they find an issue in this application.

### Logging

- This application uses the `lograge` gem to make Rails create a concise single
  log line for successful requests in deployed environments. See
  `config/initializers/lograge.rb` for details.
- If `LOG_LEVEL` exists in the shell environment then it is used to set the log
  level. Otherise there is a hard-coded fallback for each environment. See
  `/config/environments/*.rb` for details.

### Running in staging mode locally

```sh
# precompile assets
$ RAILS_FORCE_SSL=false RAILS_ENV=staging RAILS_LOG_TO_STDOUT=true bundle exec rails assets:precompile

# run server (note you need **all** these flags to run staging locally)
$ RAILS_FORCE_SSL=false RAILS_ENV=staging RAILS_LOG_TO_STDOUT=true RAILS_SERVE_STATIC_FILES=true bundle exec rails server
```

### Running in production mode locally

```sh
# precompile assets
$ RAILS_FORCE_SSL=false RAILS_ENV=production RAILS_LOG_TO_STDOUT=true bundle exec rails assets:precompile

# run server (note you need **all** these flags to run production locally)
$ RAILS_FORCE_SSL=false RAILS_ENV=production RAILS_LOG_TO_STDOUT=true RAILS_SERVE_STATIC_FILES=true bundle exec rails server
```

### Deployment with Capistrano

This app is configured to deploy with
[Capistrano](https://github.com/capistrano/capistrano). See `config/deploy.rb`
and `config/deploy/` for details.

The following tasks are available:

```
cap bundler:clean                  # Remove unused gems installed by bundler
cap bundler:config                 # Configure the Bundler environment for the release so that subequent
cap bundler:install                # Install the current Bundler environment
cap bundler:map_bins               # Maps all binaries to use `bundle exec` by default
cap deploy                         # Deploy a new release
cap deploy:check                   # Check required files and directories exist
cap deploy:check:directories       # Check shared and release directories exist
cap deploy:check:linked_dirs       # Check directories to be linked exist in shared
cap deploy:check:linked_files      # Check files to be linked exist in shared
cap deploy:check:make_linked_dirs  # Check directories of files to be linked exist in shared
cap deploy:cleanup                 # Clean up old releases
cap deploy:cleanup_assets          # Cleanup expired assets
cap deploy:cleanup_rollback        # Remove and archive rolled-back release
cap deploy:clobber_assets          # Clobber assets
cap deploy:compile_assets          # Compile assets
cap deploy:finished                # Finished
cap deploy:finishing               # Finish the deployment, clean up server(s)
cap deploy:finishing_rollback      # Finish the rollback, clean up server(s)
cap deploy:log_revision            # Log details of the deploy
cap deploy:migrate                 # Runs rake db:migrate if migrations are set
cap deploy:migrating               # Runs rake db:migrate
cap deploy:normalize_assets        # Normalize asset timestamps
cap deploy:published               # Published
cap deploy:publishing              # Publish the release
cap deploy:restart                 # Restart application
cap deploy:revert_release          # Revert to previous release timestamp
cap deploy:reverted                # Reverted
cap deploy:reverting               # Revert server(s) to previous release
cap deploy:rollback                # Rollback to previous release
cap deploy:rollback_assets         # Rollback assets
cap deploy:set_current_revision    # Place a REVISION file with the current revision SHA in the current release path
cap deploy:started                 # Started
cap deploy:starting                # Start a deployment, make sure server(s) ready
cap deploy:symlink:linked_dirs     # Symlink linked directories
cap deploy:symlink:linked_files    # Symlink linked files
cap deploy:symlink:release         # Symlink release to current
cap deploy:symlink:shared          # Symlink files and directories from shared to release
cap deploy:updated                 # Updated
cap deploy:updating                # Update server(s) by setting up a new release
cap doctor                         # Display a Capistrano troubleshooting report (all doctor: tasks)
cap doctor:environment             # Display Ruby environment details
cap doctor:gems                    # Display Capistrano gem versions
cap doctor:servers                 # Display the effective servers configuration
cap doctor:variables               # Display the values of all Capistrano variables
cap git:check                      # Check that the repository is reachable
cap git:clone                      # Clone the repo to the cache
cap git:create_release             # Copy repo to releases
cap git:set_current_revision       # Determine the revision that will be deployed
cap git:update                     # Update the repo mirror to reflect the origin state
cap git:wrapper                    # Upload the git wrapper script, this script guarantees that we can script git without getting an interactive prompt
cap install                        # Install Capistrano, cap install STAGES=staging,production
cap invoke:rake                    # Execute a rake task on a remote server (cap invoke:rake TASK=db:migrate)

```
