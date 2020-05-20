## Demo Flutter app using Deno as backend

*Deno* is a simple, modern and secure runtime for JavaScript and TypeScript that uses V8 and is built in Rust.

---------------------------
### How to run?
1. Install **Deno** from the [official site](https://deno.land/)

2. Replace the *hostname* IP with your local network's IP address in `/backend-deno/index.ts` (Line 11)

3. Inside the backend folder, run:
```
drun --entryPoint=./index.ts --cwd=./
```

4. Run the Flutter app