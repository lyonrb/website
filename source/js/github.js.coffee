#= require octokit/lib/base64
#= require octokit/lib/underscore-min
#= require octokit

$(document).ready ->
  gh = new Octokit
  $('ul.projects').each ->
    list = $(this)
    username = list.data('github')
    user = gh.getUser(username)
    user.getRepos().done (repos) ->
      repos.forEach (repo) ->
        list.append "<li><a href=\"https://github.com/#{username}/#{repo.name}\">#{repo.name}</a></li>"
