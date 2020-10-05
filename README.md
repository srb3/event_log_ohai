# event_log_ohai 
This cookbook deploys an example ohai plugin that collects data about the event logs dependent services.

The plugin is located in the ohai/ folder. This is the recommended way to deploy ohai plugins (as long as your chef server is v12.18.14 or later)

### Background
The ohai folder in a cookbook can be used as source of custom Ohai plugins written to load additional information about your nodes to be used in recipes.
