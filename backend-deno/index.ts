import {
    Application,
    Router
} from "https://deno.land/x/denotrain@v0.4.4/mod.ts";

import {
    quotes
} from "./quotes.ts";

// use your local IP address as hostname
const app = new Application({ hostname: "192.168.0.113"}); 
const router = new Router();

app.use("/api", router);

app.get("/", (ctx) => {
    return "Hello World";
});

router.get("/quotes", (ctx) => {
    return { "quotes": quotes };
});

await app.run(); 