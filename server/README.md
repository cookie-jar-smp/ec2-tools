# Minecraft Server

Contains the `scripts`/`startup daemons` to manage and automate the server

### Start
`start.sh` is run by [`mc.service`](https://github.com/cookie-jar-smp/ec2-tools/blob/main/server/src/services/mc.service)

### Execute A Server Command
Running `execute.sh` with an argument will send it to `stdin` of the Minecraft Server.
```bash
bash execute.sh {help | kill [player] | your command }
```
I suggest running this with `tail -F out` so you can see the live output of your command.

### Stop
You can send `stop` via `execute.sh` but I suggest deploy the [Cloud Functions](https://github.com/cookie-jar-smp/the-full-jar/tree/main/functions) to automatically stop the instance.
