## Demo Flutter app using Deno as backend

1. Install **Deno** from the [official site](https://deno.land/)

2. Replace the *hostname* IP with your local network's IP address in `/backend-deno/index.ts` (Line 11)

3. Inside the backend folder, run:
```
drun --entryPoint=./index.ts --cwd=./
```

4. Run the Flutter app