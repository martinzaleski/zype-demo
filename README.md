# README

**a. Explain how the site will function from a broad level. Describe the architecture of
the app and how it will communicate with the Zype api.**

The site will work with a classic MVC / SSR architecture, using the Zype API as data source instead of a regular database.
Therefore, the site will function as a proxy between the client and the Zype API. Client will communicate with the site, and the site will communicate with the Zype API on the back.

**Give an overview of the models and controllers. Describe where various portions
of the functionality and logic will be. You can use diagrams if you would like.**

I've decided use the `her` gem that allows to treat with API resources as if they were regular ActiveRecord objects. This brings several benefits as it lets you reduce boilerplate to connect to the API, as well as seamlessly switch between datasources without changing the business logic, if required. 
To authenticate the user I used the gem `oauth2` which let me intearact swiftly with the login endpoint using the `password` strategy flow.

The business logic of the app is concentrated on the models and other helper classes while the controllers are in charge of communicating my app views with their corresponding business classes.

<br/>

**Note**

I tried to check video entitlements to know whether or not to display the video to the user, but didn't get the API to respond with the expected `200` or `422` responses but with a `403`, so I assumed I would never get the user to be entitled to a video, so I commented out this code.
