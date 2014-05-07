//= require "jquery"
//= require "handlebars"
//= require "ember"
//= require "ember-data"
//= require foundation/js/foundation.min
//= require_self
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./templates
//= require      ./routes

$(document).foundation();

App = Ember.Application.create({
	Store: DS.Store.extend({
		revision: 10,
		adapter: DS.fixtureAdapter
	})
});
