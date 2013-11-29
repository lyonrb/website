#= require octokit/lib/base64
#= require octokit/lib/underscore-min
#= require octokit
#= require handlebars

$(document).ready ->
  gh = new Octokit(token: 'acaa8066fdec17ef7be1c1a290d537ceb1727579')
  $('ul.projects').each ->
    list = $(this)
    username = list.data('github')
    gh.getUser(username).getRepos().done (repos) ->
      repos.forEach (repo) ->
        template = Handlebars.compile $('#project-template').html()
        list.append template(user: username, repo: repo.name)
