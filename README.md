# CF APP

This is a Swift app exercise which fetches users' info using the Codeforces API. Info is displayed using List and a detail view with NavigationStack

### API:

The endpoint used is for the user.info method. It returns a list of User objects, all documented in the Codeforces API's website.

Link to endpoint used: https://codeforces.com/api/user.info?handles=chaibn;pyoro;Realex78;gamby&checkHistoricHandles=false

Link to method documentation: https://codeforces.com/apiHelp/methods#user.info

### How to run:

Download and open the app using Xcode, at least version XX (which it was made with). The preview should load automatically. Since the URL itself contains the target users, the API call will fetch on running.
To change the users that are shown for customization, change the list separated with semicolons after the "handles=" part of the URL.

### Enjoy! :)
