#= require octokit/lib/base64
#= require octokit/lib/underscore-min
#= require octokit
#= require handlebars

Handlebars.registerPartial('project', $('#project-template').html())

$(document).ready ->
  gh = new Octokit(token: 'acaa8066fdec17ef7be1c1a290d537ceb1727579')
  $('.github-placeholder').each ->
    placeholder = $(this)
    username = placeholder.data('github')
    gh.getUser(username).getRepos()
      .done (repos) ->
        context =
          count: repos.length
          projects: repos.map (repo) ->
            name: repo.name
            url: "https://github.com/#{username}/#{repo.name}"
        template = Handlebars.compile $('#github-template').html()
        placeholder.html template(context)
      .fail ->
        placeholder.remove()
