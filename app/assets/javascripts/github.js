function onReady() {
    let truncate = function(string, length) {
        if (string == null) {
            return '';
        } else if (string.length <= length) {
            return string;
        } else {
            return string.slice(0, length) + '...';
        }
    };

    let data_transform = function(response) {
        console.log(response);
        return $.map(response, function (repository) {
           return {
               id: repository.id,
               name: repository.name,
               full_name: repository.full_name,
               description: repository.description,
               username: repository.owner.login
           }
        });
    };

    let search_repositories = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        identify: function(obj) { return obj.id; },
        remote: {
            url: '/github/search_repositories/%QUERY',
            wildcard: '%QUERY',
            cache: false,
            transform: data_transform
        }
    });

    $('.typeahead').typeahead({
        highlight: true,
        minLength: 3
    }, {
        name: 'repository',
        display: 'name',
        source: search_repositories,
        templates: {
            empty: '<div>No repositories found for your query</div>',
            suggestion: function(data) {
                let repo_name = '<div class="repo_name">' + data.name + '</div>';
                let username = '<div class="repo_username">@' + data.username + '</div>';
                let desc = '<div class="repo_desc">' + truncate(data.description, 110) + '</div>';
                let display = repo_name + username + desc;
                return '<div>' + display + '</div>';
            }
        }
    });
}

$(document).on('turbolinks:load', onReady);