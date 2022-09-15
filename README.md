# KIN-API-Automation

# API automation

Test automation API using Ruby

## Technologies to

- Ruby
- Rspec
- HTTParty

## Important Infos:

- There is a lot of testing that can be done on this API testing level i just covered some basic ones like ,response codes,messages,contents and
data types just for simplicity in sake of the challenge. But we could add a lot of more validations if needed and also performance tests

- I have separated the project arch in service/factory(fixtures)/specs/support layers 

- I separate the fixtures as factory but also using directly in the tests

## Simple Play - You dont need to install anything locally nor even run it :)

- It has a simple pipeline just to make easier running

- To run this project without any need of local installation or setup please go to: 
 https://github.com/morlfm/KIN-API-Automation/actions/workflows/ruby.yaml  "All workflows" then click on "Run workflow" (please choose environment production since its the only one configured in order of the challenge)

- Sometimes containers from pipelines get some delay or even stop for secondary reasons ( network, disk , memory and so on) and also cypress dashnoard sometimes also get stuck , so please if anything goes wrong or fail take a deeper look :) 

Test Results:

- Directly on the Summary in Github-Actions 
- In case of any failures is there a report that gets generated in the summary.



instructions bellow to run locally if you prefer:

## Setting up the environment 

1. Please install [Ruby - rbenv](https://github.com/rbenv/rbenv).

2. Please type on the command prompt to install dependencies:
```
 gem install bundler && bundler install
```

3. Please create a .env file or other extension for .env files and add there the env variables

```
PASSWORD=wackySumm3r
USERNAME=sdet_challenge
```

## Execution

Please go to roo dir and run: 
```
rspec
```

Please to run with tags 
```
rspec -t{tag-name}
``

Please to run format
```
rspec spec --format documentation
``


## Improvements

- To continuously run in the pipeline we should create our own image to not load resources directly from docker 
- The pipeline configures it is just a simple one, but we could have a bunch of necessary and mandatory improvements like cache and
also especifying when to trigger the pipe with which rules and so on.
- Tests results in a link but it could be on slack channel or so 
- We can create webhooks or so to run pipeline remotely
- We also should have different configurations pointing to all envs to run locally also, not just on pipelines
