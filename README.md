# GitHub Search Autocomplete PoC
## Introduction
This is a proof-of-concept application intended to demonstrate autocomplete functionality by using [GitHub's search repositories API](https://developer.github.com/v3/search/#search-repositories). Begin typing to search GitHub repositories, and autocomplete suggestions will appear.

## Setup
1. Checkout repository with `git clone`, or download the code from GitHub directly.
2. If using a Ruby version manager, configure as necessary. For example, if using [rbenv](https://github.com/rbenv/rbenv), navigate to project folder and select the Ruby version using `rbenv local`.
3. In project folder, run `bundle install`
4. Add your GitHub access token using `rails credentials:edit`, in the format 
    ```yaml
    github:
        access_token: <your GitHub access token>
    ```
5. Start rails server with `rails s`
6. In your web browser, navigate to http://localhost:3000

## Tests
1. Run `rails test` to run all tests. Note that the tests include calling the GitHub API, so they will fail if an invalid GitHub API access token is configured.

## Usage
Type your search term in the textbox provided. After typing at least 3 characters, the page will populate a dropdown list with autocomplete suggestions provided by GitHub's search API.

