# Microservice API

This is a simple API that implements a microservice architecture. A microservice is a small, independent service that can be used to build a larger application.

![ruby-3.2.0](https://img.shields.io/badge/ruby-3.2.0-red.svg)
![rails-7.0.4](https://img.shields.io/badge/rails-7.0.4-red.svg)

## Setup

* Ruby: 3.2.0
* Rails: 7.0.4
* Sidekiq: 6.2.2
* Shoulda Matchers: 5.0.0
* DatabaseCleaner: 2.0.1
* FactoryBot: 6.2.0

## Getting Started

To get started with the app, clone the repo and then install the needed gems:

```bash
  git clone https://github.com/nemuba/microservice_api_test.git
```

```bash
  bundle install
```

Next, migrate the database:

```bash
  rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```bash
  rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```bash
  rails s
```

And initialize sidekiq:

```bash
  bundle exec sidekiq
```

## Usage

### Endpoints

| Method | URL | Description |
| ------ | --- | ----------- |
| POST | /sepros | Create a call to service |
| GET | /sepros/result | Get the result of the service call |

### Painel Sidekiq

visit [http://localhost:3000/sidekiq](http://localhost:3000/sidekiq)

### Example

* POST /sepros

  ```json
  {
    "sepro": {
      "token": "<TOKEN>",
      "document": "<DOCUMENT>",
    }
  }
  ```

* GET /serpros/result

  ```json
  {
    "token": "<TOKEN>"
  }
  ```
