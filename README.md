
# Shortener API

**This API implements a HTTP client that connects Bit.ly API**

This API allows you to:

- Shorten URLs

- Get information about a shortened URL

- Get stadistics of a certain shortened URL

- Get all URLs previously created

  

## Usage

### Shorten an URL

```
  POST /api/v1/links/shorten
```

Payload

```json
  {
    "url": "http://google.com"
  }
```

Success ✅

HTTP 200

```json
{
    "table": {
        "success?": true,
        "body": {
            "status_code": 200,
            "status_txt": "OK",
            "data": {
                "url": "http://bit.ly/2NeKoad",
                "hash": "2NeKoad",
                "global_hash": "3j4ir4",
                "long_url": "http://google.com/",
                "new_hash": 0
            }
        }
    }
}
```
Errors ❌

HTTP 422

```json
{
    "error": "missing url param",
    "code": "unprocessable_entity"
}
```  

## Installing


This API uses Rails 5.2.2 and Ruby 2.4.1

  

Open your favorite Terminal and run these commands.

  

1) Clone repository

```sh

$ git clone https://github.com/devpolish/shortener_rails_api.git

```

  

2) Installing dependencies

```sh

$ cd shortener_rails_api

$ RAILS_ENV=development bin/bundle install

```

  

3) Create databases

  

```sh

$ rake db:migrate

```

  

### Testing

 
```sh

$ rspec specs/*

```