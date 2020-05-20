import { Application, Router } from "https://deno.land/x/denotrain@v0.4.4/mod.ts";

const app = new Application({});

const router  = new Router();

app.get("/", (ctx) => {
    return "Hello World";
});

await app.run(); 