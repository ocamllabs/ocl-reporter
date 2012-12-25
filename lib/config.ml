open Printf

let access_token =
  match Lwt_main.run (Github_cookie_jar.get ~name:"ocl-reporter") with
  |None ->
    printf "No Github access cookie found.\n";
    printf "You need use `git jar` to create an `ocl-reporter` token, by:\n\n";
    printf "$ git jar make <username>\n";
    printf "$ git jar show <username>\n";
    printf "   (find the just-created token and copy the id)\n\n";
    printf "$ git jar save <username> <id> ocl-reporter\n\n";
    printf "This should create a file in $HOME/.github/ocl-reporter with the token.\n";
    exit 1
  |Some a -> Github.Token.of_auth a
