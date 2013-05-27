Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer
	provider :tumblr, '7mySVGuCqH0jU4zqXrWJsfEOQMMHGysPGEAhz921Hq2lKQJQMC', 'WBQpLDQWnnrjnVyWCXB2lSb6pn0R77N5k7iJMGEgQVhkEfh86p'
end